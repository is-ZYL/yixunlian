package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;
import java.util.UUID;

/**
 * td_userandhobby
 */
@Table(name = "td_userandhobby")
public class Userandhobby extends BasePojo {
    /**
     * 用户表和兴趣爱好第三方关联表
     */
    @Id
    private String uandhId;

    /**
     * 用户id
     */
    private String userId;

    /**
     * 兴趣爱好id
     */
    private String hobbyId;

    /**
     * 活动类型id
     */
    private String activitycategoryId;
    /**
     * 兴趣爱好名称
     */
    private String hobbyName;
    /**
     * 备注
     */
    private String remark;

    public Userandhobby(String userId, String hobbyId, String activitycategoryId, String hobbyName) {
        this.init();
        this.userId = userId;
        this.hobbyId = hobbyId;
        this.activitycategoryId = activitycategoryId;
        this.hobbyName = hobbyName;
    }

    public Userandhobby() {
        super();
    }

    public static Userandhobby getUserandhobby() {
        return new Userandhobby();
    }

    /**
     * 活动类别id
     *
     * @return
     */
    public String getActivitycategoryId() {
        return activitycategoryId;
    }

    /**
     * 活动类别id
     *
     * @param activitycategoryId
     */
    public void setActivitycategoryId(String activitycategoryId) {
        this.activitycategoryId = activitycategoryId;
    }

    public String getHobbyName() {
        return hobbyName;
    }

    public void setHobbyName(String hobbyName) {
        this.hobbyName = hobbyName;
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

    /**
     * 用户表和兴趣爱好第三方关联表
     *
     * @return uAndh_id
     */
    public String getUandhId() {
        return uandhId;
    }

    /**
     * 用户表和兴趣爱好第三方关联表
     *
     * @param uandhId
     */
    public void setUandhId(String uandhId) {
        this.uandhId = uandhId == null ? null : uandhId.trim();
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
     * 兴趣爱好id
     *
     * @return hobby_id
     */
    public String getHobbyId() {
        return hobbyId;
    }

    /**
     * 兴趣爱好id
     *
     * @param hobbyId
     */
    public void setHobbyId(String hobbyId) {
        this.hobbyId = hobbyId == null ? null : hobbyId.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public Userandhobby init() {
        this.uandhId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
        return this;
    }
}