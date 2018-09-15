package com.jww.customer.developcustomer.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.jww.common.core.base.BaseModel;

/**
 * <p>
 * 待开发客户表
 * </p>
 *
 * @author kevinWang
 * @since 2018-09-16
 */
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
    private String sex;
    /**
     * 客户类型
     */
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


    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerNo() {
        return customerNo;
    }

    public void setCustomerNo(String customerNo) {
        this.customerNo = customerNo;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getEditable() {
        return editable;
    }

    public void setEditable(Integer editable) {
        this.editable = editable;
    }

    @Override
    public String toString() {
        return "DevelopCustomer{" +
        ", customerName=" + customerName +
        ", customerNo=" + customerNo +
        ", sex=" + sex +
        ", type=" + type +
        ", mobilePhone=" + mobilePhone +
        ", summary=" + summary +
        ", email=" + email +
        ", editable=" + editable +
        "}";
    }
}
