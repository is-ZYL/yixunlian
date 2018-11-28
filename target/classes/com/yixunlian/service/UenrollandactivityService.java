/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: UenrollandactivityService
 * Author:   yuanyuana
 * Date:     2018/10/15 17:57
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.yixunlian.entity.ActivityResult;
import com.yixunlian.mapper.UenrollandactivityMapper;
import com.yixunlian.pojo.Activity;
import com.yixunlian.pojo.OrganizerInfo;
import com.yixunlian.pojo.Uenrollandactivity;
import com.yixunlian.pojo.User;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/10/15
 * @since 1.0.0
 */
@Service
public class UenrollandactivityService extends BaseService<Uenrollandactivity> {

    @Resource(name = "uenrollandactivityMapper")
    private UenrollandactivityMapper uenrollandactivityMapper;

    /**
     * 根据用户id，活动id查询报名信息
     *
     * @param sharegetId
     * @param activityId
     * @return
     */
    public Uenrollandactivity queryOneByUser(String sharegetId, String activityId) {
        Uenrollandactivity uenrollandactivity = Uenrollandactivity.getUenrollAndActivity();
        uenrollandactivity.setActivityId(activityId);
        uenrollandactivity.setUserId(sharegetId);
        return super.queryOne(uenrollandactivity);
    }

    /**
     * 根据活动查询当前的报名等情况
     *
     * @param activity
     * @return
     */
    public List<Uenrollandactivity> queryListByActivity(Activity activity) {
        Uenrollandactivity ue = Uenrollandactivity.getUenrollAndActivity();
        ue.setActivityId(activity.getActivityId());
        return super.queryListByWhere(ue);
    }

    /**
     * 根据类别id统计所有活动用户报过名的总人数
     *
     * @param list 类别id集合
     * @param o
     * @return
     */
    public List<ActivityResult> queryTotalCountAndUser(Map<String, String> list, OrganizerInfo o) {
        List<ActivityResult> activityResults = new ArrayList<>();
        for (Map.Entry m : list.entrySet()) {
            Uenrollandactivity build = Uenrollandactivity.getUenrollAndActivity()
                    .toBuilder()
                    .organizerId(o.getUserId())
                    .status(0)
                    .activitycategoryId(m.getKey().toString())
                    .build();
            //根据类别以及主办方id查询活动报名情况
            List<Uenrollandactivity> uenrollandactivities = super.queryDistinctListByWhere(build);
            //封装
            ActivityResult a = ActivityResult.getActivityResult().toBuilder().isOrganizer(true).activityCategoryName(m.getValue().toString()).obj(uenrollandactivities).build();
            activityResults.add(a);
        }
        return activityResults;
    }

    /**
     * 根据活动id查询活动报名情况
     *
     * @param u
     * @param activityId
     * @return
     */
    public List<Uenrollandactivity> queryListByWhere(User u, String activityId) {
        Uenrollandactivity build = Uenrollandactivity.getUenrollAndActivity().toBuilder().organizerId(u.getUserId()).activityId(activityId).status(0).build();
        return super.queryListByWhere(build);
    }
}
