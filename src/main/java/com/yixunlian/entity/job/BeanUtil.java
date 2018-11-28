/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: BeanUtil
 * Author:   yuanyuana
 * Date:     2018/11/23 9:55
 * Description: spring获取bean工具类
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity.job;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

/**
 * 〈一句话功能简述〉<br>
 * 〈spring获取bean工具类〉
 *
 * @author yuanyuana
 * @create 2018/11/23
 * @since 1.0.0
 */
@Component
public class BeanUtil implements ApplicationContextAware {
    private static ApplicationContext context;

    public static Object getBean(String beanName) {
        return context.getBean(beanName);
    }

    public static <T> Object getBeanByClass(Class<T> c) {
        return context.getBean(c);
    }

    @Override
    public void setApplicationContext(ApplicationContext arg0) throws BeansException {
        context = arg0;
    }
}

