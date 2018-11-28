/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: JobManage
 * Author:   yuanyuana
 * Date:     2018/11/23 9:50
 * Description: job管理类
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity.job;

import com.yixunlian.pojo.ScheduleJob;
import com.yixunlian.service.ScheduleJobService;
import lombok.extern.slf4j.Slf4j;
import org.codehaus.jackson.map.ObjectMapper;
import org.quartz.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈job管理类〉
 *
 * @author yuanyuana
 * @create 2018/11/23
 * @since 1.0.0
 */
@Slf4j
@Component
public class JobManage {
    private static final ObjectMapper MAPPER = new ObjectMapper();
    private static SchedulerFactoryBean schedulerFactoryBean;
    private static Scheduler scheduler;

    static {
        schedulerFactoryBean = (SchedulerFactoryBean) BeanUtil.getBeanByClass(SchedulerFactoryBean.class);
        scheduler = schedulerFactoryBean.getScheduler();
    }

    @Autowired(required = false)
    private ScheduleJobService scheduleJobService;

    /**
     * 初始化定时任务
     *
     * @throws SchedulerException
     */
    public void initTask() throws SchedulerException {
        //Scheduler scheduler = schedulerFactoryBean.getScheduler();  
        // 这里获取任务信息数据
        /**
         * 从数据库中读取
         */
        List<ScheduleJob> jobList = scheduleJobService.queryAll();
        for (ScheduleJob job : jobList) {
            addJob(job);
        }
    }

    /**
     * 添加一个任务
     *
     * @param job
     */
    public void addJob(ScheduleJob job) {
        try {
            TriggerKey triggerKey = TriggerKey.triggerKey(job.getJobName(), job.getJobGroup());
            // 获取trigger，即在spring配置文件中定义的 bean id="myTrigger"  
            CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);
            // 不存在，创建一个  
            if (null == trigger) {
                JobDetail jobDetail = JobBuilder.newJob(QuartzJobFactory.class)
                        .withIdentity(job.getJobName(), job.getJobGroup()).build();
                jobDetail.getJobDataMap().put("scheduleJob", job);
                // 表达式调度构建器  
                CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());
                // 按新的cronExpression表达式构建一个新的trigger  
                trigger = TriggerBuilder.newTrigger().withIdentity(job.getJobName(), job.getJobGroup())
                        .withSchedule(scheduleBuilder).build();
                scheduler.scheduleJob(jobDetail, trigger);
            } else {
                // Trigger已存在，那么更新相应的定时设置  
                // 表达式调度构建器  
                CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());
                // 按新的cronExpression表达式重新构建trigger  
                trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();
                // 按新的trigger重新设置job执行  
                scheduler.rescheduleJob(triggerKey, trigger);
            }
            if (job.getJobStatus() == 0) {
                pauseJob(job);
            }

        } catch (SchedulerException e) {
            // TODO Auto-generated catch block  
            e.printStackTrace();
        }
    }

    /**
     * 暂停一个job
     *
     * @param scheduleJob
     * @throws SchedulerException
     */
    public void pauseJob(ScheduleJob scheduleJob) {
        //Scheduler scheduler = schedulerFactoryBean.getScheduler();  
        log.info(scheduleJob.getJobName(), "定时任务暂停");
        JobKey jobKey = JobKey.jobKey(scheduleJob.getJobName(), scheduleJob.getJobGroup());
        try {
            scheduler.pauseJob(jobKey);
        } catch (SchedulerException e) {
            // TODO Auto-generated catch block  
            e.printStackTrace();
        }
    }

    /**
     * 恢复一个job
     *
     * @param scheduleJob
     */
    public void resumeJob(ScheduleJob scheduleJob) {
        log.info(scheduleJob.getJobName(), "定时任务启动");
        //Scheduler scheduler = schedulerFactoryBean.getScheduler();  
        JobKey jobKey = JobKey.jobKey(scheduleJob.getJobName(), scheduleJob.getJobGroup());
        try {
            scheduler.resumeJob(jobKey);
        } catch (SchedulerException e) {
            // TODO Auto-generated catch block  
            e.printStackTrace();
        }
    }

    /**
     * 删除一个任务
     *
     * @param job
     */
    public void removeJob(ScheduleJob job) {
        log.info(job.getJobName(), "删除定时任务");
        TriggerKey triggerKey = TriggerKey.triggerKey(job.getJobName(), job.getJobGroup());
        JobKey jobKey = JobKey.jobKey(job.getJobName(), job.getJobGroup());
        // 获取trigger，即在spring配置文件中定义的 bean id="myTrigger"  
        //CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);  
        try {
            scheduler.pauseTrigger(triggerKey);
            scheduler.unscheduleJob(triggerKey);
            scheduler.deleteJob(jobKey);
        } catch (SchedulerException e) {
            // TODO Auto-generated catch block  
            e.printStackTrace();
        }
    }
}
