package com.jww.ump.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.jww.common.core.base.BaseModel;

/**
 * <p>
 * 定时任务
 * </p>
 *
 * @author kevinWang
 * @since 2018-09-18
 */
@TableName("sys_schedule_job")
public class SysScheduleJobModel extends BaseModel {

    private static final long serialVersionUID = 1L;

    public static final String JOB_PARAM_KEY = "JOB_PARAM_KEY";

    /**
     * spring bean名称
     */
    @TableField("bean_name")
    private String beanName;
    /**
     * 方法名
     */
    @TableField("method_name")
    private String methodName;
    /**
     * 参数
     */
    private String params;
    /**
     * cron表达式
     */
    @TableField("cron_expression")
    private String cronExpression;
    /**
     * 任务状态  0：正常  1：暂停
     */
    private Integer status;


    public String getBeanName() {
        return beanName;
    }

    public void setBeanName(String beanName) {
        this.beanName = beanName;
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public String getParams() {
        return params;
    }

    public void setParams(String params) {
        this.params = params;
    }

    public String getCronExpression() {
        return cronExpression;
    }

    public void setCronExpression(String cronExpression) {
        this.cronExpression = cronExpression;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "SysScheduleJob{" +
        ", beanName=" + beanName +
        ", methodName=" + methodName +
        ", params=" + params +
        ", cronExpression=" + cronExpression +
        ", status=" + status +
        "}";
    }
}
