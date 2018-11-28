/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ComplaintService
 * Author:   yuanyuana
 * Date:     2018/10/11 20:13
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.yixunlian.mapper.ComplaintMapper;
import com.yixunlian.pojo.Complaint;
import com.yixunlian.pojo.User;
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
public class ComplaintService extends BaseService<Complaint> {

    @Resource(name = "complaintMapper")
    private ComplaintMapper complaintMapper;

    /**
     * 用户投诉活动
     *
     * @param user
     * @param complaint
     * @return
     */
    public Integer saveByUserActivityId(User user, Complaint complaint) {
        complaint.init().setUserId(user.getUserId());
        return super.save(complaint);
    }
}
