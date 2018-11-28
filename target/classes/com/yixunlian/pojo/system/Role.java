package com.yixunlian.pojo.system;

import com.yixunlian.pojo.BasePojo;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * 类名称：角色
 * 类描述：
 *
 * @author FH QQ 728971035[庸人修行录]
 * 作者单位：
 * 联系方式：
 * 创建时间：2014年3月10日
 * @version 1.0
 */
@Table(name = "sys_role")

public class Role extends BasePojo {
    /**
     *
     */
    @Id
    private String roleId;

    /**
     *
     */
    private String roleName;

    /**
     *
     */
    private String rights;

    /**
     *
     */
    private String parentId;

    /**
     *
     */
    private String addQx;

    /**
     *
     */
    private String delQx;

    /**
     *
     */
    private String editQx;

    /**
     *
     */
    private String chaQx;

    /**
     *
     */
    private Date created;

    /**
     *
     */
    private Date updated;

    /**
     * @return ROLE_ID
     */
    public String getRoleId() {
        return roleId;
    }

    /**
     * @param roleId
     */
    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    /**
     * @return ROLE_NAME
     */
    public String getRoleName() {
        return roleName;
    }

    /**
     * @param roleName
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    /**
     * @return RIGHTS
     */
    public String getRights() {
        return rights;
    }

    /**
     * @param rights
     */
    public void setRights(String rights) {
        this.rights = rights == null ? null : rights.trim();
    }

    /**
     * @return PARENT_ID
     */
    public String getParentId() {
        return parentId;
    }

    /**
     * @param parentId
     */
    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
    }

    /**
     * @return ADD_QX
     */
    public String getAddQx() {
        return addQx;
    }

    /**
     * @param addQx
     */
    public void setAddQx(String addQx) {
        this.addQx = addQx == null ? null : addQx.trim();
    }

    /**
     * @return DEL_QX
     */
    public String getDelQx() {
        return delQx;
    }

    /**
     * @param delQx
     */
    public void setDelQx(String delQx) {
        this.delQx = delQx == null ? null : delQx.trim();
    }

    /**
     * @return EDIT_QX
     */
    public String getEditQx() {
        return editQx;
    }

    /**
     * @param editQx
     */
    public void setEditQx(String editQx) {
        this.editQx = editQx == null ? null : editQx.trim();
    }

    /**
     * @return CHA_QX
     */
    public String getChaQx() {
        return chaQx;
    }

    /**
     * @param chaQx
     */
    public void setChaQx(String chaQx) {
        this.chaQx = chaQx == null ? null : chaQx.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

}
