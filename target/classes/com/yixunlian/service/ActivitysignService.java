/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ActivitysignService
 * Author:   yuanyuana
 * Date:     2018/10/11 19:56
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import util.myutils.ObjectUtil;
import com.yixunlian.mapper.ActivitysignMapper;
import com.yixunlian.pojo.*;
import com.yixunlian.service.baseservice.BaseService;
import com.yixunlian.service.baseservice.GetService;
import org.springframework.stereotype.Service;
import util.myutils.ListUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/10/11
 * @since 1.0.0
 */
@Service
public class ActivitysignService extends BaseService<Activitysign> {

    @Resource(name = "activitysignMapper")
    private ActivitysignMapper activitysignMapper;

    @Resource(name = "getService")
    private GetService getService;

    /**
     * 通过用户id，活动id查询报名情况
     *
     * @param user
     * @param activityId
     * @return
     */
    public Activitysign queryActivitysignsByUser(User user, String activityId) {
        Activitysign activitysign = new Activitysign();
        activitysign.setActivityId(activityId);
        activitysign.setUserId(user.getUserId());
        return super.queryOne(activitysign);
    }

    /**
     * 通过用户id，活动id查询报名情况
     *
     * @param userId
     * @param activityId
     * @return
     */
    public List<Activitysign> queryActivitysignsByUser(String userId, String activityId) {
        Activitysign activitysign = new Activitysign();
        activitysign.setActivityId(activityId);
        activitysign.setUserId(userId);
        return super.queryListByWhere(activitysign);
    }

    /**
     * 通过分享用户id，活动id查询报名情况
     *
     * @param user
     * @param activityId
     * @return
     */
    public List<Uenrollandactivity> queryActivitySignListByUidAndActivityId(User user, String activityId) {
        ShareService shareService = getService.getShareService();
        List<Uenrollandactivity> uenrollandactivities = new ArrayList<>();
        Share share = Share.getShare();
        //分享活动类型
        share.setShareidStatus(1);
        //匹配活动
        share.setActivityId(activityId);
        //设置分享者为当前用户
        share.setSharesendId(user.getUserId());
        List<Share> shares = shareService.queryListByWhere(share);
        //去重
        shares = ListUtils.removeDuplicate(shares);

        //循环得出分享接收者是否报名此活动
        for (Share share1 : shares) {
            //根据活动id 与 用户id查询是否已经报名
            Uenrollandactivity uenrollandactivity = getService.getUenrollandactivityService().queryOneByUser(share1.getSharegetId(), share1.getActivityId());
            //不为空则添加至list中
            if (ObjectUtil.isNotNull(uenrollandactivity)) {
                uenrollandactivities.add(uenrollandactivity);
            }
        }
        return uenrollandactivities;
    }

    /**
     * 查询当前活动的所有报名用户
     *
     * @param activityId
     * @return
     */
    public List<Activitysign> queryActivitysignsByActivityId(String activityId) {
        Activitysign activitysign = new Activitysign();
        activitysign.setActivityId(activityId);
        return super.queryListByWhere(activitysign);
    }

    /**
     * 查询当前活动指定用户的报名填写项
     *
     * @param userId
     * @param activityId
     * @return
     */
    public List<Activitysign> queryActivitysignsByActivityIdAndUserId(String userId, String activityId) {
        Activitysign activitysign = new Activitysign();
        activitysign.setActivityId(activityId);
        activitysign.setUserId(userId);
        return super.queryListByWhere(activitysign);
    }
}
