package com.yixunlian.pojo.system;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SysCreatecode {
    /**
     * 
     */
    private String createcodeId;

    /**
     * 包名
     */
    private String packagename;

    /**
     * 类名
     */
    private String objectname;

    /**
     * 表名
     */
    private String tablename;

    /**
     * 属性集
     */
    private String fieldlist;

    /**
     * 创建时间
     */
    private String createtime;

    /**
     * 描述
     */
    private String title;

    /**
     * 
     */
    private String fhtype;

    public SysCreatecode(String createcodeId, String packagename, String objectname, String tablename, String fieldlist, String createtime, String title, String fhtype) {
        this.createcodeId = createcodeId;
        this.packagename = packagename;
        this.objectname = objectname;
        this.tablename = tablename;
        this.fieldlist = fieldlist;
        this.createtime = createtime;
        this.title = title;
        this.fhtype = fhtype;
    }

    public SysCreatecode() {
        super();
    }

    public String getCreatecodeId() {
        return createcodeId;
    }

    public void setCreatecodeId(String createcodeId) {
        this.createcodeId = createcodeId == null ? null : createcodeId.trim();
    }

    public String getPackagename() {
        return packagename;
    }

    public void setPackagename(String packagename) {
        this.packagename = packagename == null ? null : packagename.trim();
    }

    public String getObjectname() {
        return objectname;
    }

    public void setObjectname(String objectname) {
        this.objectname = objectname == null ? null : objectname.trim();
    }

    public String getTablename() {
        return tablename;
    }

    public void setTablename(String tablename) {
        this.tablename = tablename == null ? null : tablename.trim();
    }

    public String getFieldlist() {
        return fieldlist;
    }

    public void setFieldlist(String fieldlist) {
        this.fieldlist = fieldlist == null ? null : fieldlist.trim();
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getFhtype() {
        return fhtype;
    }

    public void setFhtype(String fhtype) {
        this.fhtype = fhtype == null ? null : fhtype.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}