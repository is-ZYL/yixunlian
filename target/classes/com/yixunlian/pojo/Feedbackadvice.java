package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_feedbackadvice
 */
@Table(name = "td_feedbackadvice")
public class Feedbackadvice extends BasePojo {
    /**
     * 反馈建议
     */
    private String feedbackadviceId;

    /**
     * 建议图片
     */
    private String feedbackadviceImgurl;

    /**
     * 那个建议的
     */
    private String userId;

    /**
     * 反馈建议联系方式
     */
    private String advicePhone;

    /**
     * 建议内容
     */
    private String feedbackadviceContext;

    /**
     * 反馈建议是否采纳,默认0为未采纳，1为已经采纳
     */
    private Integer isAdopt;
    /**
     * 反馈建议是否已经查阅，默认为0未查阅，1已经查阅
     */

    private Integer isAlreadyConsulted;
    /**
     * 备注
     */
    private String remark;

    public Integer getIsAlreadyConsulted() {
        return isAlreadyConsulted;
    }

    public void setIsAlreadyConsulted(Integer isAlreadyConsulted) {
        this.isAlreadyConsulted = isAlreadyConsulted;
    }

    public Integer getIsAdopt() {
        return isAdopt;
    }

    public void setIsAdopt(Integer isAdopt) {
        this.isAdopt = isAdopt;
    }

    /**
     * 反馈建议
     *
     * @return feedbackadvice_id
     */
    public String getFeedbackadviceId() {
        return feedbackadviceId;
    }

    /**
     * 反馈建议
     *
     * @param feedbackadviceId
     */
    public void setFeedbackadviceId(String feedbackadviceId) {
        this.feedbackadviceId = feedbackadviceId == null ? null : feedbackadviceId.trim();
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

    /**
     * 建议图片
     *
     * @return feedbackadvice_imgurl
     */
    public String getFeedbackadviceImgurl() {
        return feedbackadviceImgurl;
    }

    /**
     * 建议图片
     *
     * @param feedbackadviceImgurl
     */
    public void setFeedbackadviceImgurl(String feedbackadviceImgurl) {
        this.feedbackadviceImgurl = feedbackadviceImgurl == null ? null : feedbackadviceImgurl.trim();
    }

    /**
     * 那个建议的
     *
     * @return user_id
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 那个建议的
     *
     * @param userId
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * 反馈建议联系方式
     *
     * @return advice_phone
     */
    public String getAdvicePhone() {
        return advicePhone;
    }

    /**
     * 反馈建议联系方式
     *
     * @param advicePhone
     */
    public void setAdvicePhone(String advicePhone) {
        this.advicePhone = advicePhone == null ? null : advicePhone.trim();
    }

    /**
     * 建议内容
     *
     * @return feedbackadvice_context
     */
    public String getFeedbackadviceContext() {
        return feedbackadviceContext;
    }

    /**
     * 建议内容
     *
     * @param feedbackadviceContext
     */
    public void setFeedbackadviceContext(String feedbackadviceContext) {
        this.feedbackadviceContext = feedbackadviceContext == null ? null : feedbackadviceContext.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public Feedbackadvice init() {
        this.feedbackadviceId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
        this.setIsAdopt(0);
        this.setIsAlreadyConsulted(0);
        return this;
    }
}