package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

/**
 * td_umoney
 */
@Table(name = "td_umoney")
public class Umoney extends BasePojo {
    /**
     * 用户提现流水表
     */
    @Id
    private String umoneyId;

    /**
     * 用户id
     */
    private String userId;
    /**
     * 提现成功微信返回的订单号
     */
    private String paymentNo;

    /**
     * 本次提现金额
     */
    private BigDecimal putMoney;

    /**
     * 提现时间
     */
    private Date putTime;

    /**
     * 实际到账金额
     */
    private BigDecimal actualarrivalAmount;

    /**
     * 本次提现的税率，关联税率表
     */
    private String taxrevenueId;

    /**
     * 提现状态： 0 提现成功 ，1 提现失败
     */
    private Integer putStatus;

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
     * 用户现金类型
     *
     * @return umoney_id
     */
    public String getUmoneyId() {
        return umoneyId;
    }

    /**
     * 用户现金类型
     *
     * @param umoneyId
     */
    public void setUmoneyId(String umoneyId) {
        this.umoneyId = umoneyId == null ? null : umoneyId.trim();
    }

    /**
     * 提现成功微信返回的订单号
     */
    public String getPaymentNo() {
        return paymentNo;
    }

    /**
     * 提现成功微信返回的订单号
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
     * 本次提现金额
     *
     * @return put_money
     */
    public BigDecimal getPutMoney() {
        return putMoney;
    }

    /**
     * 本次提现金额
     *
     * @param putMoney
     */
    public void setPutMoney(BigDecimal putMoney) {
        this.putMoney = putMoney;
    }

    /**
     * 提现时间
     *
     * @return put_time
     */
    public Date getPutTime() {
        return putTime;
    }

    /**
     * 提现时间
     *
     * @param putTime
     */
    public void setPutTime(Date putTime) {
        this.putTime = putTime;
    }

    /**
     * 实际到账金额
     *
     * @return actualarrival_amount
     */
    public BigDecimal getActualarrivalAmount() {
        return actualarrivalAmount;
    }

    /**
     * 实际到账金额
     *
     * @param actualarrivalAmount
     */
    public void setActualarrivalAmount(BigDecimal actualarrivalAmount) {
        this.actualarrivalAmount = actualarrivalAmount;
    }

    /**
     * 本次提现的税率，关联税率表
     *
     * @return taxrevenue_id
     */
    public String getTaxrevenueId() {
        return taxrevenueId;
    }

    /**
     * 本次提现的税率，关联税率表
     *
     * @param taxrevenueId
     */
    public void setTaxrevenueId(String taxrevenueId) {
        this.taxrevenueId = taxrevenueId == null ? null : taxrevenueId.trim();
    }

    public Integer getPutStatus() {
        return putStatus;
    }

    public void setPutStatus(Integer putStatus) {
        this.putStatus = putStatus;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public Umoney init() {
        this.umoneyId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
        return this;
    }

}