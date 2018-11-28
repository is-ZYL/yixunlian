package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_refereelockinguser
 */
@Table(name = "td_refereelockinguser")
public class Refereelockinguser extends BasePojo {
    /**
     * 分享活动链接给未注册用户，用户没有马上注册激活，但锁定该用户，该用户下次注册激活时即还是当前推荐人为该用户推荐人
     */
    @Id
    private String userlockingId;

    /**
     * 关联用户表，推荐人id
     */
    private String userId;

    /**
     * 锁定用户的open_id
     */
    private String openId;

    /**
     * 分享活动链接给未注册用户，用户没有马上注册激活，但锁定该用户，该用户下次注册激活时即还是当前推荐人为该用户推荐人
     * @return userLocking_id 
     */
    public String getUserlockingId() {
        return userlockingId;
    }

    /**
     * 分享活动链接给未注册用户，用户没有马上注册激活，但锁定该用户，该用户下次注册激活时即还是当前推荐人为该用户推荐人
     * @param userlockingId 
     */
    public void setUserlockingId(String userlockingId) {
        this.userlockingId = userlockingId == null ? null : userlockingId.trim();
    }

    /**
     * 关联用户表，推荐人id
     * @return user_id 
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 关联用户表，推荐人id
     * @param userId 
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * 锁定用户的open_id
     * @return open_id 
     */
    public String getOpenId() {
        return openId;
    }

    /**
     * 锁定用户的open_id
     * @param openId 
     */
    public void setOpenId(String openId) {
        this.openId = openId == null ? null : openId.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public void init() {
        this.userlockingId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }
}