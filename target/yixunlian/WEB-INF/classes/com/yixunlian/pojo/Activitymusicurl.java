package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_activitymusicurl
 */
@Table(name = "td_activitymusicurl")
public class Activitymusicurl extends BasePojo {
    /**
     * 发布活动设置音乐表
     */
    @Id
    private String activitymusicId;
    /**
     * 备注
     */
    private String remark;
    /**
     * 活动音乐路径
     */
    private String activityMusicurl;
    /**
     * 活动音乐类别名字
     */
    private String activityMusicName;

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

    public String getActivityMusicName() {
        return activityMusicName;
    }

    public void setActivityMusicName(String activityMusicName) {
        this.activityMusicName = activityMusicName;
    }

    /**
     * 发布活动设置音乐表
     *
     * @return activitymusic_id
     */
    public String getActivitymusicId() {
        return activitymusicId;
    }

    /**
     * 发布活动设置音乐表
     *
     * @param activitymusicId
     */
    public void setActivitymusicId(String activitymusicId) {
        this.activitymusicId = activitymusicId == null ? null : activitymusicId.trim();
    }

    /**
     * 活动音乐路径
     *
     * @return activity_musicurl
     */
    public String getActivityMusicurl() {
        return activityMusicurl;
    }

    /**
     * 活动音乐路径
     *
     * @param activityMusicurl
     */
    public void setActivityMusicurl(String activityMusicurl) {
        this.activityMusicurl = activityMusicurl == null ? null : activityMusicurl.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public void init() {
        this.activitymusicId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }
}