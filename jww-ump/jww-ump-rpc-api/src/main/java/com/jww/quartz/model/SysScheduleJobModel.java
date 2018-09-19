package com.jww.quartz.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.jww.common.core.base.BaseModel;
import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

import java.io.Serializable;
import java.util.Date;

/**
 * 定时器
 *
 * @author czx
 * @email object_czx@163.com
 * @date 2016年11月28日 下午12:54:44
 */
@Data
@TableName("sys_schedule_job")
public class SysScheduleJobModel extends BaseModel {
    private static final long serialVersionUID = 1L;

    /**
     * 任务调度参数key
     */
    public static final String JOB_PARAM_KEY = "JOB_PARAM_KEY";

    /**
     * spring bean名称
     */
    @NotBlank(message = "bean名称不能为空")
    @TableField("bean_name")
    private String beanName;

    /**
     * 方法名
     */
    @NotBlank(message = "方法名称不能为空")
    @TableField("method_name")
    private String methodName;

    /**
     * 参数
     */
    @TableField("params")
    private String params;

    /**
     * cron表达式
     */
    @NotBlank(message = "cron表达式不能为空")
    @TableField("cron_expression")
    private String cronExpression;

    /**
     * 任务状态  0：正常  1：暂停
     */
    @TableField("status")
    private Integer status;

    /**
     * 备注
     */
    @TableField("remark")
    private String remark;

}
