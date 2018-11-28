/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: UCollectionService
 * Author:   yuanyuana
 * Date:     2018/9/28 18:17
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yixunlian.mapper.UCollectionMapper;
import com.yixunlian.pojo.UCollection;
import com.yixunlian.pojo.User;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/9/28
 * @since 1.0.0
 */
@Service
public class UCollectionService extends BaseService<UCollection> {

    @Autowired
    private UCollectionMapper uCollectionMapper;

    /**
     * 用户查询收藏的活动列表
     * @param page
     * @param rows
     * @param user
     * @return
     */
    public PageInfo<UCollection> queryPageListByUser(Integer page, Integer rows, User user) {
        UCollection u = new UCollection();
        u.setUserId(user.getUserId());
       return queryPageListByWhere(page,rows,u);
    }
}
