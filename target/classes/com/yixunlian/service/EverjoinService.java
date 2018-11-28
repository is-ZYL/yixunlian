/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: EverjoinService
 * Author:   yuanyuana
 * Date:     2018/9/27 19:12
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.github.pagehelper.PageHelper;
import com.yixunlian.entity.ObjectResult;
import com.yixunlian.mapper.EverjoinMapper;
import com.yixunlian.pojo.Everjoin;
import com.yixunlian.pojo.User;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
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
 * @create 2018/9/27
 * @since 1.0.0
 */
@Service
public class EverjoinService extends BaseService<Everjoin> {
    @Autowired
    private EverjoinMapper everjoinMapper;
    @Resource(name = "userService")
    private UserService userService;
    @Resource(name = "everjoinService")
    private EverjoinService everjoinService;

    /**
     * 通过用户id查询参与的活动id
     *
     * @param page
     * @param rows
     * @param u
     * @return
     */
    public List<Everjoin> queryPageListByUid(Integer page, Integer rows, User u) {
        PageHelper.startPage(page, rows);
        Everjoin everjoin = new Everjoin();
        everjoin.setUserId(u.getUserId());
        //未逻辑删除的活动
        everjoin.setIsDelete(0);
        return this.everjoinMapper.select(everjoin);
    }

    /**
     * 通过用户id查询曾经参与详情
     *
     * @param u
     * @return
     */
    public Everjoin queryOneByUid(User u) {
        Everjoin everjoin = new Everjoin();
        everjoin.setUserId(u.getUserId());
        //未逻辑删除的活动
        everjoin.setIsDelete(0);
        return super.queryOne(everjoin);
    }

    /**
     * 获取当前用户的资源库中的曾经参与集合
     *
     * @param user
     * @return
     */
    public List<ObjectResult> queryEverJoinListInUserResources(User user) {
        User user1 = new User();
        user1.setUsermanagerUid(user.getUserId());
        //未封号状态
        user1.setClosedUserStatus(0);
        //查询当前用户的资源
        List<User> userList = userService.queryListByWhere(user1);
        //查询每个用户的兴趣爱好
        List<List<Everjoin>> lists = new ArrayList<>();
        //循环资源列表
        for (User user2 : userList) {
            //根据用户查询曾经参与列表
            Everjoin everjoin = new Everjoin();
            everjoin.setUserId(user2.getUserId());
            List<Everjoin> everjoinList = everjoinService.queryListByWhere(everjoin);
            //将查询到的数据保存到lists中
            lists.add(everjoinList);
        }

        //封装要返回的数据
        List<ObjectResult> objectResultList = new ArrayList<>();
        //循环得出曾经参与的数量
        for (List<Everjoin> everjoinList : lists) {
            for (Everjoin everjoin : everjoinList) {
                ObjectResult objectResult = new ObjectResult();
                //  System.out.println(temp + ": " + Collections.frequency(lists, temp));
                //计算当前曾经参与出现的次数
                Integer count = Collections.frequency(everjoinList, everjoin);
                //必须有一个以上
                if (count > 0) {
                    objectResult.setTotal(count);
                    objectResult.setObject(everjoin);
                    objectResult.setName(everjoin.getActivitycategoryId());
                    objectResultList.add(objectResult);
                }
            }

        }
        //去重复
        return ListUtils.removeDuplicate(objectResultList);
    }
}
