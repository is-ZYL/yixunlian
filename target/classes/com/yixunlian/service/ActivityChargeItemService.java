/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ActivityChargeItemService
 * Author:   yuanyuana
 * Date:     2018/10/23 11:22
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import util.myutils.ObjectUtil;
import com.yixunlian.mapper.ActivityChargeItemMapper;
import com.yixunlian.pojo.Activity;
import com.yixunlian.pojo.ActivityChargeItem;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/10/23
 * @since 1.0.0
 */
@Service
public class ActivityChargeItemService extends BaseService<ActivityChargeItem> {

    @Resource(name = "activityChargeItemMapper")
    private ActivityChargeItemMapper activityChargeItemMapper;

    /**
     * 根据活动查询总成交金额
     *
     * @param activity
     * @return
     */
    public BigDecimal querySumMoneyByActivity(Activity activity) {
        return activityChargeItemMapper.querySumMoneyByActivity(activity.getActivityId());
    }

    /**
     * 批量保存活动收费项目
     *
     * @param activity
     * @param c
     * @return
     */
    public Integer saveSelective(Activity activity, List<ActivityChargeItem> c) {
        Integer count = 0;
        for (ActivityChargeItem a : c) {
            a.setActivityId(activity.getActivityId());
            a.init();
            a.setUserId(activity.getUserId());
            count += super.saveSelective(a);
        }
        return count;
    }

    /**
     * 保存活动收费项目
     *
     * @param activity
     * @param c
     * @return
     */
    public Integer saveSelective(Activity activity, ActivityChargeItem c) {
        c.setActivityId(activity.getActivityId());
        c.init();
        c.setUserId(activity.getUserId());
        return super.saveSelective(c);
    }

    /**
     * 批量更新活动收费项目
     *
     * @param activity
     * @param c
     * @return
     */
    public Integer updateSelective(Activity activity, List<ActivityChargeItem> c) {
        Integer count = 0;
        for (ActivityChargeItem a : c) {
            //判断是否存在id，没有则说明新增，反之为更新
            if (ObjectUtil.isNull(a.getActivityChargeItemId())) {
                count = saveSelective(activity, a);
            } else {
                count += super.updateSelective(a);
            }
        }
        return count;
    }

    /**
     * 根据活动id查询活动的收费项目
     *
     * @param activity
     * @return
     */
    public List<ActivityChargeItem> queryListByWhere(Activity activity) {
        ActivityChargeItem ac = ActivityChargeItem.getInstance().toBuilder().activityId(activity.getActivityId()).build();
        return super.queryListByWhereDesc(ac);
    }

}
