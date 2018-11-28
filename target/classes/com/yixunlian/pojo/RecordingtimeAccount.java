package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

/**
 * td_recordingtime_account
 */
@Table(name = "td_recordingtime_account")
public class RecordingtimeAccount extends BasePojo {
    /**
     * 平台支付提成给用户可提现，时间金额记录表,进账表
     */
    @Id
    private String recordingtimeId;

    /**
     * 
     */
    private Date recordingtimeStart;

    /**
     * 
     */
    private Date recordingtimeEnd;

    /**
     * 进账金额
     */
    private BigDecimal accountAmount;

    /**
     * 关联用户表
     */
    private String userId;

    /**
     * 平台支付提成给用户可提现，时间金额记录表,进账表
     * @return recordingtime_id 
     */
    public String getRecordingtimeId() {
        return recordingtimeId;
    }

    /**
     * 平台支付提成给用户可提现，时间金额记录表,进账表
     * @param recordingtimeId 
     */
    public void setRecordingtimeId(String recordingtimeId) {
        this.recordingtimeId = recordingtimeId == null ? null : recordingtimeId.trim();
    }

    /**
     * 
     * @return recordingtime_start 
     */
    public Date getRecordingtimeStart() {
        return recordingtimeStart;
    }

    /**
     * 
     * @param recordingtimeStart 
     */
    public void setRecordingtimeStart(Date recordingtimeStart) {
        this.recordingtimeStart = recordingtimeStart;
    }

    /**
     * 
     * @return recordingtime_end 
     */
    public Date getRecordingtimeEnd() {
        return recordingtimeEnd;
    }

    /**
     * 
     * @param recordingtimeEnd 
     */
    public void setRecordingtimeEnd(Date recordingtimeEnd) {
        this.recordingtimeEnd = recordingtimeEnd;
    }

    /**
     * 进账金额
     * @return account_amount 
     */
    public BigDecimal getAccountAmount() {
        return accountAmount;
    }

    /**
     * 进账金额
     * @param accountAmount 
     */
    public void setAccountAmount(BigDecimal accountAmount) {
        this.accountAmount = accountAmount;
    }

    /**
     * 关联用户表
     * @return user_id 
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 关联用户表
     * @param userId 
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public void init() {
        this.recordingtimeId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }
}