/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: QuartzJobFactory
 * Author:   yuanyuana
 * Date:     2018/11/23 9:52
 * Description: job工厂类
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity.job;

import com.yixunlian.pojo.ScheduleJob;
import lombok.extern.slf4j.Slf4j;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobExecutionContext;

/**
 * 〈一句话功能简述〉<br>
 * 〈job工厂类〉
 *
 * @author yuanyuana
 * @DisallowConcurrentExecution 注解说明： 只有上一个人任务执行完毕才可以执行下一次任务
 * @create 2018/11/23
 * @since 1.0.0
 */
@DisallowConcurrentExecution
@Slf4j
public class QuartzJobFactory implements Job {

    @Override
    public void execute(JobExecutionContext context) {
        ScheduleJob scheduleJob = null;
        try {
            scheduleJob = (ScheduleJob) context.getMergedJobDataMap().get("scheduleJob");
            log.info(scheduleJob.getJobName(), "任务开始");
            //((TaskService) BeanUtil.getBeanByClass(scheduleJob.getClass())).exe();
            new TaskServiceImpl().exe();
            log.info(scheduleJob.getJobName(), "任务结束");
        } catch (Exception e) {
            log.error("任务执行异常", scheduleJob.getJobName());
            e.printStackTrace();
        }
        log.info("任务结束", scheduleJob.getJobName());
    }
}
