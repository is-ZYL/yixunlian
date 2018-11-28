/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: UtypeService
 * Author:   yuanyuana
 * Date:     2018/9/28 16:16
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.github.abel533.entity.Example;
import com.yixunlian.mapper.UtypeMapper;
import com.yixunlian.pojo.User;
import com.yixunlian.pojo.Utype;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/9/28
 * @since 1.0.0
 */
@Service
public class UtypeService extends BaseService<Utype> {

    @Autowired
    private UtypeMapper utypeMapper;

    /**
     * 查询区域代理对象
     *
     * @param districtAndCountyagency 区域代理的名称
     * @return 返回当前对象
     */
    public Utype querDistrictAndCountyAgency(String districtAndCountyagency) {
        Utype utype = new Utype();
        utype.setUserType(districtAndCountyagency);
        return super.queryOne(utype);
    }

    /**
     * 根据用户等级类型查询出以上等级
     *
     * @param user
     * @return
     */
    public List<Utype> queryByUser(User user) {
        Example example = new Example(Utype.class);
        Utype utype = new Utype();
        //查询当前用户的等级
        utype = super.queryById(user.getUtypeId());
        /**
         * 初级会员、客户经理和VIP（体验）用户
         */
        if ("1".equals(utype.getUtypeId()) || "2".equals(utype.getUtypeId()) || "4".equals(utype.getUtypeId())) {
            example.createCriteria().andBetween("utypeId", 2, 3);
            return utypeMapper.selectByExample(example);
        }
        /**
         * VIP（试用） 只允许升级钻石客户经理
         */
        if ("5".equals(utype.getUtypeId())) {
            example.createCriteria().andEqualTo("utypeId", 6);
            return utypeMapper.selectByExample(example);
        }
        return null;
    }

    /**
     * 根据id查询
     *
     * @param utypeId
     * @return
     */
    public Utype queryOne(String utypeId) {
        Utype utype = Utype.getUtype();
        utype.setUtypeId(utypeId);
        return this.utypeMapper.selectOne(utype);
    }

}
