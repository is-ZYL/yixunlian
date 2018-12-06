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
import com.yixunlian.controller.base.BaseController;
import com.yixunlian.entity.Result;
import com.yixunlian.pojo.Advertisementimage;
import com.yixunlian.pojo.Journalism;
import com.yixunlian.pojo.User;
import com.yixunlian.service.ActivityService;
import com.yixunlian.service.AdvertisementImageService;
import com.yixunlian.service.JournalismService;
import com.yixunlian.service.RedisService;
import com.yixunlian.service.baseservice.GetService;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.web.bind.annotation.*;
import util.myutils.ObjectUtil;
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
@RestController
@RequestMapping("app/front/homepage")
public class HomePageController extends BaseController {

    private static final Integer REDIS_TIME = 60 * 60 * 24 * 365;
    private static final Integer CODE_TIME = 60 * 60;
    private static final ObjectMapper MAPPER = new ObjectMapper();

    @Resource(name = "getService")
    private GetService getService;

    @Resource(name = "redisService")
    private RedisService rService;
    @Resource(name = "advertisementImageService")
    private AdvertisementImageService advertisementImageService;

    /**
     * 1 获取首页banner图
     *
     * @return 返回list
     */
    @GetMapping(value = "getListBanner")
    public Result<List<Advertisementimage>> getListBanner() {
        Advertisementimage advertisementimage = new Advertisementimage().toBuilder().isOnlineStatus(1).build();
        List<Advertisementimage> result = advertisementImageService.queryListByWhere(advertisementimage);
        return Result.success(result);
    }

    /**
     * 2 获取活动专区的总阅读量
     *
     * @return 返回list
     */
    @GetMapping(value = "getAllActivityViewNums")
    public Result<Long> getBanner() {
        ActivityService a = getService.getActivityService();
        Long result = a.queryViewsNums();
        return Result.success(null == result ? 0 : result);
    }

    /**
     * 3 根据token 分页获取新闻列表
     *
     * @return 返回list
     */
    @RequestMapping(value = "getJournalismListByToken", method = RequestMethod.GET)
    public Result<PageInfo<Journalism>> getJournalismListByToken(@RequestParam String token, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》分页获取新闻列表 3");
                return Result.error("404", "用户不存在");
            }
            JournalismService j = getService.getJournalismService();
            PageInfo<Journalism> result = j.queryJournalismByWhere(page, rows);
            return Result.success(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 4 根据token 根据新闻id查询新闻详情
     *
     * @return 返回list
     */
    @GetMapping(value = "getJournalismByTokenAndId")
    public Result<Journalism> getJournalismListByToken(@RequestParam String token, @RequestParam String journalismId) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            logger.error("----------token值错误------------》根据新闻id查询新闻详情 4");
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》根据新闻id查询新闻详情 4");
                return Result.error("206", "用户不存在");
            }
            if (ObjectUtil.notEmpty(journalismId)) {
                JournalismService j = getService.getJournalismService();
                Journalism result = j.queryById(journalismId);
                return Result.success(result);
            }
            logger.error("----------journalismId为空------------》根据新闻id查询新闻详情 4");
            return Result.error("参数异常");
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("----------服务器异常------------》根据新闻id查询新闻详情 4");
        return Result.error("500", "服务器异常");
    }

}
