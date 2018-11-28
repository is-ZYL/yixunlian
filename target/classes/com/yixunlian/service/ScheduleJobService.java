/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ScheduleJobService
 * Author:   yuanyuana
 * Date:     2018/11/23 11:27
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.yixunlian.pojo.ScheduleJob;
import com.yixunlian.mapper.ScheduleJobMapper;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/11/23
 * @since 1.0.0
 */
@Service
public class ScheduleJobService extends BaseService<ScheduleJob> {

    private final ScheduleJobMapper scheduleJobMapper;

    @Autowired(required = false)
    public ScheduleJobService(ScheduleJobMapper scheduleJobMapper) {
        this.scheduleJobMapper = scheduleJobMapper;
    }
}
