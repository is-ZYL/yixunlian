package com.yixunlian.pojo.system;

import com.yixunlian.pojo.BasePojo;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * td_system_help
 */
@Table(name = "td_system_help")
public class SystemHelp extends BasePojo {
    /**
     * 系统帮助表
     */
    @Id
    private String systemHelpId;

    /**
     * 帮助类型
     */
    private String systemHelpType;

    /**
     * 帮助内容
     */
    private String systemHelpContext;

    /**
     * 系统帮助表
     *
     * @return system_help_id
     */
    public String getSystemHelpId() {
        return systemHelpId;
    }

    /**
     * 系统帮助表
     *
     * @param systemHelpId
     */
    public void setSystemHelpId(String systemHelpId) {
        this.systemHelpId = systemHelpId == null ? null : systemHelpId.trim();
    }

    /**
     * 帮助类型
     *
     * @return system_help_type
     */
    public String getSystemHelpType() {
        return systemHelpType;
    }

    /**
     * 帮助类型
     *
     * @param systemHelpType
     */
    public void setSystemHelpType(String systemHelpType) {
        this.systemHelpType = systemHelpType == null ? null : systemHelpType.trim();
    }

    /**
     * 帮助内容
     *
     * @return system_help_context
     */
    public String getSystemHelpContext() {
        return systemHelpContext;
    }

    /**
     * 帮助内容
     *
     * @param systemHelpContext
     */
    public void setSystemHelpContext(String systemHelpContext) {
        this.systemHelpContext = systemHelpContext == null ? null : systemHelpContext.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public SystemHelp init(){
        Date date = new Date();
        this.setUpdated(date);
        this.setCreated(date);
        return this;
    }

}