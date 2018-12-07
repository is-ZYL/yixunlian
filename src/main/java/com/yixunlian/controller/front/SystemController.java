/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: SystemController
 * Author:   yuanyuana
 * Date:     2018/12/7 11:20
 * Description: 平台相关控制器
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.controller.front;

import com.yixunlian.controller.base.BaseController;
import com.yixunlian.entity.Result;
import com.yixunlian.pojo.User;
import com.yixunlian.pojo.system.Systembulletin;
import com.yixunlian.service.SystembulletinService;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import util.myutils.ObjectUtil;
import util.myutils.TokenUtils;

import javax.annotation.Resource;

/**
 * 〈一句话功能简述〉<br>
 * 〈平台相关控制器〉
 *
 * @author yuanyuana
 * @create 2018/12/7
 * @since 1.0.0
 */
@RestController
@RequestMapping("app/front/platform")
public class SystemController extends BaseController {

    private static final ObjectMapper MAPPER = new ObjectMapper();

    @Resource(name = "systembulletinService")
    private SystembulletinService systembulletinService;

    /**
     * 1 根据token type 查看系统信息（包括关于我们,活动功能介绍等）
     *
     * @param type  类型值
     * @param token token值
     * @return
     */
    @GetMapping(value = "getPlatformInfoByToken")
    public Result<Systembulletin> getPlatformInfoByToken(@RequestParam String token, @RequestParam Integer type) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                return Result.error("206", "用户不存在");
            }
            if (ObjectUtil.isNull(type)) {
                return Result.error("403", "参数异常");
            }

            /*------------------逻辑代码--------------------------*/

            Systembulletin systembulletin = new Systembulletin();
            systembulletin.setSystemStatus(type);
            systembulletin = systembulletinService.queryOne(systembulletin);
            return null == systembulletin ? Result.<Systembulletin>error("404", "未查询到相关信息") : Result.success("200", "查询成功", systembulletin);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 出错500
        return Result.error("500", "服务器异常");
    }
}
