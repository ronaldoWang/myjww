package com.jww.quartz.utils;

import com.alibaba.fastjson.JSONObject;
import com.jww.common.core.util.SpringContextUtils;
import com.jww.quartz.model.SysScheduleJobLogModel;
import com.jww.quartz.model.SysScheduleJobModel;
import com.jww.quartz.rpc.api.SysScheduleJobLogService;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;

import java.util.Date;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;


/**
 * 定时任务
 *
 * @author czx
 * @email object_czx@163.com
 * @date 2016年11月30日 下午12:44:21
 */
public class ScheduleJob extends QuartzJobBean {
    private Logger logger = LoggerFactory.getLogger(getClass());
    private ExecutorService service = Executors.newSingleThreadExecutor();

    @Autowired
    SysScheduleJobLogService sysScheduleJobLogService = (SysScheduleJobLogService) SpringContextUtils.getBean("sysScheduleJobLogService");

    @Override
    protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
        String jsonJob = context.getMergedJobDataMap().getString(SysScheduleJobModel.JOB_PARAM_KEY);
        SysScheduleJobModel scheduleJob = JSONObject.parseObject(jsonJob, SysScheduleJobModel.class);
        //数据库保存执行记录
        SysScheduleJobLogModel log = new SysScheduleJobLogModel();
        log.setJobId(scheduleJob.getId());
        log.setBeanName(scheduleJob.getBeanName());
        log.setMethodName(scheduleJob.getMethodName());
        log.setParams(scheduleJob.getParams());
        log.setCreateTime(new Date());
        //任务开始时间
        long startTime = System.currentTimeMillis();
        try {
            //执行任务
            logger.info("任务准备执行，任务ID：" + scheduleJob.getId());
            ScheduleRunnable task = new ScheduleRunnable(scheduleJob.getBeanName(),
                    scheduleJob.getMethodName(), scheduleJob.getParams());
            Future<?> future = service.submit(task);
            future.get();
            //任务执行总时长
            long times = System.currentTimeMillis() - startTime;
            log.setTimes((int) times);
            //任务状态    0：成功    1：失败
            log.setStatus(0);
            logger.info("任务执行完毕，任务ID：" + scheduleJob.getId() + "  总共耗时：" + times + "毫秒");
        } catch (Exception e) {
            logger.error("任务执行失败，任务ID：" + scheduleJob.getId(), e);
            //任务执行总时长
            long times = System.currentTimeMillis() - startTime;
            log.setTimes((int) times);
            //任务状态    0：成功    1：失败
            log.setStatus(1);
            log.setError(e.toString());
        } finally {
            sysScheduleJobLogService.insert(log);
        }
    }
}
