/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: PersonalneedsService
 * Author:   yuanyuana
 * Date:     2018/10/10 14:48
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.yixunlian.mapper.PersonalneedsMapper;
import com.yixunlian.pojo.Personalneeds;
import com.yixunlian.pojo.Userandpersonalneeds;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/10/10
 * @since 1.0.0
 */
@Service
public class PersonalneedsService extends BaseService<Personalneeds> {

    @Resource(name = "personalneedsMapper")
    private PersonalneedsMapper personalneedsMapper;

    /**
     * 根据第三方表进行查询个人需求
     *
     * @param u
     * @return
     */
    public Personalneeds queryListByUserandpersonalneeds(Userandpersonalneeds u) {
        Personalneeds p = Personalneeds.getPersonalNeeds();
        p.setPersonalneedsId(u.getPersonalneedsId());
        return super.queryOne(p);
    }
}
