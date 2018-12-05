/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: FileJob
 * Author:   yuanyuana
 * Date:     2018/11/17 21:08
 * Description: 文件清理类
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.job;

import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.File;

/**
 * 〈一句话功能简述〉<br>
 * 〈文件清理类〉
 *
 * @author yuanyuana
 * @create 2018/11/17
 * @since 1.0.0
 */
@Component
@SuppressWarnings("unchecked")
@Slf4j
public class FileJob {

    /**
     * 删除临时文件夹里的所有文件，每月一号凌晨十二点执行
     */
    @Scheduled(cron = "0 0/1 * * * ?")
    public void delFolder() {
        File f = new File("C:\\file\\imgTemp");
        deleatfangf(f);
    }

    /**
     * 删除不需要
     */
    @Scheduled(cron = "0 0/1 * * * ?")
    public void delQrcodeFile() {
        File f = new File("C:\\file\\imgTemp");
        deleatfangf(f);
    }

    private void deleatfangf(File f) {
        if (f == null) {
            return;
        } else if (f.exists()) {//如果此抽象指定的对象存在并且不为空。
            if (f.isFile()) {
                f.delete();//如果此抽象路径代表的是文件，直接删除。
            } else if (f.isDirectory()) {//如果此抽象路径指代的是目录
                String[] str = f.list();//得到目录下的所有路径
                if (str == null) {
                    f.delete();//如果这个目录下面是空，则直接删除
                } else {//如果目录不为空，则遍历名字，得到此抽象路径的字符串形式。
                    for (String st : str) {
                        deleatfangf(new File(f, st));
                    }//遍历清楚所有当前文件夹里面的所有文件。
                    f.delete();//清楚文件夹里面的东西后再来清楚这个空文件夹
                }
            }
        }
    }

}

