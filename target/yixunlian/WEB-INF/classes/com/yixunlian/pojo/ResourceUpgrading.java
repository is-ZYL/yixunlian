package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_resource_upgrading
 */
@Table(name = "td_resource_upgrading")
public class ResourceUpgrading extends BasePojo {
    /**
     * 归属人的资源升级记录（判断是否是第一次升级，以便设置归属人提成）
     */
    @Id
    private String ruId;

    /**
     * 归属人id
     */
    private String ascriptionUserId;

    /**
     * 资源用户id
     */
    private String resourceUserId;

    /**
     *
     */
    private Date created;

    /**
     *
     */
    private Date updated;

    /**
     * 备注
     */
    private String remark;

    public static ResourceUpgrading getResourceUpgrading() {
        return new ResourceUpgrading();
    }

    /**
     * 归属人的资源升级记录（判断是否是第一次升级，以便设置归属人提成）
     *
     * @return ru_id
     */
    public String getRuId() {
        return ruId;
    }

    /**
     * 归属人的资源升级记录（判断是否是第一次升级，以便设置归属人提成）
     *
     * @param ruId
     */
    public void setRuId(String ruId) {
        this.ruId = ruId == null ? null : ruId.trim();
    }

    /**
     * 归属人id
     *
     * @return ascription_user_id
     */
    public String getAscriptionUserId() {
        return ascriptionUserId;
    }

    /**
     * 归属人id
     *
     * @param ascriptionUserId
     */
    public void setAscriptionUserId(String ascriptionUserId) {
        this.ascriptionUserId = ascriptionUserId == null ? null : ascriptionUserId.trim();
    }

    /**
     * 资源用户id
     *
     * @return resource_user_id
     */
    public String getResourceUserId() {
        return resourceUserId;
    }

    /**
     * 资源用户id
     *
     * @param resourceUserId
     */
    public void setResourceUserId(String resourceUserId) {
        this.resourceUserId = resourceUserId == null ? null : resourceUserId.trim();
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

    /**
     * 初始化
     *
     * @return
     */
    public ResourceUpgrading init() {
        this.ruId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
        return this;
    }

}