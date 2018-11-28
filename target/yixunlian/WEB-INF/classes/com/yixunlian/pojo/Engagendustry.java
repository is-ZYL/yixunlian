package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_engagendustry
 */
@Table(name = "td_engagendustry")
public class Engagendustry extends BasePojo {
    /**
     * 行业类型
     */
    @Id
    private String egidId;

    /**
     * 行业名字
     */
    private String egidName;

    /**
     * 备注
     */
    private String remark;

    /**
     * 行业类型
     *
     * @return egid_id
     */
    public String getEgidId() {
        return egidId;
    }

    /**
     * 行业类型
     *
     * @param egidId
     */
    public void setEgidId(String egidId) {
        this.egidId = egidId == null ? null : egidId.trim();
    }

    /**
     * 行业名字
     *
     * @return egid_name
     */
    public String getEgidName() {
        return egidName;
    }

    /**
     * 行业名字
     *
     * @param egidName
     */
    public void setEgidName(String egidName) {
        this.egidName = egidName == null ? null : egidName.trim();
    }

    /**
     * 备注
     *
     * @return remark
     */
    public String getRemark() {
        return remark;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public void init() {
        this.egidId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }
}