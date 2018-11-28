/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: AddressService
 * Author:   yuanyuana
 * Date:     2018/9/29 16:24
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.yixunlian.pojo.Address;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/9/29
 * @since 1.0.0
 */
@Service
public class AddressService extends BaseService<Address> {

    /**
     * 根据父Id获取省市区
     *
     * @param pidcode
     * @return
     */
    public List<Address> getAddressListByPid(String pidcode) {
        Address address = new Address();
        address.setPidcode(pidcode);
        return super.queryListByWhere(address);
    }

    /**
     * 根据城市名查询地区
     *
     * @param keys
     * @return
     */
    public List<Address> getcityname(String keys) {
        Address address = new Address();
        address.setCityname(keys);
        return super.queryListByWhere(address);
    }
}
