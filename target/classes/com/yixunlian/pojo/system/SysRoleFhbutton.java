package com.yixunlian.pojo.system;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SysRoleFhbutton {
    /**
     * 
     */
    private String rbId;

    /**
     * 
     */
    private String roleId;

    /**
     * 
     */
    private String buttonId;

    public SysRoleFhbutton(String rbId, String roleId, String buttonId) {
        this.rbId = rbId;
        this.roleId = roleId;
        this.buttonId = buttonId;
    }

    public SysRoleFhbutton() {
        super();
    }

    public String getRbId() {
        return rbId;
    }

    public void setRbId(String rbId) {
        this.rbId = rbId == null ? null : rbId.trim();
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    public String getButtonId() {
        return buttonId;
    }

    public void setButtonId(String buttonId) {
        this.buttonId = buttonId == null ? null : buttonId.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}