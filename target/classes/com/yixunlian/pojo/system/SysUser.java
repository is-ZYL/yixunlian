package com.yixunlian.pojo.system;

import java.util.Date;

import com.yixunlian.pojo.BasePojo;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SysUser extends BasePojo {
    /**
     * 
     */
    private String userId;

    /**
     * 
     */
    private String username;

    /**
     * 
     */
    private String password;

    /**
     * 
     */
    private String name;

    /**
     * 
     */
    private String rights;

    /**
     * 
     */
    private String roleId;

    /**
     * 
     */
    private String lastLogin;

    /**
     * 
     */
    private String status;

    /**
     * 
     */
    private String skin;

    /**
     * 
     */
    private String number;

    /**
     * 
     */
    private String phone;

    /**
     * 
     */
    private String sex;

    /**
     * 
     */
    private String remark;

    /**
     * 关联地址表
     */
    private String citycode;


    /**
     * 学校id
     */
    private Integer schoolId;

    public SysUser(String userId, String username, String password, String name, String rights, String roleId, String lastLogin, String status, String skin, String number, String phone, String sex, String remark, Date created, Date updated, Integer schoolId) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.name = name;
        this.rights = rights;
        this.roleId = roleId;
        this.lastLogin = lastLogin;
        this.status = status;
        this.skin = skin;
        this.number = number;
        this.phone = phone;
        this.sex = sex;
        this.remark = remark;

        this.schoolId = schoolId;
    }

    public String getCitycode() {
        return citycode;
    }

    public void setCitycode(String citycode) {
        this.citycode = citycode;
    }

    public SysUser() {
        super();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getRights() {
        return rights;
    }

    public void setRights(String rights) {
        this.rights = rights == null ? null : rights.trim();
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    public String getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(String lastLogin) {
        this.lastLogin = lastLogin == null ? null : lastLogin.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getSkin() {
        return skin;
    }

    public void setSkin(String skin) {
        this.skin = skin == null ? null : skin.trim();
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number == null ? null : number.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Integer getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Integer schoolId) {
        this.schoolId = schoolId;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}