/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ReportService
 * Author:   yuanyuana
 * Date:     2018/9/28 19:43
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.yixunlian.mapper.ReportMapper;
import com.yixunlian.pojo.Activity;
import com.yixunlian.pojo.Report;
import com.yixunlian.service.baseservice.BaseService;
import com.yixunlian.service.baseservice.GetService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/9/28
 * @since 1.0.0
 */
@Service
public class ReportService extends BaseService<Report> {

    @Resource(name = "reportMapper")
    private ReportMapper reportMapper;
    @Resource(name = "getService")
    private GetService getService;
    @Resource(name = "activityService")
    private ActivityService activityService;

    /**
     * 根据活动id查询举报对象
     *
     * @param activityId 活动id
     * @return 返回举报对象
     */
    private Report queryReportByActivity(String activityId) {
        Report report = Report.getReport();
        report.setActivityId(activityId);
        return super.queryOne(report);
    }

    /**
     * 根据活动查询举报对象
     *
     * @param activity 活动对象
     * @return 返回举报对象
     */
    public Report queryReportByActivity(Activity activity) {
        Report report = Report.getReport();
        report.setActivityId(activity.getActivityId());
        return super.queryOne(report);
    }

}
