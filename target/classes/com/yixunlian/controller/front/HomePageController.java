/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: HomePageController
 * Author:   yuanyuana
 * Date:     2018/10/16 16:42
 * Description: 首页控制器
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.controller.front;

import com.github.pagehelper.PageInfo;
import util.myutils.ObjectUtil;
import com.yixunlian.controller.base.BaseController;
import com.yixunlian.pojo.Advertisementimage;
import com.yixunlian.pojo.Journalism;
import com.yixunlian.pojo.User;
import com.yixunlian.service.*;
import com.yixunlian.service.baseservice.GetService;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import util.myutils.TokenUtils;

import javax.annotation.Resource;
import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈首页控制器〉
 *
 * @author yuanyuana
 * @create 2018/10/16
 * @since 1.0.0
 */
@Controller
@RequestMapping("app/front/homepage")
public class HomePageController extends BaseController {

    private static final Integer REDIS_TIME = 60 * 60 * 24 * 365;
    private static final Integer CODE_TIME = 60 * 60;
    private static final ObjectMapper MAPPER = new ObjectMapper();

    @Resource(name = "getService")
    private GetService getService;

    @Resource(name = "redisService")
    private RedisService rService;

    /**
     * 1 获取首页banner图
     *
     * @return 返回list
     */
    @RequestMapping(value = "getListBanner", method = RequestMethod.GET)
    public ResponseEntity<List<Advertisementimage>> getListBanner() {
        AdvertisementImageService a = getService.getAdvertisementImageService();
        List<Advertisementimage> result = a.queryAll();
        return ResponseEntity.ok(result);
    }

    /**
     * 2 获取活动专区的总阅读量
     *
     * @return 返回list
     */
    @RequestMapping(value = "getAllActivityViewNums", method = RequestMethod.GET)
    public ResponseEntity<Long> getBanner() {
        ActivityService a = getService.getActivityService();
        Long result = a.queryViewsNums();
        return ResponseEntity.ok(result);
    }

    /**
     * 3 根据token 分页获取新闻列表
     *
     * @return 返回list
     */
    @RequestMapping(value = "getJournalismListByToken", method = RequestMethod.GET)
    public ResponseEntity<PageInfo<Journalism>> getJournalismListByToken(@RequestParam String token, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return ResponseEntity.status(HttpStatus.NO_CONTENT).body(null);
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》分页获取新闻列表 3");
                return ResponseEntity.status(HttpStatus.FORBIDDEN).body(null);
            }
            JournalismService j = getService.getJournalismService();
            PageInfo<Journalism> result = j.queryJournalismByWhere(page, rows);
            return ResponseEntity.ok(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 出错500
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }



}
