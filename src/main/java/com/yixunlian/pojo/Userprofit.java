package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

/**
 * td_userprofit
 */
@Table(name = "td_userprofit")
public class Userprofit extends BasePojo {
    /**
     * 用户的提成表，
     */
    @Id
    private String profitId;

    /**
     * 提成金额
     */
    private BigDecimal acMoney;

    /**
     * 提成活动,关联活动表
     */
    private String activityId;

    /**
     * 支付时间即到待提现时间，待提现到可提现的开始冻结时间
     */
    private Date paymentTime;

    /**
     * 关联用户表id
     */
    private String userId;

    /**
     * 升级用户的id
     */
    private String upgradeUserId;

    /**
     * 待提现到可提现冻结时间的结束时间
     */
    private Date recordingtimeEnd;

    /**
     * 当前款项的状态（0 待提现 ，1 可提现 ，2 已提现）
     */
    private Integer moneyStatus;
    /**
     * 提成类型 0活动提成，1资源用户升级vip所得提成
     */
    private Integer profitStatus;
    /**
     * 备注
     */
    private String remark;

    public static Userprofit getUserprofit() {
        return new Userprofit();
    }

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

    public Integer getMoneyStatus() {
        return moneyStatus;
    }

    public void setMoneyStatus(Integer moneyStatus) {
        this.moneyStatus = moneyStatus;
    }

    /**
     * 用户的提成表，
     *
     * @return profit_id
     */
    public String getProfitId() {
        return profitId;
    }

    /**
     * 用户的提成表，
     *
     * @param profitId
     */
    public void setProfitId(String profitId) {
        this.profitId = profitId == null ? null : profitId.trim();
    }

    /**
     * 提成金额
     *
     * @return ac_money
     */
    public BigDecimal getAcMoney() {
        return acMoney;
    }

    /**
     * 提成金额
     *
     * @param acMoney
     */
    public void setAcMoney(BigDecimal acMoney) {
        this.acMoney = acMoney;
    }

    /**
     * 提成活动,关联活动表
     *
     * @return activity_id
     */
    public String getActivityId() {
        return activityId;
    }

    /**
     * 提成活动,关联活动表
     *
     * @param activityId
     */
    public void setActivityId(String activityId) {
        this.activityId = activityId == null ? null : activityId.trim();
    }

    /**
     * 支付时间即到待提现时间，待提现到可提现的开始冻结时间
     *
     * @return payment_time
     */
    public Date getPaymentTime() {
        return paymentTime;
    }

    /**
     * 支付时间即到待提现时间，待提现到可提现的开始冻结时间
     *
     * @param paymentTime
     */
    public void setPaymentTime(Date paymentTime) {
        this.paymentTime = paymentTime;
    }

    /**
     * 关联用户表id
     *
     * @return user_id
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 关联用户表id
     *
     * @param userId
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * 升级用户的id
     *
     * @return
     */
    public String getUpgradeUserId() {
        return upgradeUserId;
    }

    /**
     * 升级用户的id
     *
     * @param upgradeUserId
     */
    public void setUpgradeUserId(String upgradeUserId) {
        this.upgradeUserId = upgradeUserId;
    }

    /**
     * 提成类型 0活动提成，1资源用户升级vip所得提成
     *
     * @return
     */
    public Integer getProfitStatus() {
        return profitStatus;
    }

    /**
     * 提成类型 0活动提成，1资源用户升级vip所得提成
     *
     * @param profitStatus
     */
    public void setProfitStatus(Integer profitStatus) {
        this.profitStatus = profitStatus;
    }

    /**
     * 待提现到可提现冻结时间的结束时间
     *
     * @return recordingtime_end
     */
    public Date getRecordingtimeEnd() {
        return recordingtimeEnd;
    }

    /**
     * 待提现到可提现冻结时间的结束时间
     *
     * @param recordingtimeEnd
     */
    public void setRecordingtimeEnd(Date recordingtimeEnd) {
        this.recordingtimeEnd = recordingtimeEnd;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public Userprofit init() {
        this.profitId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
        return this;
    }
}