package com.jww.quartz.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.jww.common.core.base.BaseModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 定时任务日志
 * </p>
 *
 * @author kevinWang
 * @since 2018-09-29
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("sys_schedule_job_log")
public class SysScheduleJobLogModel extends BaseModel {

    private static final long serialVersionUID = 1L;

    /**
     * 任务id
     */
    @TableField("job_id")
    private Long jobId;
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
     * 任务状态    0：成功    1：失败
     */
    private Integer status;
    /**
     * 失败信息
     */
    private String error;
    /**
     * 耗时(单位：毫秒)
     */
    private Integer times;


}
