package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_userandreadingsurvey
 */
@Table(name = "td_userandreadingsurvey")
public class Userandreadingsurvey extends BasePojo {
    /**
     * 调研与用户的第三方关联表
     */
    @Id
    private String ureadingsurveyId;

    /**
     * 关联调研表
     */
    private String readingsurveyId;

    /**
     * 关联用户表
     */
    private String userId;

    /**
     * 关联新闻表
     */
    private String journalismId;



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
     * 调研与用户的第三方关联表
     * @return ureadingsurvey_id 
     */
    public String getUreadingsurveyId() {
        return ureadingsurveyId;
    }

    /**
     * 调研与用户的第三方关联表
     * @param ureadingsurveyId 
     */
    public void setUreadingsurveyId(String ureadingsurveyId) {
        this.ureadingsurveyId = ureadingsurveyId == null ? null : ureadingsurveyId.trim();
    }

    /**
     * 关联调研表
     * @return readingsurvey_id 
     */
    public String getReadingsurveyId() {
        return readingsurveyId;
    }

    /**
     * 关联调研表
     * @param readingsurveyId 
     */
    public void setReadingsurveyId(String readingsurveyId) {
        this.readingsurveyId = readingsurveyId == null ? null : readingsurveyId.trim();
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

    /**
     * 关联新闻表
     * @return journalism_id 
     */
    public String getJournalismId() {
        return journalismId;
    }

    /**
     * 关联新闻表
     * @param journalismId 
     */
    public void setJournalismId(String journalismId) {
        this.journalismId = journalismId == null ? null : journalismId.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
    public void init() {
        this.ureadingsurveyId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }
}