/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: CoreController
 * Author:   yuanyuana
 * Date:     2018/11/4 18:15
 * Description: 接收、处理、响应微信公众号消息
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.controller.weixin;

import com.yixunlian.controller.base.BaseController;
import com.yixunlian.service.weixin.CoreService;
import javafx.scene.text.TextBuilder;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import util.express.util.SignUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 〈一句话功能简述〉<br>
 * 〈接收、处理、响应微信公众号消息〉
 *
 * @author yuanyuana
 * @create 2018/11/4
 * @since 1.0.0
 */
@RestController
public class CoreController extends BaseController {

    @GetMapping(value = "signature", produces = "text/plain;CHARSET=utf-8")
    public String authGet(HttpServletRequest request) {
        // 微信加密签名
        String signature = request.getParameter("signature");
        // 时间戳
        String timestamp = request.getParameter("timestamp");
        // 随机数
        String nonce = request.getParameter("nonce");
        // 随机字符串
        String echostr = request.getParameter("echostr");

        logger.info("\n接收到来自微信服务器的认证消息：[{}, {}, {}, {}]", signature, timestamp, nonce, echostr);

        if (StringUtils.isAnyBlank(signature, timestamp, nonce, echostr)) {
            throw new IllegalArgumentException("请求参数非法，请核实!");
        }

        //通过检验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败
        if (SignUtil.checkSignature(timestamp, nonce, signature)) {
            logger.info("\n进入判断：[{}]", echostr);
            return echostr;
        }
        return "非法请求";
    }

    @PostMapping(produces = "application/xml; CHARSET=UTF-8")
    public String post(HttpServletRequest request) {
        // 微信加密签名
        String signature = request.getParameter("signature");
        // 时间戳
        String timestamp = request.getParameter("timestamp");
        // 随机数
        String nonce = request.getParameter("nonce");
        // 随机字符串
        String echostr = request.getParameter("echostr");

        logger.info("\n接收到来自微信服务器的认证消息：[{}, {}, {}, {}]", request);
        // 调用核心业务类接收消息、处理消息
        return CoreService.processRequest(request);
    }
}
