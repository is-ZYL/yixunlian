package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_resource_strategy
 */
@Table(name = "td_resource_strategy")
public class ResourceStrategy extends BasePojo {
    /**
     * 资源攻略表
     */
    @Id
    private String resourceStrategyId;

    /**
     * 关联用户表
     */
    private String userId;

    /**
     * 资源攻略二维码存放路径
     */
    private String resourceStrategyQrcodeurl;

    /**
     * 资源攻略内容
     */
    private String resourceStrategyContext;

    /**
     * 资源攻略表
     * @return resource_strategy_id 
     */
    public String getResourceStrategyId() {
        return resourceStrategyId;
    }

    /**
     * 资源攻略表
     * @param resourceStrategyId 
     */
    public void setResourceStrategyId(String resourceStrategyId) {
        this.resourceStrategyId = resourceStrategyId == null ? null : resourceStrategyId.trim();
    }

    /**
     * 关联用户表
     * @return user_id 
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 关联用户表
     * @param userId 
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * 资源攻略二维码存放路径
     * @return resource_strategy_qrcodeurl 
     */
    public String getResourceStrategyQrcodeurl() {
        return resourceStrategyQrcodeurl;
    }

    /**
     * 资源攻略二维码存放路径
     * @param resourceStrategyQrcodeurl 
     */
    public void setResourceStrategyQrcodeurl(String resourceStrategyQrcodeurl) {
        this.resourceStrategyQrcodeurl = resourceStrategyQrcodeurl == null ? null : resourceStrategyQrcodeurl.trim();
    }

    /**
     * 资源攻略内容
     * @return resource_strategy_context 
     */
    public String getResourceStrategyContext() {
        return resourceStrategyContext;
    }

    /**
     * 资源攻略内容
     * @param resourceStrategyContext 
     */
    public void setResourceStrategyContext(String resourceStrategyContext) {
        this.resourceStrategyContext = resourceStrategyContext == null ? null : resourceStrategyContext.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
    public void init() {
        this.resourceStrategyId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }

}