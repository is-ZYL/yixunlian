package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * weixin_key
 */
@Table(name = "weixin_key")
public class WeixinKey extends BasePojo {
    /**
     *
     */
    @Id
    private String keyId;

    /**
     * 用户名
     */
    private String username;

    /**
     * appid
     */
    private String appid;

    /**
     * appsecret
     */
    private String appsecret;

    /**
     * access_token
     */
    private String accessToken;

    /**
     * 创建时间
     */
    private String createtime;

    /**
     * 备注
     */
    private String bz;

    /**
     * 公众号
     */
    private String wxusername;

    /**
     * 备注
     */
    private String remark;

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
     * @return KEY_ID
     */
    public String getKeyId() {
        return keyId;
    }

    /**
     * @param keyId
     */
    public void setKeyId(String keyId) {
        this.keyId = keyId == null ? null : keyId.trim();
    }

    /**
     * 用户名
     *
     * @return USERNAME
     */
    public String getUsername() {
        return username;
    }

    /**
     * 用户名
     *
     * @param username
     */
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    /**
     * appid
     *
     * @return APPID
     */
    public String getAppid() {
        return appid;
    }

    /**
     * appid
     *
     * @param appid
     */
    public void setAppid(String appid) {
        this.appid = appid == null ? null : appid.trim();
    }

    /**
     * appsecret
     *
     * @return APPSECRET
     */
    public String getAppsecret() {
        return appsecret;
    }

    /**
     * appsecret
     *
     * @param appsecret
     */
    public void setAppsecret(String appsecret) {
        this.appsecret = appsecret == null ? null : appsecret.trim();
    }

    /**
     * access_token
     *
     * @return ACCESS_TOKEN
     */
    public String getAccessToken() {
        return accessToken;
    }

    /**
     * access_token
     *
     * @param accessToken
     */
    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken == null ? null : accessToken.trim();
    }

    /**
     * 创建时间
     *
     * @return CREATETIME
     */
    public String getCreatetime() {
        return createtime;
    }

    /**
     * 创建时间
     *
     * @param createtime
     */
    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
    }

    /**
     * 备注
     *
     * @return BZ
     */
    public String getBz() {
        return bz;
    }

    /**
     * 备注
     *
     * @param bz
     */
    public void setBz(String bz) {
        this.bz = bz == null ? null : bz.trim();
    }

    /**
     * 公众号
     *
     * @return WXUSERNAME
     */
    public String getWxusername() {
        return wxusername;
    }

    /**
     * 公众号
     *
     * @param wxusername
     */
    public void setWxusername(String wxusername) {
        this.wxusername = wxusername == null ? null : wxusername.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}