/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: JobTest
 * Author:   yuanyuana
 * Date:     2018/11/18 15:29
 * Description: job、测试
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.job;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * 〈一句话功能简述〉<br>
 * 〈job、测试〉
 *
 * @author yuanyuana
 * @create 2018/11/18
 * @since 1.0.0
 */
@Component
@SuppressWarnings("unchecked")
@Slf4j
public class JobTest {

    public void test() {
        log.info("job定时启动");
        MyThread myThread = new MyThread();
        myThread.run();
    }

    class MyThread extends Thread {
        private int i = 0;

        @Override
        public void run() {
            for (i = 0; i < 100; i++) {
                System.out.println(Thread.currentThread().getName() + " " + i);
            }
        }
    }
}
