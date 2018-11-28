package com.yixunlian.pojo.system;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SysUserphoto {
    /**
     * 
     */
    private String userphotoId;

    /**
     * 用户名
     */
    private String username;

    /**
     * 原图
     */
    private String photo0;

    /**
     * 头像1
     */
    private String photo1;

    /**
     * 头像2
     */
    private String photo2;

    /**
     * 头像3
     */
    private String photo3;

    public SysUserphoto(String userphotoId, String username, String photo0, String photo1, String photo2, String photo3) {
        this.userphotoId = userphotoId;
        this.username = username;
        this.photo0 = photo0;
        this.photo1 = photo1;
        this.photo2 = photo2;
        this.photo3 = photo3;
    }

    public SysUserphoto() {
        super();
    }

    public String getUserphotoId() {
        return userphotoId;
    }

    public void setUserphotoId(String userphotoId) {
        this.userphotoId = userphotoId == null ? null : userphotoId.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPhoto0() {
        return photo0;
    }

    public void setPhoto0(String photo0) {
        this.photo0 = photo0 == null ? null : photo0.trim();
    }

    public String getPhoto1() {
        return photo1;
    }

    public void setPhoto1(String photo1) {
        this.photo1 = photo1 == null ? null : photo1.trim();
    }

    public String getPhoto2() {
        return photo2;
    }

    public void setPhoto2(String photo2) {
        this.photo2 = photo2 == null ? null : photo2.trim();
    }

    public String getPhoto3() {
        return photo3;
    }

    public void setPhoto3(String photo3) {
        this.photo3 = photo3 == null ? null : photo3.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}