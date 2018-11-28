/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: UhobbyService
 * Author:   yuanyuana
 * Date:     2018/9/25 16:23
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yixunlian.mapper.UhobbyMapper;
import com.yixunlian.pojo.Uhobby;
import com.yixunlian.service.baseservice.BaseService;
import com.yixunlian.service.baseservice.GetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
public class UhobbyService extends BaseService<Uhobby> {
    @Autowired
    private UhobbyMapper uhobbyMapper;
    @Resource(name = "getService")
    private GetService getService;

    /**
     * 批量获取爱好数据
     *
     * @param page
     * @param rows
     * @return
     */
    public PageInfo<Uhobby> queryAllListByDESC(Integer page, Integer rows) {
        PageHelper.startPage(page, rows);
        Example example = new Example(Uhobby.class);
        example.setOrderByClause("created DESC ");
        List<Uhobby> list = this.uhobbyMapper.selectByExample(example);
        return new PageInfo<Uhobby>(list);
    }
}
