/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: UserandpersonalneedsService
 * Author:   yuanyuana
 * Date:     2018/10/11 9:53
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.yixunlian.entity.ObjectResult;
import com.yixunlian.mapper.UserandpersonalneedsMapper;
import com.yixunlian.pojo.User;
import com.yixunlian.pojo.Userandpersonalneeds;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.stereotype.Service;
import util.myutils.ListUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/10/11
 * @since 1.0.0
 */
@Service
public class UserandpersonalneedsService extends BaseService<Userandpersonalneeds> {

    @Resource(name = "userandpersonalneedsMapper")
    private UserandpersonalneedsMapper userandpersonalneedsMapper;
    @Resource(name = "userService")
    private UserService userService;

    /**
     * 计算用户资源库的个人需求人数
     *
     * @param user
     * @return
     */
    public List<ObjectResult> queryUserNeedsListInUserResources(User user) {
        List<User> userList = userService.getResourceByUser(user);
        List<List<Userandpersonalneeds>> lists = new ArrayList<>();

        //循环计算
        for (User user1 : userList) {
            Userandpersonalneeds userandpersonalneeds = new Userandpersonalneeds();
            userandpersonalneeds.setUserId(user.getUserId());
            List<Userandpersonalneeds> userandpersonalneeds1 = this.queryListByWhere(userandpersonalneeds);
            lists.add(userandpersonalneeds1);
        }

        //封装要返回的数据
        List<ObjectResult> objectResultList = new ArrayList<>();
        //循环得出个人需求的数量
        for (List<Userandpersonalneeds> userandpersonalneeds : lists) {
            for (Userandpersonalneeds userandpersonalneeds1 : userandpersonalneeds) {
                ObjectResult objectResult = new ObjectResult();
                //  System.out.println(temp + ": " + Collections.frequency(lists, temp));
                //计算当前个人需求出现的次数
                Integer count = Collections.frequency(userandpersonalneeds, userandpersonalneeds1);
                //必须有一个以上
                if (count > 0) {
                    objectResult.setTotal(count);
                    objectResult.setObject(userandpersonalneeds1);
                    objectResult.setName(userandpersonalneeds1.getPersonalneedsName());
                    objectResultList.add(objectResult);
                }
            }

        }
        //去重复
        return ListUtils.removeDuplicate(objectResultList);
    }

    /**
     * 根据用户查询个人需求列表
     *
     * @param user
     * @return
     */
    public List<Userandpersonalneeds> queryListByUser(User user) {
        Userandpersonalneeds u = Userandpersonalneeds.getUserandpersonalneeds();
        u.setUserId(user.getUserId());
        return super.queryListByWhere(u);
    }
}
