package com.yixunlian.controller.front;

import com.yixunlian.pojo.Address;
import com.yixunlian.service.AddressService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("address/")
public class AddressController {

    @Resource(name = "addressService")
    private AddressService service;

    /**
     * 根据父Id获取省市区
     *
     * @param pidcode 父id
     * @return 返回地址集合
     */
    @RequestMapping(value = "getAddressListByPid", method = RequestMethod.GET)
    public ResponseEntity<List<Address>> getAddressListByPid(@RequestParam(value = "pidcode", defaultValue = "100000") String pidcode, @RequestParam(defaultValue = "0") Integer type) {
        try {
            List<Address> list = this.service.getAddressListByPid(pidcode);
            if (1 == type) {
                //添加全部到数据中
                list.add(0, Address.builder().citycode("000000").areacode("000000").cityname("全部").simplename("全部").pidcode("000000").citylevel(1).postcode("000000").py("all").build());
            }
            return ResponseEntity.ok(list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }

    /**
     * 根据地址Id查询地址详细
     *
     * @param citycode 城市id
     * @return 返回地址对象
     */
    @RequestMapping(value = "getAddressById", method = RequestMethod.GET)
    public ResponseEntity<Address> getAllAddressById(@RequestParam("citycode") String citycode) {
        try {
            Address aa = this.service.queryById(citycode);
            System.out.print(aa);
            return ResponseEntity.ok(aa);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }

    /**
     * 根据城市名查询地区
     *
     * @param cityName 城市名
     * @return 返回地址对象集合
     */
    @RequestMapping(value = "getCityName", method = RequestMethod.GET)
    public ResponseEntity<List<Address>> getCityName(@RequestParam("cityName") String cityName) {
        try {
            //省
            String keys = new String(cityName.getBytes("iso8859-1"), "utf-8");
            List<Address> list1 = this.service.getcityname(keys);
            return ResponseEntity.ok(list1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }

}
