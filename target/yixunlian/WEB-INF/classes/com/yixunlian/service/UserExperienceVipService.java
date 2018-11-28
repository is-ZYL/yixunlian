/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: UserExperienceVipService
 * Author:   yuanyuana
 * Date:     2018/10/11 15:25
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.yixunlian.mapper.UserExperienceVipMapper;
import com.yixunlian.pojo.User;
import com.yixunlian.pojo.UserExperienceVip;
import com.yixunlian.pojo.Utype;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/10/11
 * @since 1.0.0
 */
@Service
public class UserExperienceVipService extends BaseService<UserExperienceVip> {

    @Resource(name = "userExperienceVipMapper")
    private UserExperienceVipMapper userExperienceVipMapper;
    @Resource(name = "utypeService")
    private UtypeService utypeService;

    /**
     * 用户体验vip客户经理
     *
     * @param user
     * @param utype
     * @return
     */
    public Integer saveByUser(User user, Utype utype, Date date) {
        //封装成数据保存至数据库
        UserExperienceVip userExperienceVip = new UserExperienceVip();
        userExperienceVip.setUserId(user.getUserId());
        userExperienceVip.setExperienceVipStarttime(date);
        userExperienceVip.init().setUtypeId(utype.getUtypeId());
        return super.saveSelective(userExperienceVip);
    }

}
