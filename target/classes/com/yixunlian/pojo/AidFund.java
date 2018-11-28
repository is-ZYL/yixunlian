package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

/**
 * td_aid_fund
 */
@Table(name = "td_aid_fund")
public class AidFund extends BasePojo {
    /**
     * 助创基金记录表
     */
    @Id
    private String afId;

    /**
     * 支出金额
     */
    private BigDecimal backgroundTransferMoney;

    /**
     * 支付给谁
     */
    private String userId;

    /**
     * 提成活动id
     */
    private String activityId;

    /**
     *
     */
    private Date created;

    /**
     *
     */
    private Date updated;

    /**
     * 转账类型  1 等级升级  2 活动提成
     */
    private Integer transferType;

    /**
     * 转账单号
     */
    private String transferSingleNumber;

    /**
     * 转账时间
     */
    private Date transfTime;

    /**
     * 支付方式
     */
    private String paymentMethod;

    /**
     * 支付状态 1 支付成功 ，2 支付失败
     */
    private Integer paymentStatus;

    /**
     * 备注
     */
    private String remark;

    public static AidFund getAidFund() {
        return new AidFund();
    }

    /**
     * 助创基金记录表
     *
     * @return af_id
     */
    public String getAfId() {
        return afId;
    }

    /**
     * 助创基金记录表
     *
     * @param afId
     */
    public void setAfId(String afId) {
        this.afId = afId == null ? null : afId.trim();
    }

    /**
     * 支出金额
     *
     * @return background_transfer_money
     */
    public BigDecimal getBackgroundTransferMoney() {
        return backgroundTransferMoney;
    }

    /**
     * 支出金额
     *
     * @param backgroundTransferMoney
     */
    public void setBackgroundTransferMoney(BigDecimal backgroundTransferMoney) {
        this.backgroundTransferMoney = backgroundTransferMoney;
    }

    /**
     * 支付给谁
     *
     * @return user_id
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 支付给谁
     *
     * @param userId
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * 提成活动id
     *
     * @return activity_id
     */
    public String getActivityId() {
        return activityId;
    }

    /**
     * 提成活动id
     *
     * @param activityId
     */
    public void setActivityId(String activityId) {
        this.activityId = activityId == null ? null : activityId.trim();
    }

    /**
     * 转账类型  1 等级升级  2 活动提成
     *
     * @return transfer_type
     */
    public Integer getTransferType() {
        return transferType;
    }

    /**
     * 转账类型  1 等级升级  2 活动提成
     *
     * @param transferType
     */
    public void setTransferType(Integer transferType) {
        this.transferType = transferType;
    }

    /**
     * 转账单号
     *
     * @return transfer_single_number
     */
    public String getTransferSingleNumber() {
        return transferSingleNumber;
    }

    /**
     * 转账单号
     *
     * @param transferSingleNumber
     */
    public void setTransferSingleNumber(String transferSingleNumber) {
        this.transferSingleNumber = transferSingleNumber == null ? null : transferSingleNumber.trim();
    }

    /**
     * 转账时间
     *
     * @return transf_time
     */
    public Date getTransfTime() {
        return transfTime;
    }

    /**
     * 转账时间
     *
     * @param transfTime
     */
    public void setTransfTime(Date transfTime) {
        this.transfTime = transfTime;
    }

    /**
     * 支付方式
     *
     * @return payment_method
     */
    public String getPaymentMethod() {
        return paymentMethod;
    }

    /**
     * 支付方式
     *
     * @param paymentMethod
     */
    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod == null ? null : paymentMethod.trim();
    }

    /**
     * 支付状态 1 支付成功 ，2 支付失败
     *
     * @return payment_status
     */
    public Integer getPaymentStatus() {
        return paymentStatus;
    }

    /**
     * 支付状态 1 支付成功 ，2 支付失败
     *
     * @param paymentStatus
     */
    public void setPaymentStatus(Integer paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    /**
     * 备注
     *
     * @return remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 备注
     *
     * @param remark
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public AidFund init() {
        this.afId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
        return this;
    }
}