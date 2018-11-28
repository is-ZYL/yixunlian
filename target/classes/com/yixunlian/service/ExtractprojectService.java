/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ExtractprojectService
 * Author:   yuanyuana
 * Date:     2018/10/22 14:43
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import util.myutils.ObjectUtil;
import com.yixunlian.mapper.ExtractprojectMapper;
import com.yixunlian.pojo.Activity;
import com.yixunlian.pojo.Extractproject;
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
 * @create 2018/10/22
 * @since 1.0.0
 */
@Service
public class ExtractprojectService extends BaseService<Extractproject> {

    @Resource(name = "extractprojectMapper")
    private ExtractprojectMapper extractprojectMapper;

    /**
     * 根据活动查询项目提成
     *
     * @param activity
     * @return
     */
    public List<Extractproject> queryListByActivity(Activity activity) {
        Extractproject e = Extractproject.getExtractproject().toBuilder().activityId(activity.getActivityId()).build();
        return super.queryListByWhere(e);
    }

    /**
     * 根据活动查询项目提成
     *
     * @param activityId
     * @return
     */
    public List<Extractproject> queryListByActivity(String activityId) {
        Extractproject e = Extractproject.getExtractproject();
        e.setActivityId(activityId);
        return super.queryListByWhere(e);
    }

    /**
     * 根据活动id查询总提成
     *
     * @param activityId
     * @return
     */
    public BigDecimal queryProjectRateSumByActivityId(String activityId) {
        return extractprojectMapper.queryProjectRateSumByActivityId(activityId);
    }

    /**
     * 批量保存活动提成项目表
     *
     * @param activity
     * @param e
     * @return
     */
    public Integer saveSelective(Activity activity, List<Extractproject> e) {
        Integer count = 0;
        for (Extractproject ex : e) {
            ex.setActivityId(activity.getActivityId());
            ex.init();
            count += super.saveSelective(ex);
        }
        return count;
    }

    /**
     * 保存活动提成项目表
     *
     * @param activity
     * @param e
     * @return
     */
    public Integer saveSelective(Activity activity, Extractproject e) {
        e.setActivityId(activity.getActivityId());
        e.init();
        return super.saveSelective(e);
    }

    /**
     * 批量更新活动提成
     *
     * @param activity
     * @param e
     * @return
     */
    public Integer updateSelective(Activity activity, List<Extractproject> e) {
        Integer count = 0;
        for (Extractproject ep : e) {
            //判断是否存在id，没有则说明新增，反之为更新
            if (ObjectUtil.isNull(ep.getExtractprojectId())) {
                count = saveSelective(activity, ep);
            } else {
                count += super.updateSelective(ep);
            }
        }
        return count;
    }

}
