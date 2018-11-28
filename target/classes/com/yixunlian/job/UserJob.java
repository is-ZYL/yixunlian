/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: JobImpl
 * Author:   yuanyuana
 * Date:     2018/11/8 10:04
 * Description: job实现类
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.job;

import util.myutils.ObjectUtil;
import com.yixunlian.pojo.User;
import com.yixunlian.pojo.Utype;
import com.yixunlian.service.UserService;
import com.yixunlian.service.UtypeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import util.myutils.DateUtils;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈job实现类〉
 *
 * @author yuanyuana
 * @create 2018/11/8
 * @since 1.0.0
 */
@Component
@SuppressWarnings("unchecked")
@Slf4j
public class UserJob {

    @Resource(name = "userService")
    private UserService userService;
    @Resource(name = "utypeService")
    private UtypeService utypeService;

    /**
     * 更新用户等级
     */
    public void checkUserGrade() {
        //  List<User> users = userService.queryListByUserGradeIsInvalid();
    }

    /**
     * 0点更新用户vip天数
     */
    public void updateUserMemberDays() {
        int count = 0;
        try {
            Utype u = null;
            List<User> users = userService.queryListByUserMemberDays();
            log.info("查询出来的vip用户：{}", users);
            for (User user : users) {
                if (user.getMemberDays() > 0 && user.getIsVip().equals(1)) {
                    user.setMemberDays(user.getMemberDays() - 1);
                    if (user.getMemberDays() == 0) {
                        user.setIsVip(0);
                        user.setUtypeId("1");
                        if (ObjectUtil.isNull(u)) {
                            u = utypeService.queryById("1");
                        }
                        user.setUtypeName(u.getUserType());
                    }
                } else {
                    user.setUtypeId("1");
                    if (ObjectUtil.isNull(u)) {
                        u = utypeService.queryById("1");
                    }
                    user.setUtypeName(u.getUserType());
                }
                count += userService.updateSelective(user);
            }
            log.info("\n vip用户更新有效日期完成，完成时间为：{}共操作{}条数据", DateUtils.fomatDate(new Date()), count);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("\n vip用户更新有效日期失败，异常时间为：{}共操作{}条数据", DateUtils.fomatDate(new Date()), count);
        }
    }

}
