/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: TaskListener
 * Author:   yuanyuana
 * Date:     2018/11/23 9:56
 * Description: 监听器用于服务启动初始化定时任务
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity.job;

import lombok.extern.slf4j.Slf4j;
import org.quartz.SchedulerException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * 〈一句话功能简述〉<br>
 * 〈监听器用于服务启动初始化定时任务〉
 *
 * @author yuanyuana
 * @create 2018/11/23
 * @since 1.0.0
 */
@Slf4j
public class TaskListener implements ServletContextListener {
    @Override
    public void contextDestroyed(ServletContextEvent arg0) {
    }

    @Override
    public void contextInitialized(ServletContextEvent arg0) {

        log.info("TaskListener", "定时任务初始化");
        JobManage m = (JobManage) BeanUtil.getBean("jobManage");
        try {
            m.initTask();
        } catch (SchedulerException e) {
            log.error("TaskListener", "定时任务初始化失败," + e.getMessage());
        }
    }

}

