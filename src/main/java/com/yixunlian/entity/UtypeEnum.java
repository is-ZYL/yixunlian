package com.yixunlian.entity;

import com.sun.org.apache.bcel.internal.generic.NEW;

import java.math.BigDecimal;

/**
 * created with Intellij IDEA
 *
 * @author : yuanyuana
 * Date : 2018-10-11
 * Time : 16:18
 */
public enum UtypeEnum {

    /**
     * 用户等级信息
     */
    COMMON_USERS("1", "普通用户", 0, new BigDecimal("0"), ""),

    GENERAL_ACCOUNT_MANAGER("2", "普通客户经理", 365, new BigDecimal("749"), ""),

    VIP_CUSTOMER_MANAGER("3", "VIP客户经理", 365, new BigDecimal("1064"), ""),

    VIP_experience_CUSTOMER_MANAGER("4", "VIP体验客户经理", 7, new BigDecimal("0"), ""),

    VIP_TRY_CUSTOMER_MANAGER("5", "VIP试用客户经理", 50, new BigDecimal("100"), ""),

    VIP_DIAMONDS_CUSTOMER_MANAGER_DAY("6", "钻石客户经理", 365, new BigDecimal("0"), "2");

    private String utypeId;
    private String userType;
    private Integer userDay;
    private BigDecimal utypeCharge;
    private String remark;

    UtypeEnum(String utypeId, String userType, Integer userDay, BigDecimal utypeCharge, String remark) {
        this.utypeId = utypeId;
        this.userType = userType;
        this.userDay = userDay;
        this.utypeCharge = utypeCharge;
        this.remark = remark;
    }

    @Override
    public String toString() {  //自定义的public方法
        return super.toString() + "(" + utypeId + "," + userType + "," + userDay + "," + utypeCharge.toString() + "," + remark + ")";
    }

    public String getUtypeId() {
        return utypeId;
    }

    public void setUtypeId(String utypeId) {
        this.utypeId = utypeId;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public Integer getUserDay() {
        return userDay;
    }

    public void setUserDay(Integer userDay) {
        this.userDay = userDay;
    }

    public BigDecimal getUtypeCharge() {
        return utypeCharge;
    }

    public void setUtypeCharge(BigDecimal utypeCharge) {
        this.utypeCharge = utypeCharge;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}

