package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_journalism
 */
@Table(name = "td_journalism")
public class Journalism extends BasePojo {
    /**
     * 新闻表
     */
    @Id
    private String journalismId;

    /**
     * 新闻标题
     */
    private String journalismName;

    /**
     * 新闻发布时间
     */
    private Date journalismDate;

    /**
     * 系统发布名字
     */
    private String journalismSysoName;

    /**
     * 浏览次数
     */
    private Integer journalismBrowsingtimes;

    /**
     * 分享次数
     */
    private Integer journalismSharetimes;

    /**
     * 关联阅读调研表
     */
    private String readingsurveyId;

    /**
     *
     */
    private Date created;

    /**
     *
     */
    private Date updated;

    /**
     * 新闻封面图片
     */
    private String journalismShowImg;

    /**
     * 备注
     */
    private String remark;

    /**
     *
     */
    private String journalismUrl;

    /**
     * 新闻表
     *
     * @return journalism_id
     */
    public String getJournalismId() {
        return journalismId;
    }

    /**
     * 新闻表
     *
     * @param journalismId
     */
    public void setJournalismId(String journalismId) {
        this.journalismId = journalismId == null ? null : journalismId.trim();
    }

    /**
     * 新闻标题
     *
     * @return journalism_name
     */
    public String getJournalismName() {
        return journalismName;
    }

    /**
     * 新闻标题
     *
     * @param journalismName
     */
    public void setJournalismName(String journalismName) {
        this.journalismName = journalismName == null ? null : journalismName.trim();
    }

    /**
     * 新闻发布时间
     *
     * @return journalism_date
     */
    public Date getJournalismDate() {
        return journalismDate;
    }

    /**
     * 新闻发布时间
     *
     * @param journalismDate
     */
    public void setJournalismDate(Date journalismDate) {
        this.journalismDate = journalismDate;
    }

    /**
     * 系统发布名字
     *
     * @return journalism_syso_name
     */
    public String getJournalismSysoName() {
        return journalismSysoName;
    }

    /**
     * 系统发布名字
     *
     * @param journalismSysoName
     */
    public void setJournalismSysoName(String journalismSysoName) {
        this.journalismSysoName = journalismSysoName == null ? null : journalismSysoName.trim();
    }

    /**
     * 浏览次数
     *
     * @return journalism_browsingtimes
     */
    public Integer getJournalismBrowsingtimes() {
        return journalismBrowsingtimes;
    }

    /**
     * 浏览次数
     *
     * @param journalismBrowsingtimes
     */
    public void setJournalismBrowsingtimes(Integer journalismBrowsingtimes) {
        this.journalismBrowsingtimes = journalismBrowsingtimes;
    }

    /**
     * 分享次数
     *
     * @return journalism_sharetimes
     */
    public Integer getJournalismSharetimes() {
        return journalismSharetimes;
    }

    /**
     * 分享次数
     *
     * @param journalismSharetimes
     */
    public void setJournalismSharetimes(Integer journalismSharetimes) {
        this.journalismSharetimes = journalismSharetimes;
    }

    /**
     * 关联阅读调研表
     *
     * @return readingsurvey_id
     */
    public String getReadingsurveyId() {
        return readingsurveyId;
    }

    /**
     * 关联阅读调研表
     *
     * @param readingsurveyId
     */
    public void setReadingsurveyId(String readingsurveyId) {
        this.readingsurveyId = readingsurveyId == null ? null : readingsurveyId.trim();
    }

    /**
     * 新闻封面图片
     *
     * @return journalism_show_img
     */
    public String getJournalismShowImg() {
        return journalismShowImg;
    }

    /**
     * 新闻封面图片
     *
     * @param journalismShowImg
     */
    public void setJournalismShowImg(String journalismShowImg) {
        this.journalismShowImg = journalismShowImg == null ? null : journalismShowImg.trim();
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
     * @return journalism_url
     */
    public String getJournalismUrl() {
        return journalismUrl;
    }

    /**
     * @param journalismUrl
     */
    public void setJournalismUrl(String journalismUrl) {
        this.journalismUrl = journalismUrl == null ? null : journalismUrl.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public Journalism init() {
        this.journalismId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
        return this;
    }
}