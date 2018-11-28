/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: SystemHelpService
 * Author:   yuanyuana
 * Date:     2018/10/11 12:05
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.yixunlian.mapper.SystemhelpMapper;
import com.yixunlian.pojo.system.SystemHelp;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/10/11
 * @since 1.0.0
 */
@Service
public class SystemHelpService extends BaseService<SystemHelp> {

    @Resource(name = "systemhelpMapper")
    private SystemhelpMapper systemhelpMapper;

}
