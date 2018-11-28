package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * weixin_mymenu
 */
@Table(name = "weixin_mymenu")
public class WeixinMymenu extends BasePojo {
    /**
     *
     */
    @Id
    private String mymenuId;

    /**
     * 公众号
     */
    private String wxusername;

    /**
     * 用户名
     */
    private String username;

    /**
     * 菜单名称
     */
    private String title;

    /**
     * 类型
     */
    private String type;

    /**
     * 指向
     */
    private String content;

    /**
     * XID
     */
    private String xid;

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
     * @return MYMENU_ID
     */
    public String getMymenuId() {
        return mymenuId;
    }

    /**
     * @param mymenuId
     */
    public void setMymenuId(String mymenuId) {
        this.mymenuId = mymenuId == null ? null : mymenuId.trim();
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
     * 菜单名称
     *
     * @return TITLE
     */
    public String getTitle() {
        return title;
    }

    /**
     * 菜单名称
     *
     * @param title
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     * 类型
     *
     * @return TYPE
     */
    public String getType() {
        return type;
    }

    /**
     * 类型
     *
     * @param type
     */
    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    /**
     * 指向
     *
     * @return CONTENT
     */
    public String getContent() {
        return content;
    }

    /**
     * 指向
     *
     * @param content
     */
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    /**
     * XID
     *
     * @return XID
     */
    public String getXid() {
        return xid;
    }

    /**
     * XID
     *
     * @param xid
     */
    public void setXid(String xid) {
        this.xid = xid == null ? null : xid.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}