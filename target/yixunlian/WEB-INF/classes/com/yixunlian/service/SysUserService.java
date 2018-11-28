/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: SysUserService
 * Author:   yuanyuana
 * Date:     2018/9/29 15:54
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.github.abel533.entity.Example;
import com.github.abel533.entity.Example.Criteria;
import util.myutils.ObjectUtil;
import com.yixunlian.mapper.SysUserMapper;
import com.yixunlian.pojo.User;
import com.yixunlian.pojo.system.Role;
import com.yixunlian.pojo.system.SysUser;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/9/29
 * @since 1.0.0
 */
@Service
public class SysUserService extends BaseService<SysUser> {

    @Autowired
    private SysUserMapper sysUserMapper;

    @Resource(name = "addressService")
    private AddressService addressService;

    /**
     * 查询当前区域的最小运营管理（可能是市级，省级）
     *
     * @param user
     * @param resultRole
     * @return
     */
    public SysUser querySysUserByRole(User user, Role resultRole) {
        Example example = new Example(SysUser.class);
        Criteria criteria = example.createCriteria();
        //匹配当前用户的区域的运营中心
        criteria.andEqualTo("citycode", user.getCityCitycode());
        criteria.andEqualTo("roleId", resultRole.getRoleId());
        List<SysUser> uList = sysUserMapper.selectByExample(example);
        for (SysUser user1 : uList) {
            if (ObjectUtil.isNotNull(user1)) {
                //返回市级代理用户
                return user1;
            }
        }
        //市级为空的情况下则寻找省级运营中心
        if (uList.size() == 0 || ObjectUtil.isNull(uList)) {
            //省级
            criteria.andEqualTo("citycode", user.getProvinceCitycode());
            List<SysUser> uList1 = sysUserMapper.selectByExample(example);
            for (SysUser user1 : uList1) {
                if (ObjectUtil.isNotNull(user1)) {
                    //返回省级代理用户
                    return user1;
                }
            }
        }
        return null;
    }
}
