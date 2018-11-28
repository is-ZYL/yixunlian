/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: RoleService
 * Author:   yuanyuana
 * Date:     2018/9/29 16:41
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import util.myutils.ObjectUtil;
import com.yixunlian.mapper.RoleMapper;
import com.yixunlian.pojo.system.Role;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/9/29
 * @since 1.0.0
 */
@Service
public class RoleService extends BaseService<Role> {
    @Resource(name = "roleMapper")
    private RoleMapper roleMapper;

    /**
     * 根据权限名称查询role对象，若查询不到则通过id查询
     *
     * @param operationCenter
     * @return
     */
    public Role queryOneByRoleName(String operationCenter,String id) {
        Role role = new Role();
        role.setRoleName(operationCenter);
        Role role1 = super.queryOne(role);
        if (ObjectUtil.isNull(role1)) {
            return super.queryById(id);
        }
        return role;
    }

}
