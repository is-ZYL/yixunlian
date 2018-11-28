/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: UserandhobbyService
 * Author:   yuanyuana
 * Date:     2018/9/25 17:13
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.github.abel533.entity.Example;
import com.github.abel533.entity.Example.Criteria;
import util.myutils.ObjectUtil;
import com.yixunlian.entity.ObjectResult;
import com.yixunlian.mapper.UserandhobbyMapper;
import com.yixunlian.pojo.Uhobby;
import com.yixunlian.pojo.Uhobbyandactivitycategory;
import com.yixunlian.pojo.User;
import com.yixunlian.pojo.Userandhobby;
import com.yixunlian.service.baseservice.BaseService;
import com.yixunlian.service.baseservice.GetService;
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
 * @create 2018/9/25
 * @since 1.0.0
 */
@Service
public class UserandhobbyService extends BaseService<Userandhobby> {

    @Resource(name = "userandhobbyMapper")
    private UserandhobbyMapper uhobbyMapper;
    @Resource(name = "userService")
    private UserService userService;
    @Resource(name = "uhobbyService")
    private UhobbyService uhobbyService;
    @Resource(name = "userandhobbyService")
    private UserandhobbyService userandhobbyService;
    @Resource(name = "getService")
    private GetService getService;

    /**
     * 根据useid查询当前用户的爱好列表
     *
     * @param u       用户
     * @param orderBy 排序规则
     * @return 返回list
     */
    public List<Userandhobby> queryListByUserDESC(User u, String orderBy) {
        Example example = new Example(Userandhobby.class);
        Criteria criteria = example.createCriteria();
        criteria.andEqualTo("userId", u.getUserId());
        if (ObjectUtil.isNotNull(orderBy)) {
            //根据创建时间降序排列
            example.setOrderByClause(" CREATED " + orderBy.toUpperCase());
        }
        example.setDistinct(true);
        List<Userandhobby> us = this.uhobbyMapper.selectByExample(example);
        //删除掉重复爱好id的数据
        for (int i = 0; i < us.size() - 1; i++) {
            for (int j = us.size() - 1; j > i; j--) {
                if (us.get(j).getHobbyId().equals(us.get(i).getHobbyId())) {
                    us.remove(j);
                }
            }
        }
        return us;
    }

    /**
     * 根据useid查询当前用户的爱好列表
     *
     * @param userId  用户id
     * @param orderBy 排序规则
     * @return 返回list
     */
    public List<Userandhobby> queryListByUserDESC(String userId, String orderBy) {
        Example example = new Example(Userandhobby.class);
        Criteria criteria = example.createCriteria();
        criteria.andEqualTo("userId", userId);
        if (ObjectUtil.isNotNull(orderBy)) {
            //根据创建时间降序排列
            example.setOrderByClause(" CREATED " + orderBy.toUpperCase());
        }
        example.setDistinct(true);
        List<Userandhobby> us = this.uhobbyMapper.selectByExample(example);
        //删除掉重复爱好id的数据
        for (int i = 0; i < us.size() - 1; i++) {
            for (int j = us.size() - 1; j > i; j--) {
                if (us.get(j).getHobbyId().equals(us.get(i).getHobbyId())) {
                    us.remove(j);
                }
            }
        }
        return us;
    }

    /**
     * 批量存储用户兴趣
     *
     * @param uHobbyList
     * @return
     */
    public Integer addAllUserAndHobbies(List<Userandhobby> uHobbyList) {
        int count = 0;
        for (Userandhobby userandhobby : uHobbyList) {
            userandhobby.init();
            count += super.save(userandhobby);
        }
        return count;
    }

    /**
     * 查询当前用户的资源库中的用户的爱好与爱好人数
     *
     * @param user
     * @return
     */
    public List<ObjectResult> queryListInUserResources(User user) {
        User user1 = new User();
        user1.setUsermanagerUid(user.getUserId());
        //未封号状态
        user1.setClosedUserStatus(0);
        //查询当前用户的资源
        List<User> userList = userService.queryListByWhere(user1);
        //查询每个用户的兴趣爱好
        List<List<Userandhobby>> lists = new ArrayList<>();
        //循环资源列表
        for (User user2 : userList) {
            //根据用户查询爱好列表
            Userandhobby userandhobby = new Userandhobby();
            userandhobby.setUserId(user2.getUserId());
            List<Userandhobby> userandhobbyList = userandhobbyService.queryListByWhere(userandhobby);

            //将查询到的数据保存到lists中
            lists.add(userandhobbyList);
        }

        //封装要返回的数据
        List<ObjectResult> objectResultList = new ArrayList<>();
        //循环得出爱好的数量
        for (List<Userandhobby> userandhobbyList : lists) {
            for (Userandhobby userandhobby : userandhobbyList) {
                ObjectResult objectResult = new ObjectResult();
                //  System.out.println(temp + ": " + Collections.frequency(lists, temp));
                //计算当前爱好出现的次数
                Integer count = Collections.frequency(userandhobbyList, userandhobby);
                //必须有一个以上
                if (count > 0) {
                    objectResult.setTotal(count);
                    objectResult.setObject(userandhobby);
                    objectResult.setName(userandhobby.getHobbyName());
                    objectResultList.add(objectResult);
                }
            }
        }
        //去重复
        objectResultList = ListUtils.removeDuplicate(objectResultList);
        //排序
        Collections.sort(objectResultList);
        return objectResultList;
    }

    /**
     * 批量保存用户的兴趣爱好
     *
     * @param user
     * @param uhobbies
     */
    public Integer saveSelectiveByUhobbyList(User user, List<Uhobby> uhobbies) {
        Integer count = 0;
        //根据每条爱好获取活动类别（注：一个爱好有多个活动类别）
        for (Uhobby uhobby : uhobbies) {
            List<Uhobbyandactivitycategory> list = getService.getUhobbyandactivitycategoryService().queryByUhobby(uhobby.getHobbyId());
            for (Uhobbyandactivitycategory u : list) {
                Userandhobby userandhobby = new Userandhobby(user.getUserId(), uhobby.getHobbyId(), u.getActivitycategoryId(), uhobby.getHobbyName());
                count += super.saveSelective(userandhobby);
            }
        }
        return count;
    }

    /**
     * 用户更新兴趣爱好
     *
     * @param u
     * @param uHobbyList
     * @return
     */
    public Integer saveSelectiveByUAndhobbyList(User u, List<Userandhobby> uHobbyList) {
        //删除用户之前的所有爱好列表
        Userandhobby userandhobby = Userandhobby.getUserandhobby();
        userandhobby.setUserId(u.getUserId());
        super.deleteByWhere(userandhobby);
        Integer count = 0;
        //根据每条爱好获取活动类别（注：一个爱好有多个活动类别）
        for (Userandhobby uhobby : uHobbyList) {
            List<Uhobbyandactivitycategory> list = getService.getUhobbyandactivitycategoryService().queryByUhobby(uhobby.getHobbyId());
            for (Uhobbyandactivitycategory uh : list) {
                uhobby.setUserId(u.getUserId());
                uhobby.setActivitycategoryId(uh.getUhobbyAndActivitycategoryId());
                uhobby.init();
                count += super.saveSelective(uhobby);
            }
        }
        return count;
    }
}
