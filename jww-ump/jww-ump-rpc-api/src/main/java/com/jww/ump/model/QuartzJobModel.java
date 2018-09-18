package com.jww.ump.model;

import com.jww.common.core.base.BaseModel;
import lombok.Data;

/**
 * Created by aihuihsou on 2018/9/18.
 */
@Data
public class QuartzJobModel extends BaseModel {
    public static final Integer STATUS_RUNNING = 1;
    public static final Integer STATUS_NOT_RUNNING = 0;
    public static final Integer CONCURRENT_IS = 1;
    public static final Integer CONCURRENT_NOT = 0;
    // 任务名称
    private String jobName;

    // 任务所在组
    private String jobGroup;

    // 任务类名称
    private String jobClassName;

    // 触发器名称
    private String triggerName;

    // 触发器所在组
    private String triggerGroup;

    // cron表达式
    private String cronExpression;

    // 时区
    private String timeZoneId;

    // 状态
    private String status;


}
