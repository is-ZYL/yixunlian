/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: FeedbackadviceService
 * Author:   yuanyuana
 * Date:     2018/10/10 20:23
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.yixunlian.mapper.FeedbackadviceMapper;
import com.yixunlian.pojo.Feedbackadvice;
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
public class FeedbackadviceService extends BaseService<Feedbackadvice> {

    @Resource(name = "feedbackadviceMapper")
    private FeedbackadviceMapper feedbackadviceMapper;

}
