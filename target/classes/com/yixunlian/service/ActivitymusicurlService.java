/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ActivitymusicurlService
 * Author:   yuanyuana
 * Date:     2018/10/19 15:52
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.yixunlian.mapper.ActivitymusicurlMapper;
import com.yixunlian.pojo.Activitymusicurl;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/10/19
 * @since 1.0.0
 */
@Service
public class ActivitymusicurlService extends BaseService<Activitymusicurl> {
    @Resource(name = "activitymusicurlMapper")
    private ActivitymusicurlMapper activitymusicurlMapper;
}
