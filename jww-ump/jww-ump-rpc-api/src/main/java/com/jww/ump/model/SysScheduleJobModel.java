package com.jww.ump.model;

import com.jww.common.core.base.BaseModel;
import lombok.Data;

import java.util.Date;

/**
 * Created by ThinkPad on 2018/9/18.
 */
@Data
public class SysScheduleJobModel extends BaseModel {
    private String jobName;
    private String jobGroup;
    private String jobDescription;
    private String jobStatus;
    private String cronExpression;
    private Date previousFireTime;
    private Date nextFireTime;

}
