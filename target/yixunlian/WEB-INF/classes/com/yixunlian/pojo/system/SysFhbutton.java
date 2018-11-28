package com.yixunlian.pojo.system;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SysFhbutton {
    /**
     * 
     */
    private String fhbuttonId;

    /**
     * 名称
     */
    private String name;

    /**
     * 权限标识
     */
    private String qxName;

    /**
     * 备注
     */
    private String bz;

    public SysFhbutton(String fhbuttonId, String name, String qxName, String bz) {
        this.fhbuttonId = fhbuttonId;
        this.name = name;
        this.qxName = qxName;
        this.bz = bz;
    }

    public SysFhbutton() {
        super();
    }

    public String getFhbuttonId() {
        return fhbuttonId;
    }

    public void setFhbuttonId(String fhbuttonId) {
        this.fhbuttonId = fhbuttonId == null ? null : fhbuttonId.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getQxName() {
        return qxName;
    }

    public void setQxName(String qxName) {
        this.qxName = qxName == null ? null : qxName.trim();
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz == null ? null : bz.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}