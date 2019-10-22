package com.jww.quartz.rpc.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.jww.common.core.Constants;
import com.jww.common.core.base.BaseServiceImpl;
import com.jww.quartz.dao.mapper.SysScheduleJobMapper;
import com.jww.quartz.model.SysScheduleJobModel;
import com.jww.quartz.rpc.api.SysScheduleJobService;
import com.jww.quartz.utils.ScheduleUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Service;
import org.quartz.CronTrigger;
import org.quartz.Scheduler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.io.Serializable;
import java.util.*;

/**
 * <p>
 * 定时任务 服务实现类
 * </p>
 *
 * @author kevinWang
 * @since 2018-09-18
 */

@Slf4j
@Service
public class SysScheduleJobServiceImpl extends BaseServiceImpl<SysScheduleJobMapper, SysScheduleJobModel> implements SysScheduleJobService {
    private final static String JOB_NAME = "TASK_";

    @Autowired
    private Scheduler scheduler;

    @PostConstruct
    public void init() {
        List<SysScheduleJobModel> scheduleJobList = selectByMap(new HashMap<>());
        for (SysScheduleJobModel scheduleJob : scheduleJobList) {
            CronTrigger cronTrigger = ScheduleUtils.getCronTrigger(scheduler, scheduleJob.getId());
            //如果不存在，则创建
            if (cronTrigger == null) {
                ScheduleUtils.createScheduleJob(scheduler, scheduleJob);
            } else {
                ScheduleUtils.updateScheduleJob(scheduler, scheduleJob);
            }
        }
    }

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
            ScheduleUtils.deleteScheduleJob(scheduler, (Long) id);
        });
        return super.updateBatchById(sysScheduleJobModelList);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public SysScheduleJobModel add(SysScheduleJobModel entity) {
        entity.setCreateTime(new Date());
        entity.setStatus(Constants.ScheduleStatus.NORMAL.getValue());
        super.add(entity);
        ScheduleUtils.createScheduleJob(scheduler, entity);
        return entity;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public SysScheduleJobModel modifyById(SysScheduleJobModel entity) {
        entity = super.modifyById(entity);
        ScheduleUtils.updateScheduleJob(scheduler, entity);
        return entity;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void run(Long[] jobIds) {
        for (Long jobId : jobIds) {
            ScheduleUtils.run(scheduler, selectById(jobId));
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void resume(Long[] jobIds) {
        List<SysScheduleJobModel> list = new ArrayList<>();
        for (Long jobId : jobIds) {
            ScheduleUtils.resumeJob(scheduler, jobId);
            SysScheduleJobModel entity = new SysScheduleJobModel();
            entity.setId(jobId);
            entity.setStatus(Constants.ScheduleStatus.NORMAL.getValue());
            list.add(entity);
        }
        updateBatchById(list);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void pause(Long[] jobIds) {
        List<SysScheduleJobModel> list = new ArrayList<>();
        for (Long jobId : jobIds) {
            ScheduleUtils.pauseJob(scheduler, jobId);
            SysScheduleJobModel entity = new SysScheduleJobModel();
            entity.setId(jobId);
            entity.setStatus(Constants.ScheduleStatus.PAUSE.getValue());
            list.add(entity);
        }
        updateBatchById(list);
    }

}
