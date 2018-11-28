package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

/**
 * td_paymentflow
 */
@Table(name = "td_paymentflow")
public class Paymentflow extends BasePojo {
    /**
     * 用户支付流水表
     */
    @Id
    private String paymentflow_id;

    /**
     * 用户id
     */
    private String userId;
    /**
     * 支付成功微信返回的订单号
     */
    private String paymentNo;

    /**
     * 本次支付金额
     */
    private BigDecimal putMoney;

    /**
     * 支付时间
     */
    private Date putTime;
    /**
     * 支付类型 0 : 1元认证，1:支付给平台
     */
    private Integer status;

    /**
     * 备注
     */
    private String remark;

    /**
     * 备注
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark 备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 支付成功微信返回的订单号
     */
    public String getPaymentNo() {
        return paymentNo;
    }

    /**
     * 支付成功微信返回的订单号
     *
     * @param paymentNo 订单号
     */
    public void setPaymentNo(String paymentNo) {
        this.paymentNo = paymentNo;
    }

    /**
     * 用户id
     *
     * @return user_id
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 用户id
     *
     * @param userId
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * 本次支付金额
     *
     * @return put_money
     */
    public BigDecimal getPutMoney() {
        return putMoney;
    }

    /**
     * 本次支付金额
     *
     * @param putMoney
     */
    public void setPutMoney(BigDecimal putMoney) {
        this.putMoney = putMoney;
    }

    /**
     * 支付时间
     *
     * @return put_time
     */
    public Date getPutTime() {
        return putTime;
    }

    /**
     * 支付时间
     *
     * @param putTime
     */
    public void setPutTime(Date putTime) {
        this.putTime = putTime;
    }

    public String getPaymentflow_id() {
        return paymentflow_id;
    }

    public void setPaymentflow_id(String paymentflow_id) {
        this.paymentflow_id = paymentflow_id;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public Paymentflow init() {
        this.paymentflow_id = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
        return this;
    }

}