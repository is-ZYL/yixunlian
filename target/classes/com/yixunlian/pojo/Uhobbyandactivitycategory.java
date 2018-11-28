package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.shiro.config.Ini;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.crypto.Data;
import java.util.Date;
import java.util.UUID;

/**
 * td_uhobbyandactivitycategory
 */
@Table(name = "td_uhobbyandactivitycategory")
public class Uhobbyandactivitycategory extends BasePojo {
    /**
     * 兴趣爱好和活动类型的第三方表
     */
    @Id
    private String uhobbyAndActivitycategoryId;

    /**
     * 关联活动类型表
     */
    private String activitycategoryId;

    /**
     * 关联兴趣爱好表
     */
    private String hobbyId;

    /**
     * 备注
     */
    private String remark;

    public static Uhobbyandactivitycategory getUhobbyAndActivityCategory() {
        return new Uhobbyandactivitycategory();
    }

    /**
     * 兴趣爱好和活动类型的第三方表
     *
     * @return uhobby_and_activitycategory_id
     */
    public String getUhobbyAndActivitycategoryId() {
        return uhobbyAndActivitycategoryId;
    }

    /**
     * 兴趣爱好和活动类型的第三方表
     *
     * @param uhobbyAndActivitycategoryId
     */
    public void setUhobbyAndActivitycategoryId(String uhobbyAndActivitycategoryId) {
        this.uhobbyAndActivitycategoryId = uhobbyAndActivitycategoryId == null ? null : uhobbyAndActivitycategoryId.trim();
    }

    /**
     * 关联活动类型表id
     *
     * @return activitycategory_id
     */
    public String getActivitycategoryId() {
        return activitycategoryId;
    }

    /**
     * 关联活动类型表id
     *
     * @param activitycategoryId
     */
    public void setActivitycategoryId(String activitycategoryId) {
        this.activitycategoryId = activitycategoryId == null ? null : activitycategoryId.trim();
    }

    /**
     * 关联兴趣爱好表
     *
     * @return hobby_id
     */
    public String getHobbyId() {
        return hobbyId;
    }

    /**
     * 关联兴趣爱好表
     *
     * @param hobbyId
     */
    public void setHobbyId(String hobbyId) {
        this.hobbyId = hobbyId == null ? null : hobbyId.trim();
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

    public Uhobbyandactivitycategory init() {
        Date date = new Date();
        this.activitycategoryId = UUID.randomUUID().toString().replace("-", "");
        this.setCreated(date);
        this.setUpdated(date);
        return this;
    }
}