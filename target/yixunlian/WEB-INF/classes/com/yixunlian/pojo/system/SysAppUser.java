package com.yixunlian.pojo.system;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SysAppUser {
    /**
     * 
     */
    private String userId;

    /**
     * 12345
     */
    private String username;

    /**
     * 12345
     */
    private String password;

    /**
     * 
     */
    private String name;

    /**
     * 
     */
    private String roleId;

    /**
     * 
     */
    private String status;

    /**
     * 
     */
    private String phone;

    /**
     * 12345
     */
    private String number;

    

    /**
     * 用户性别;1为男；0为女；
     */
    private Integer sex;

    /**
     * 
     */
    private String createTime;

    /**
     * 
     */
    private Long schoolId;

    public SysAppUser(String userId, String username, String password, String name, String roleId, String status, String phone, String number, Date created, Date updated, Integer sex, String createTime, Long schoolId) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.name = name;
        this.roleId = roleId;
        this.status = status;
        this.phone = phone;
        this.number = number;
        this.sex = sex;
        this.createTime = createTime;
        this.schoolId = schoolId;
    }

    public SysAppUser() {
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

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number == null ? null : number.trim();
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime == null ? null : createTime.trim();
    }

    public Long getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Long schoolId) {
        this.schoolId = schoolId;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}