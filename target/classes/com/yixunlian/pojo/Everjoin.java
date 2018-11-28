package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_everjoin
 */
@Table(name = "td_everjoin")
public class Everjoin extends BasePojo {
    /**
     * 曾经参与表
     */
    @Id
    private String everjoinId;

    /**
     * 关联用户表，那个用户的曾经参与的活动
     */
    private String userId;

    /**
     * 曾经参与的那个活动
     */
    private String activityId;

    /**
     * 曾经参与的那个活动类别id
     */
    private String activitycategoryId;

    /**
     * 是否逻辑删除 0未删除 1已删除（用户查询则不显示）
     */
    private Integer isDelete;
    /**
     * 备注
     */
    private String remark;

    public static Everjoin getEverjoin() {
        return new Everjoin();
    }

    /**
     * 曾经参与的那个活动类别id
     */
    public String getActivitycategoryId() {
        return activitycategoryId;
    }

    /**
     * 曾经参与的那个活动类别id
     */
    public void setActivitycategoryId(String activitycategoryId) {
        this.activitycategoryId = activitycategoryId;
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
     * 曾经参与表
     *
     * @return everjoin_id
     */
    public String getEverjoinId() {
        return everjoinId;
    }

    /**
     * 曾经参与表
     *
     * @param everjoinId
     */
    public void setEverjoinId(String everjoinId) {
        this.everjoinId = everjoinId == null ? null : everjoinId.trim();
    }

    /**
     * 关联用户表，那个用户的曾经参与的活动
     *
     * @return user_id
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 关联用户表，那个用户的曾经参与的活动
     *
     * @param userId
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * 曾经参与的那个活动
     *
     * @return activity_id
     */
    public String getActivityId() {
        return activityId;
    }

    /**
     * 曾经参与的那个活动
     *
     * @param activityId
     */
    public void setActivityId(String activityId) {
        this.activityId = activityId == null ? null : activityId.trim();
    }

    /**
     * 是否逻辑删除 0未删除 1已删除（用户查询则不显示）
     *
     * @return is_delete
     */
    public Integer getIsDelete() {
        return isDelete;
    }

    /**
     * 是否逻辑删除 0未删除 1已删除（用户查询则不显示）
     *
     * @param isDelete
     */
    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public Everjoin init() {
        this.everjoinId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
        return this;
    }
}