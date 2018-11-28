package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_student_remittance
 */
@Table(name = "td_student_remittance")
public class StudentRemittance extends BasePojo {
    /**
     * 同学汇表
     */
    @Id
    private String studentRemittanceId;

    /**
     * 关联用户表
     */
    private String userId;

    /**
     * 同学汇表
     * @return student_remittance_id 
     */
    public String getStudentRemittanceId() {
        return studentRemittanceId;
    }

    /**
     * 同学汇表
     * @param studentRemittanceId 
     */
    public void setStudentRemittanceId(String studentRemittanceId) {
        this.studentRemittanceId = studentRemittanceId == null ? null : studentRemittanceId.trim();
    }

    /**
     * 关联用户表
     * @return user_id 
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 关联用户表
     * @param userId 
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
    public void init() {
        this.studentRemittanceId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }

}