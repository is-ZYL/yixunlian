/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ResourceUpgradingService
 * Author:   yuanyuana
 * Date:     2018/10/18 11:33
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import util.myutils.ObjectUtil;
import com.yixunlian.mapper.ResourceUpgradingMapper;
import com.yixunlian.pojo.ResourceUpgrading;
import com.yixunlian.pojo.User;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/10/18
 * @since 1.0.0
 */
@Service
public class ResourceUpgradingService extends BaseService<ResourceUpgrading> {

    @Resource(name = "resourceUpgradingMapper")
    private ResourceUpgradingMapper resourceUpgradingMapper;
    @Resource(name = "userService")
    private UserService userService;

    /**
     * 根据用户信息查询是否已经升级过（vip客户经理/普通客户经理）
     *
     * @param user
     * @return
     */
    public ResourceUpgrading queryOneByUser(User user) {
        User user1 = userService.queryById(user.getUsermanagerUid());
        //如果当前用户不为空则查询升级表，为空则说明为系统用户
        if (ObjectUtil.isNotNull(user1)) {
            ResourceUpgrading r = new ResourceUpgrading();
            //设置归属人id
            r.setAscriptionUserId(user1.getUserId());
            //设置资源用户id
            r.setResourceUserId(user.getUserId());
            return super.queryOne(r);
        }
        return null;
    }
}
