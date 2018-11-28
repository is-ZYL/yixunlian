package com.yixunlian.pojo.system;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SysLoginimg {
    /**
     * 
     */
    private String loginimgId;

    /**
     * 文件名
     */
    private String name;

    /**
     * 路径
     */
    private String filepath;

    /**
     * 状态
     */
    private Integer type;

    /**
     * 排序
     */
    private Integer forder;

    public SysLoginimg(String loginimgId, String name, String filepath, Integer type, Integer forder) {
        this.loginimgId = loginimgId;
        this.name = name;
        this.filepath = filepath;
        this.type = type;
        this.forder = forder;
    }

    public SysLoginimg() {
        super();
    }

    public String getLoginimgId() {
        return loginimgId;
    }

    public void setLoginimgId(String loginimgId) {
        this.loginimgId = loginimgId == null ? null : loginimgId.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath == null ? null : filepath.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getForder() {
        return forder;
    }

    public void setForder(Integer forder) {
        this.forder = forder;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}