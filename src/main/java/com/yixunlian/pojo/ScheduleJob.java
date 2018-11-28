/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ScheduleJob
 * Author:   yuanyuana
 * Date:     2018/11/23 9:46
 * Description: job任务实体类
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.pojo;

import lombok.*;
import util.myutils.UuidUtil;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Map;

/**
 * 〈一句话功能简述〉<br>
 * 〈job任务实体类〉
 *
 * @author yuanyuana
 * @create 2018/11/23
 * @since 1.0.0
 */
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
@Table(name = "td_schedule_job")
public class ScheduleJob extends BasePojo {

    /**
     * 任务id
     */
    @Id
    private String jobId;
    /**
     * 任务名称
     */
    private String jobName;
    /**
     * 任务分组
     */
    private String jobGroup;
    /**
     * 任务状态 0禁用 1启用 2删除
     */
    private int jobStatus;
    /**
     * 任务运行时间表达式
     */
    private String cronExpression;
    /**
     * 任务描述
     */
    private String jobDesc;

    /**
     * 参数
     */
    @Transient
    private Map parameter;

    public static ScheduleJob getsScheduleJob() {
        return new ScheduleJob();
    }

    public ScheduleJob init() {
        this.jobId = UuidUtil.get32UUID();
        return this;
    }
}
