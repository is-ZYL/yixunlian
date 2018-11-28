package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * td_background_publishing_journalism
 */
@Table(name = "td_background_publishing_journalism")
public class BackgroundPublishingJournalism extends BasePojo {
    /**
     * 后台人员选择发送新闻发送到那个模块的新闻表
     */
    @Id
    private String backgroundJournalismTypeid;

    /**
     * 新闻类型
     */
    private String journalismType;
    /**
     * 备注
     */
    private String remark;

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
     * 后台人员选择发送新闻发送到那个模块的新闻表
     *
     * @return background_journalism_typeid
     */
    public String getBackgroundJournalismTypeid() {
        return backgroundJournalismTypeid;
    }

    /**
     * 后台人员选择发送新闻发送到那个模块的新闻表
     *
     * @param backgroundJournalismTypeid
     */
    public void setBackgroundJournalismTypeid(String backgroundJournalismTypeid) {
        this.backgroundJournalismTypeid = backgroundJournalismTypeid == null ? null : backgroundJournalismTypeid.trim();
    }

    /**
     * 新闻类型
     *
     * @return journalism_type
     */
    public String getJournalismType() {
        return journalismType;
    }

    /**
     * 新闻类型
     *
     * @param journalismType
     */
    public void setJournalismType(String journalismType) {
        this.journalismType = journalismType == null ? null : journalismType.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}