package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.UUID;

/**
 * td_collection
 */
@Table(name = "td_collection")
public class UCollection extends BasePojo {
    /**
     * 收藏表
     */
    @Id
    private String collectionId;

    /**
     * 关联用户表
     */
    private String userId;

    /**
     * 关联活动表
     */
    private String activityId;

    public UCollection() {

    }

    public UCollection(String userId, String activityId) {
        init();
        this.userId = userId;
        this.activityId = activityId;
    }

    /**
     * 收藏表
     *
     * @return collection_id
     */
    public String getCollectionId() {
        return collectionId;
    }

    /**
     * 收藏表
     *
     * @param collectionId
     */
    public void setCollectionId(String collectionId) {
        this.collectionId = collectionId == null ? null : collectionId.trim();
    }

    /**
     * 关联用户表
     *
     * @return user_id
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 关联用户表
     *
     * @param userId
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * 关联活动表
     *
     * @return activity_id
     */
    public String getActivityId() {
        return activityId;
    }

    /**
     * 关联活动表
     *
     * @param activityId
     */
    public void setActivityId(String activityId) {
        this.activityId = activityId == null ? null : activityId.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public UCollection init() {
        this.collectionId = UUID.randomUUID().toString().replace("-", "");
        return this;
    }
}