/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ActivityServerce
 * Author:   yuanyuana
 * Date:     2018/9/27 19:22
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.github.pagehelper.PageInfo;
import com.yixunlian.mapper.ActivityMapper;
import com.yixunlian.mapper.TaxrevenueMapper;
import com.yixunlian.pojo.Activity;
import com.yixunlian.pojo.Everjoin;
import com.yixunlian.pojo.Taxrevenue;
import com.yixunlian.pojo.UCollection;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/9/27
 * @since 1.0.0
 */
@Service
public class TaxrevenueService extends BaseService<Taxrevenue> {
    @Resource(name = "taxrevenueMapper")
    private TaxrevenueMapper taxrevenueMapper;

}
