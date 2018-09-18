package com.jww.ump.rpc.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.jww.common.core.Constants;
import com.jww.common.core.base.BaseServiceImpl;
import com.jww.common.quartz.utils.ScheduleJob;
import com.jww.ump.dao.mapper.SysScheduleJobMapper;
import com.jww.ump.model.SysScheduleJobModel;
import com.jww.ump.rpc.api.SysScheduleJobService;
import lombok.extern.slf4j.Slf4j;
import org.quartz.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 定时任务 服务实现类
 * </p>
 *
 * @author kevinWang
 * @since 2018-09-18
 */

@Slf4j
@Service("sysScheduleJobService")
public class SysScheduleJobServiceImpl extends BaseServiceImpl<SysScheduleJobMapper, SysScheduleJobModel> implements SysScheduleJobService {
    private final static String JOB_NAME = "TASK_";

    @Autowired
    private Scheduler scheduler;

    @Override
    public Page<SysScheduleJobModel> selectPage(Page<SysScheduleJobModel> page) {
        SysScheduleJobModel sysScheduleJobModel = new SysScheduleJobModel();
        sysScheduleJobModel.setIsDel(0);
        EntityWrapper<SysScheduleJobModel> entityWrapper = new EntityWrapper<>(sysScheduleJobModel);
        if (ObjectUtil.isNotNull(page.getCondition())) {
            StringBuilder conditionSql = new StringBuilder();
            Map<String, Object> paramMap = page.getCondition();
            paramMap.forEach((k, v) -> {
                if (StrUtil.isNotBlank(v + "")) {
                    conditionSql.append(k + " like '%" + v + "%' AND ");
                }
            });
            entityWrapper.and(StrUtil.removeSuffix(conditionSql.toString(), "AND "));
        }
        page.setCondition(null);
        return super.selectPage(page, entityWrapper);
    }

    @Transactional(rollbackFor = Exception.class)
    public boolean deleteBatchIds(List<? extends Serializable> idList) {

        List<SysScheduleJobModel> sysScheduleJobModelList = new ArrayList<SysScheduleJobModel>();
        idList.forEach(id -> {
            SysScheduleJobModel entity = new SysScheduleJobModel();
            entity.setId((Long) id);
            entity.setIsDel(1);
            entity.setUpdateTime(new Date());
            sysScheduleJobModelList.add(entity);
            try {
                scheduler.deleteJob(getJobKey((Long) id));
            } catch (Exception e) {
                throw new RuntimeException("删除定时任务失败", e);
            }
        });
        return super.updateBatchById(sysScheduleJobModelList);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public SysScheduleJobModel add(SysScheduleJobModel entity) {
        entity.setCreateTime(new Date());
        entity.setStatus(Constants.ScheduleStatus.NORMAL.getValue());
        super.add(entity);
        try {
            //构建job
            JobDetail jobDetail = JobBuilder.newJob(ScheduleJob.class).withIdentity(getJobKey(entity.getId())).build();

            //构建cron
            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(entity.getCronExpression())
                    .withMisfireHandlingInstructionDoNothing();

            //根据cron，构建一个CronTrigger
            CronTrigger trigger = TriggerBuilder.newTrigger().withIdentity(getTriggerKey(entity.getId())).
                    withSchedule(scheduleBuilder).build();

            //放入参数，运行时的方法可以获取
            jobDetail.getJobDataMap().put(SysScheduleJobModel.JOB_PARAM_KEY, JSONObject.toJSONString(entity));

            scheduler.scheduleJob(jobDetail, trigger);
            //暂停任务
            if (entity.getStatus() == Constants.ScheduleStatus.PAUSE.getValue()) {
                pauseJob(scheduler, entity.getId());
            }
        } catch (SchedulerException e) {
            throw new RuntimeException("创建定时任务失败", e);
        }
        return entity;
    }

    @Override
    public SysScheduleJobModel modifyById(SysScheduleJobModel entity) {
        try {
            entity = super.modifyById(entity);
            TriggerKey triggerKey = getTriggerKey(entity.getId());

            //表达式调度构建器
            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(entity.getCronExpression())
                    .withMisfireHandlingInstructionDoNothing();

            CronTrigger trigger = getCronTrigger(scheduler, entity.getId());

            //按新的cronExpression表达式重新构建trigger
            trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();

            //参数
            trigger.getJobDataMap().put(SysScheduleJobModel.JOB_PARAM_KEY, JSONObject.toJSONString(entity));

            scheduler.rescheduleJob(triggerKey, trigger);

            //暂停任务
            if (entity.getStatus() == Constants.ScheduleStatus.PAUSE.getValue()) {
                pauseJob(scheduler, entity.getId());
            }
            return entity;
        } catch (SchedulerException e) {
            throw new RuntimeException("更新定时任务失败", e);
        }
    }

    @Override
    public void run(Long[] jobIds) {
        for (Long jobId : jobIds) {
            try {
                SysScheduleJobModel entity = queryById(jobId);
                //参数
                JobDataMap dataMap = new JobDataMap();
                dataMap.put(SysScheduleJobModel.JOB_PARAM_KEY, JSONObject.toJSONString(queryById(jobId)));
                scheduler.triggerJob(getJobKey(entity.getId()), dataMap);
            } catch (SchedulerException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void resume(Long[] jobIds) {

    }

    @Override
    public void pause(Long[] jobIds) {

    }

    /**
     * 暂停任务
     */
    public static void pauseJob(Scheduler scheduler, Long jobId) {
        try {
            scheduler.pauseJob(getJobKey(jobId));
        } catch (SchedulerException e) {
            throw new RuntimeException("暂停定时任务失败", e);
        }
    }

    /**
     * 获取触发器key
     */
    private static TriggerKey getTriggerKey(Long jobId) {
        return TriggerKey.triggerKey(JOB_NAME + jobId);
    }

    /**
     * 获取jobKey
     */
    private static JobKey getJobKey(Long jobId) {
        return JobKey.jobKey(JOB_NAME + jobId);
    }

    /**
     * 获取表达式触发器
     */
    public static CronTrigger getCronTrigger(Scheduler scheduler, Long jobId) {
        try {
            return (CronTrigger) scheduler.getTrigger(getTriggerKey(jobId));
        } catch (SchedulerException e) {
            throw new RuntimeException("getCronTrigger异常，请检查qrtz开头的表，是否有脏数据", e);
        }
    }
}
