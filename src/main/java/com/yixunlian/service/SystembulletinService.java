/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: SystembulletinService
 * Author:   yuanyuana
 * Date:     2018/9/28 17:15
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.yixunlian.mapper.SystembulletinMapper;
import com.yixunlian.pojo.system.Systembulletin;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/9/28
 * @since 1.0.0
 */
@Service
public class SystembulletinService extends BaseService<Systembulletin> {

    @Resource(name = "systembulletinMapper")
    private SystembulletinMapper systembulletinMapper;

}
