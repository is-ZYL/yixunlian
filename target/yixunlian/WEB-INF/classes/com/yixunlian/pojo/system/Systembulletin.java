package com.yixunlian.pojo.system;

import com.yixunlian.pojo.BasePojo;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * td_systembulletin
 */
@Table(name = "td_systembulletin")
public class Systembulletin extends BasePojo {
    @Id
    private String systembulletinId;

    /**
     * 路径，上传h5
     */
    private String systembulletinUrl;
    /**
     * 资源攻略二维码存放路径
     */
    private String resourceStrategyQrcodeurl;

    /**
     * 系统发布的h5文件，类型0活动功能介绍和了解我们，1会员收益攻略，2用户协议,3资源攻略,4关于我们
     */
    private Integer systemStatus;

    /**
     * 系统公告表
     *
     * @return systembulletin_id
     */
    public String getSystembulletinId() {
        return systembulletinId;
    }

    /**
     * 系统公告表
     *
     * @param systembulletinId
     */
    public void setSystembulletinId(String systembulletinId) {
        this.systembulletinId = systembulletinId == null ? null : systembulletinId.trim();
    }

    /**
     * 系统公告路径，上传h5
     *
     * @return systembulletin_url
     */
    public String getSystembulletinUrl() {
        return systembulletinUrl;
    }

    /**
     * 系统公告路径，上传h5
     *
     * @param systembulletinUrl
     */
    public void setSystembulletinUrl(String systembulletinUrl) {
        this.systembulletinUrl = systembulletinUrl == null ? null : systembulletinUrl.trim();
    }

    /**
     * 系统发布的h5文件，0活动功能介绍，1会员收益攻略，2用户协议,3资源攻略，4 了解我们'
     *
     * @return system_status
     */
    public Integer getSystemStatus() {
        return systemStatus;
    }

    /**
     * 系统发布的h5文件，0活动功能介绍，1会员收益攻略，2用户协议,3资源攻略，4 了解我们'
     *
     * @param systemStatus
     */
    public void setSystemStatus(Integer systemStatus) {
        this.systemStatus = systemStatus;
    }

    public String getResourceStrategyQrcodeurl() {
        return resourceStrategyQrcodeurl;
    }

    public void setResourceStrategyQrcodeurl(String resourceStrategyQrcodeurl) {
        this.resourceStrategyQrcodeurl = resourceStrategyQrcodeurl;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}