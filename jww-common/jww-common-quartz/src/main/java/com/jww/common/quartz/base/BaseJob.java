package com.jww.common.quartz.base;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

/**
 * Created by ThinkPad on 2018/9/18.
 */
public interface BaseJob extends Job {
    @Override
    void execute(JobExecutionContext context) throws JobExecutionException;
}
