package com.yixunlian.pojo.system;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SysDictionaries {
    /**
     * 
     */
    private String dictionariesId;

    /**
     * 名称
     */
    private String name;

    /**
     * 英文
     */
    private String nameEn;

    /**
     * 编码
     */
    private String bianma;

    /**
     * 排序
     */
    private Integer orderBy;

    /**
     * 上级ID
     */
    private String parentId;

    /**
     * 备注
     */
    private String bz;

    /**
     * 排查表
     */
    private String tbsname;

    public SysDictionaries(String dictionariesId, String name, String nameEn, String bianma, Integer orderBy, String parentId, String bz, String tbsname) {
        this.dictionariesId = dictionariesId;
        this.name = name;
        this.nameEn = nameEn;
        this.bianma = bianma;
        this.orderBy = orderBy;
        this.parentId = parentId;
        this.bz = bz;
        this.tbsname = tbsname;
    }

    public SysDictionaries() {
        super();
    }

    public String getDictionariesId() {
        return dictionariesId;
    }

    public void setDictionariesId(String dictionariesId) {
        this.dictionariesId = dictionariesId == null ? null : dictionariesId.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getNameEn() {
        return nameEn;
    }

    public void setNameEn(String nameEn) {
        this.nameEn = nameEn == null ? null : nameEn.trim();
    }

    public String getBianma() {
        return bianma;
    }

    public void setBianma(String bianma) {
        this.bianma = bianma == null ? null : bianma.trim();
    }

    public Integer getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(Integer orderBy) {
        this.orderBy = orderBy;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz == null ? null : bz.trim();
    }

    public String getTbsname() {
        return tbsname;
    }

    public void setTbsname(String tbsname) {
        this.tbsname = tbsname == null ? null : tbsname.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}