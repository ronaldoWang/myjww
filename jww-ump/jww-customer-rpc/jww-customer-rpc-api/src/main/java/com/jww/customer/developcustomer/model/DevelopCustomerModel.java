package com.jww.customer.developcustomer.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.jww.common.core.base.BaseModel;
import lombok.Data;

import javax.validation.constraints.Max;

/**
 * <p>
 * 待开发客户表
 * </p>
 *
 * @author kevinWang
 * @since 2018-09-16
 */
@Data
@TableName("t_develop_customer")
public class DevelopCustomerModel extends BaseModel {

    private static final long serialVersionUID = 1L;

    /**
     * 客户名称
     */
    @TableField("customer_name")
    private String customerName;
    /**
     * 客户编号
     */
    @TableField("customer_no")
    private String customerNo;
    /**
     * 性别
     */
    @Max(value = 1, message = "性别输入有误")
    private String sex;
    /**
     * 客户类型
     */
    @Max(value = 1, message = "客户类型输入有误")
    private String type;
    /**
     * 手机
     */
    @TableField("mobile_phone")
    private String mobilePhone;
    /**
     * 概况
     */
    private String summary;
    /**
     * 邮箱
     */
    private String email;
    @TableField("editable_")
    private Integer editable;


}
