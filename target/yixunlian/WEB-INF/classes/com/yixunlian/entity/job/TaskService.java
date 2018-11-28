package com.yixunlian.entity.job;

/**
 * created with Intellij IDEA
 *
 * @author : yuanyuana
 * Date : 2018-11-23
 * Time : 9:54
 */
public interface TaskService {
    /**
     * 具体业务逻辑
     */
    public abstract void exe();

    /**
     * 会员到期任务
     */
    public abstract void memberexpires();
}
