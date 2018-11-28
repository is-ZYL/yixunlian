/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: PaymentflowService
 * Author:   yuanyuana
 * Date:     2018/10/10 18:40
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.yixunlian.mapper.PaymentflowMapper;
import com.yixunlian.pojo.Paymentflow;
import com.yixunlian.pojo.User;
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
public class PaymentflowService extends BaseService<Paymentflow> {

    @Resource(name = "paymentflowMapper")
    private PaymentflowMapper paymentflowMapper;

    public Integer saveSelectiveByUser(User user, Paymentflow paymentflow) {
        paymentflow.init().setUserId(user.getUserId());
        return super.saveSelective(paymentflow);
    }
}
