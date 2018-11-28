/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: TestController
 * Author:   yuanyuana
 * Date:     2018/9/26 14:58
 * Description: 测试
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;

/**
 * 〈一句话功能简述〉<br>
 * 〈测试〉
 *
 * @author yuanyuana
 * @create 2018/9/26
 * @since 1.0.0
 */
@Controller
@RequestMapping({"/"})
public class WxConfigController {

    @RequestMapping({"MP_verify_wjyXmLOYK9QUnsq8.txt"})
    @ResponseBody
    private String returnConfigFile() {
        //把MP_verify_xxxxxx.txt中的内容返回
        return "wjyXmLOYK9QUnsq8";
    }
}

