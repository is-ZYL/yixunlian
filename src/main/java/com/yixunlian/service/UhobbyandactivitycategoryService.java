/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: UhobbyandactivitycategoryService
 * Author:   yuanyuana
 * Date:     2018/10/13 17:45
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.yixunlian.mapper.UhobbyandactivitycategoryMapper;
import com.yixunlian.pojo.Uhobby;
import com.yixunlian.pojo.Uhobbyandactivitycategory;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/10/13
 * @since 1.0.0
 */
@Service
public class UhobbyandactivitycategoryService extends BaseService<Uhobbyandactivitycategory> {

    @Resource(name = "uhobbyandactivitycategoryMapper")
    private UhobbyandactivitycategoryMapper uhobbyandactivitycategoryMapper;

    /**
     * 根据爱好查询活动类别
     *
     * @param uhobby
     * @return
     */
    public List<Uhobbyandactivitycategory> queryByUhobby(Uhobby uhobby) {
        Uhobbyandactivitycategory u = Uhobbyandactivitycategory.getUhobbyAndActivityCategory();
        u.setHobbyId(uhobby.getHobbyId());
        return super.queryListByWhere(u);
    }

    /**
     * 根据爱好查询活动类别
     *
     * @param uhobbyId
     * @return
     */
    public List<Uhobbyandactivitycategory> queryByUhobby(String uhobbyId) {
        Uhobbyandactivitycategory u = Uhobbyandactivitycategory.getUhobbyAndActivityCategory();
        u.setHobbyId(uhobbyId);
        return super.queryListByWhere(u);
    }

}
