package com.jww.ump.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.jww.common.core.base.BaseModel;
import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Size;

/**
 * <p>
 * 全局参数表
 * </p>
 *
 * @author haoxi.wang
 * @since 2017-12-24
 */
@Data
@TableName("sys_param")
public class SysParamModel extends BaseModel {

    private static final long serialVersionUID = 1L;

    @NotBlank(message = "参数类型名称不能为空")
    @Size(min = 0, max = 50, message = "参数类型长度必须在1至50之间")
    @TableField("param_type")
    private String paramType;

    /**
     * 参数键名
     */
    @NotBlank(message = "参数名称不能为空")
    @Size(min = 1, max = 50, message = "参数名称长度必须在1至50之间")
    @TableField("param_key")
    private String paramKey;
    /**
     * 参数键值
     */
    @NotBlank(message = "参数值不能为空")
    @Size(min = 1, max = 100, message = "参数值长度必须在1至100之间")
    @TableField("param_value")
    private String paramValue;
    /**
     * 扩展参数键值
     */
    @Size(min = 0, max = 1000, message = "参数扩展值长度必须在0至1000之间")
    @TableField("param_value_extend")
    private String paramValueExtend;

    /**
     * 附件url地址
     */
    @Size(max = 2000, message = "附件url地址长度不能大于2000")
    @TableField("param_url")
    private String paramUrl;

    /**
     * 是否启用
     */
    @TableField("enable_")
    private Integer enable;
    /**
     * 是否删除(0:未删除;1:已删除)
     */
    @TableField("is_del")
    private Integer isDel;
    /**
     * 备注
     */
    @TableField("remark_")
    private String remark;
}
