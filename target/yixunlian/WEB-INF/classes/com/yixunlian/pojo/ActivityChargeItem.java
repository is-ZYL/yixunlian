package com.yixunlian.pojo;

import lombok.*;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

/**
 * td_activity_charge_item
 */
@Table(name = "td_activity_charge_item")
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder(toBuilder = true)
public class ActivityChargeItem extends BasePojo {
    /**
     * 活动收费项目id
     */
    @Id
    private String activityChargeItemId;

    /**
     * 活动收费项目名称
     */
    private String activityChargeItemName;

    /**
     * 活动收费金额
     */
    private BigDecimal activityChargeItemMoney;

    /**
     * 绑定活动id
     */
    private String activityId;

    /**
     * 主办方id
     */
    private String userId;

    /**
     * 备注
     */
    private String remark;

    public static ActivityChargeItem getActivityChargeItem() {
        return new ActivityChargeItem();
    }

    public static ActivityChargeItem getInstance() {
        return new ActivityChargeItem();
    }

    /**
     * 活动收费项目id
     *
     * @return activity_charge_item_id
     */
    public String getActivityChargeItemId() {
        return activityChargeItemId;
    }

    /**
     * 活动收费项目id
     *
     * @param activityChargeItemId
     */
    public void setActivityChargeItemId(String activityChargeItemId) {
        this.activityChargeItemId = activityChargeItemId == null ? null : activityChargeItemId.trim();
    }

    /**
     * 活动收费项目名称
     *
     * @return activity_charge_item_name
     */
    public String getActivityChargeItemName() {
        return activityChargeItemName;
    }

    /**
     * 活动收费项目名称
     *
     * @param activityChargeItemName
     */
    public void setActivityChargeItemName(String activityChargeItemName) {
        this.activityChargeItemName = activityChargeItemName == null ? null : activityChargeItemName.trim();
    }

    /**
     * 活动收费金额
     *
     * @return activity_charge_item_money
     */
    public BigDecimal getActivityChargeItemMoney() {
        return activityChargeItemMoney;
    }

    /**
     * 活动收费金额
     *
     * @param activityChargeItemMoney
     */
    public void setActivityChargeItemMoney(BigDecimal activityChargeItemMoney) {
        this.activityChargeItemMoney = activityChargeItemMoney;
    }

    /**
     * 绑定活动id
     *
     * @return activity_id
     */
    public String getActivityId() {
        return activityId;
    }

    /**
     * 绑定活动id
     *
     * @param activityId
     */
    public void setActivityId(String activityId) {
        this.activityId = activityId == null ? null : activityId.trim();
    }

    /**
     * 主办方id
     *
     * @return user_id
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 主办方id
     *
     * @param userId
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
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

    public ActivityChargeItem init() {
        this.activityChargeItemId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
        return this;
    }

}