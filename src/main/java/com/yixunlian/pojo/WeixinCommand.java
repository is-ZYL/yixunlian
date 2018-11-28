package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * weixin_command
 */
@Table(name = "weixin_command")
public class WeixinCommand extends com.yixunlian.pojo.BasePojo {
    /**
     *
     */
    @Id
    private String commandId;

    /**
     * 关键词
     */
    private String keyword;

    /**
     * 应用路径
     */
    private String commandcode;

    /**
     * 创建时间
     */
    private String createtime;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 备注
     */
    private String bz;
    /**
     * 备注
     */
    private String remark;

    /**
     * @return COMMAND_ID
     */
    public String getCommandId() {
        return commandId;
    }

    /**
     * @param commandId
     */
    public void setCommandId(String commandId) {
        this.commandId = commandId == null ? null : commandId.trim();
    }

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
     * 关键词
     *
     * @return KEYWORD
     */
    public String getKeyword() {
        return keyword;
    }

    /**
     * 关键词
     *
     * @param keyword
     */
    public void setKeyword(String keyword) {
        this.keyword = keyword == null ? null : keyword.trim();
    }

    /**
     * 应用路径
     *
     * @return COMMANDCODE
     */
    public String getCommandcode() {
        return commandcode;
    }

    /**
     * 应用路径
     *
     * @param commandcode
     */
    public void setCommandcode(String commandcode) {
        this.commandcode = commandcode == null ? null : commandcode.trim();
    }

    /**
     * 创建时间
     *
     * @return CREATETIME
     */
    public String getCreatetime() {
        return createtime;
    }

    /**
     * 创建时间
     *
     * @param createtime
     */
    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
    }

    /**
     * 状态
     *
     * @return STATUS
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 状态
     *
     * @param status
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 备注
     *
     * @return BZ
     */
    public String getBz() {
        return bz;
    }

    /**
     * 备注
     *
     * @param bz
     */
    public void setBz(String bz) {
        this.bz = bz == null ? null : bz.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}