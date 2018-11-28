/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ActivityFillInItemService
 * Author:   yuanyuana
 * Date:     2018/11/16 17:35
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.github.abel533.entity.Example;
import util.myutils.ObjectUtil;
import com.yixunlian.mapper.ActivityFillInItemMapper;
import com.yixunlian.pojo.Activity;
import com.yixunlian.pojo.ActivityFillInItem;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/11/16
 * @since 1.0.0
 */
@Service
public class ActivityFillInItemService extends BaseService<ActivityFillInItem> {

    @Resource(name = "activityFillInItemMapper")
    private ActivityFillInItemMapper activityFillInItemMapper;

    /**
     * 批量保存活动报名填写项
     *
     * @param activity
     * @param f
     * @return
     */
    public Integer saveSelective(Activity activity, List<ActivityFillInItem> f) {
        Integer count = 0;
        for (ActivityFillInItem a : f) {
            a.setActivityId(activity.getActivityId());
            a.init();
            count += super.saveSelective(a);
        }
        return count;
    }

    /**
     * 保存活动报名填写项
     *
     * @param activity
     * @param f
     * @return
     */
    public Integer saveSelective(Activity activity, ActivityFillInItem f) {
        f.setActivityId(activity.getActivityId());
        f.init();
        return super.saveSelective(f);
    }

    /**
     * 批量更新活动报名填写项
     *
     * @param activity
     * @param f
     * @return
     */
    public Integer updateSelective(Activity activity, List<ActivityFillInItem> f) {
        Integer count = 0;
        for (ActivityFillInItem af : f) {
            //判断是否存在id，没有则说明新增，反之为更新
            if (ObjectUtil.isNull(af.getFillInItemId())) {
                count = saveSelective(activity, af);
            } else {
                count += super.updateSelective(af);
            }
        }
        return count;
    }

    /**
     * 查询所有必填报名填写项  活动id为空且type值为0
     *
     * @return
     */
    public List<ActivityFillInItem> queryRequired() {
        ActivityFillInItem fillInItem = ActivityFillInItem.getInstance().toBuilder().type(0).build();
        return super.queryListByWhere(fillInItem);
    }

    /**
     * 根据活动id匹配报名填写项
     *
     * @param activityId 活动id
     * @return 返回 List<ActivityFillInItem>
     */
    public List<ActivityFillInItem> queryItemByActivityId(String activityId) {
        Example e = new Example(ActivityFillInItem.class);
        e.createCriteria()
                .andEqualTo("type", 0)
                .andEqualTo("type", 1)
                .andEqualTo("activityId", activityId);
        e.setDistinct(true);
        return activityFillInItemMapper.selectByExample(e);
    }
}
