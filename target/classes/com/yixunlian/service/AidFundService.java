/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: AidFundService
 * Author:   yuanyuana
 * Date:     2018/10/19 10:28
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.yixunlian.mapper.AidFundMapper;
import com.yixunlian.pojo.AidFund;
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
public class AidFundService extends BaseService<AidFund> {

    @Resource(name = "aidFundMapper")
    private AidFundMapper aidFundMapper;

}
