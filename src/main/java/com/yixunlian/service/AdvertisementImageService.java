/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: AdvertisementimageService
 * Author:   yuanyuana
 * Date:     2018/10/16 16:58
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.yixunlian.mapper.AdvertisementimageMapper;
import com.yixunlian.pojo.Advertisementimage;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/10/16
 * @since 1.0.0
 */
@Service
public class AdvertisementImageService extends BaseService<Advertisementimage> {

    @Resource(name = "advertisementimageMapper")
    private AdvertisementimageMapper advertisementimageMapper;
}
