/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ShareService
 * Author:   yuanyuana
 * Date:     2018/10/15 16:49
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import util.myutils.ObjectUtil;
import com.yixunlian.mapper.ShareMapper;
import com.yixunlian.pojo.Activity;
import com.yixunlian.pojo.Share;
import com.yixunlian.pojo.User;
import com.yixunlian.service.baseservice.BaseService;
import com.yixunlian.service.baseservice.GetService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/10/15
 * @since 1.0.0
 */
@Service
public class ShareService extends BaseService<Share> {

    @Resource(name = "shareMapper")
    private ShareMapper shareMapper;

    @Resource(name = "getService")
    private GetService getService;

    /**
     * 批量插入活动分享信息
     *
     * @param user
     * @param activityId
     * @param sendIds
     * @return
     */
    public Integer savaByUserAndActivityIdAndSendIds(User user, String activityId, List<String> sendIds) {
        Integer count = 0;
        for (String s : sendIds) {
            User user1 = getService.getUserService().queryById(s);
            //如果查出来的用户的分享人和归属人为空 则将当前用户的推荐人，归属人设置为user
            if (ObjectUtil.isNull(user1.getUserrefereeUid())) {
                user1.setUserrefereeUid(user.getUserId());
                user1.setUserrefereeName(user.getuNickname());
            }
            //同上
            if (ObjectUtil.isNull(user1.getUsermanagerUid())) {
                user1.setUsermanagerUid(user.getUserId());
                user1.setUsermanagerName(user.getuNickname());
            }
            Share share = Share.getShare();
            share.init().setActivityId(activityId);
            //设置为分享活动
            share.setShareidStatus(1);
            //分享者
            share.setSharesendId(user.getUserId());
            //接受者
            share.setSharegetId(s);
            count += super.saveSelective(share);

        }
        return count;
    }

    /**
     * 根据分享者和活动查询分享信息
     *
     * @param user
     * @param activity
     * @return
     */
    public List<Share> queryListByUserAndActivity(User user, Activity activity) {
        Share share = Share.getShare();
        share.setActivityId(activity.getActivityId());
        share.setSharesendId(user.getUserId());
        return super.queryListByWhere(share);
    }
}
