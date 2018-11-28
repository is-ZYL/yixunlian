package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * td_background_operation_record
 */
@Table(name = "td_background_operation_record")
public class BackgroundOperationRecord extends BasePojo {
    /**
     * 后台人员操作记录表
     */
    @Id
    private String backgroundOperationRecordId;

    /**
     * 后台管理员操作内容
     */
    private String backgroundOperationRecordName;

    /**
     * 关联系统用户表
     */
    private String userId;
    /**
     * 备注
     */
    private String remark;

    /**
     * 备注
     *
     * @return remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 备注
     *
     * @param remark
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    /**
     * 后台人员操作记录表
     *
     * @return background_operation_record_id
     */
    public String getBackgroundOperationRecordId() {
        return backgroundOperationRecordId;
    }

    /**
     * 后台人员操作记录表
     *
     * @param backgroundOperationRecordId
     */
    public void setBackgroundOperationRecordId(String backgroundOperationRecordId) {
        this.backgroundOperationRecordId = backgroundOperationRecordId == null ? null : backgroundOperationRecordId.trim();
    }

    /**
     * 后台管理员操作内容
     *
     * @return background_operation_record_name
     */
    public String getBackgroundOperationRecordName() {
        return backgroundOperationRecordName;
    }

    /**
     * 后台管理员操作内容
     *
     * @param backgroundOperationRecordName
     */
    public void setBackgroundOperationRecordName(String backgroundOperationRecordName) {
        this.backgroundOperationRecordName = backgroundOperationRecordName == null ? null : backgroundOperationRecordName.trim();
    }

    /**
     * 关联系统用户表
     *
     * @return USER_ID
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 关联系统用户表
     *
     * @param userId
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}