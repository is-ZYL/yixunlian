/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: UserController
 * Author:   yuanyuana
 * Date:     2018/9/21 16:36
 * Description: 用户处理器
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.controller.front;

import com.github.pagehelper.PageInfo;
import com.yixunlian.controller.base.BaseController;
import com.yixunlian.entity.*;
import com.yixunlian.entity.job.JobManage;
import com.yixunlian.pojo.*;
import com.yixunlian.service.*;
import com.yixunlian.service.baseservice.GetService;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.web.bind.annotation.*;
import util.myutils.ObjectUtil;
import util.myutils.TokenUtils;
import util.myutils.file.FileUpload;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈活动控制器〉
 *
 * @author yuanyuana
 * @create 2018/9/21
 * @since 1.0.0
 */
@RestController
@RequestMapping("app/front/activity")
public class ActivityController extends BaseController {

    private static final Integer REDIS_TIME = 60 * 60 * 24 * 365;
    private static final Integer CODE_TIME = 60 * 60;
    private static final ObjectMapper MAPPER = new ObjectMapper();
    /**
     * 执行成功标识 返回1
     */
    private static final Integer SUCCESS = 1;
    /**
     * 执行失败标识 返回0
     */
    private static final Integer FAIL = 0;
    @Resource(name = "getService")
    private GetService getService;

    @Resource(name = "redisService")
    private RedisService rService;
    @Resource(name = "activityService")
    private ActivityService activityService;
    @Resource(name = "aidFundService")
    private AidFundService aidFundService;
    @Resource(name = "organizerInfoService")
    private OrganizerInfoService organizerInfoService;
    @Resource(name = "activitycategoryService")
    private ActivitycategoryService activitycategoryService;
    @Resource(name = "activitymusicurlService")
    private ActivitymusicurlService activitymusicurlService;
    @Resource(name = "activityFillInItemService")
    private ActivityFillInItemService activityFillInItemService;
    @Resource(name = "activitysignService")
    private ActivitysignService activitysignService;
    @Resource(name = "reportService")
    private ReportService reportService;
    @Resource(name = "userService")
    private UserService userService;
    @Resource(name = "uenrollandactivityService")
    private UenrollandactivityService ueService;
    @Resource(name = "userandhobbyService")
    private UserandhobbyService userandhobbyService;
    @Resource(name = "uhobbyandactivitycategoryService")
    private UhobbyandactivitycategoryService uhobbyandactivitycategoryService;
    @Resource(name = "transactionItemService")
    private TransactionItemService transactionItemService;

    @PostMapping(value = "test111")
    public Result<String> test() {
        JobManage jobManage = new JobManage();
        jobManage.addJob(ScheduleJob.getsScheduleJob().toBuilder().jobDesc("任务测试").jobStatus(1).jobName("两秒执行一次").jobGroup("第一组").cronExpression("0/2 * * * * ?").build());
        return Result.success("ok");
    }

    @PostMapping(value = "test222")
    public Result<String> test1() {
        JobManage jobManage = new JobManage();
        jobManage.addJob(ScheduleJob.getsScheduleJob().toBuilder().jobDesc("任务测试2").jobStatus(1).jobName("两秒执行一次2").jobGroup("第二组").cronExpression("0/2 * * * * ?").build());
        return Result.success("ok");
    }

    @PostMapping(value = "test333")
    public Result<String> test3(@RequestParam String name, @RequestParam String group) {
        JobManage jobManage = new JobManage();
        jobManage.pauseJob(ScheduleJob.getsScheduleJob().toBuilder().jobName(name).jobGroup(group).build());
        return Result.success("ok");
    }

    /**
     * 1 活动主办方更改信息
     *
     * @param token         token
     * @param organizerInfo 主办方信息
     * @return 返回活动主办方信息
     */
    @PostMapping("activityUserUpdateHeadUrl")
    public Result<OrganizerInfo> activityUserUpdateHeadUrl(@RequestParam String token, OrganizerInfo organizerInfo, @RequestParam String oldUrl) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("----------token值错误------------》活动主办方更改信息 1");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("----------用户不存在------------》活动主办方更改信息 1");
                return Result.error("206", "用户不存在");
            }
            OrganizerInfo o = organizerInfoService.queryOneByUser(u);
            if (ObjectUtil.isNull(o)) {
                return Result.error("209", "没有用户的活动主办方信息");
            }
            organizerInfo.setUserId(u.getUserId());
            organizerInfo.setOrganizerInfoId(o.getOrganizerInfoId());
            if (organizerInfoService.updateByOrganizerInfo(u, organizerInfo) > 0) {
                OrganizerInfo o1 = organizerInfoService.queryOneByUser(u);
                //删除之前的图片
                FileUpload.delFile("c:" + oldUrl);
                return Result.success("200", "主办方信息更新成功", o1);
            }
            logger.error("----------数据库更新失败------------》活动主办方更改信息 1");
            return Result.error("206", "主办方信息更新失败");
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("----------服务器异常------------》用户更改头像 1");
        return Result.error("500", "服务器异常");
    }

    /**
     * 2 保存活动主办方信息
     *
     * @param token         token值
     * @param organizerInfo 主办方信息
     * @return 1 添加成功 0 添加失败
     */
    @PostMapping("activityUserSaveInfo")
    public Result<Integer> activityUserSaveInfo(@RequestParam String token, OrganizerInfo organizerInfo) {
        logger.info("进入活动主办方，方法[{},{}]" + token, organizerInfo);
        if (!organizerInfoService.checkOrganizerInfoIsOk(organizerInfo)) {
            return Result.error("403", "参数异常");
        }
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》保存活动主办方信息 2");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("--------用户不存在----------》保存活动主办方信息 2");
                return Result.error("206", "用户不存在");
            }
            OrganizerInfo o1 = organizerInfoService.queryOneByUser(u);
            if (ObjectUtil.isNotNull(o1)) {
                return Result.error("207", "已有活动主办方信息");
            }
            u = userService.queryById(u.getUserId());
            Integer save = organizerInfoService.saveByOrganizerInfo(u, organizerInfo);
            if (save > 0) {
                return Result.success("保存成功", SUCCESS);
            }
            logger.error("------保存至数据库异常--------》保存活动主办方信息 2");
            return Result.error("209", "保存失败");
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("----------服务器异常------------》保存活动主办方信息 2");
        return Result.error("500", "服务器异常");
    }

    /**
     * 2-1 保存活动信息
     *
     * @param activityInfo 活动所有信息
     * @return 1 添加成功 0 添加失败
     */
    @PostMapping("activitySaveInfoByToken")
    public Result<String> activitySaveInfoByToken(@RequestBody ActivityInfo activityInfo) {
        logger.info("活动信息为：" + activityInfo);
        if (ObjectUtil.isNull(activityInfo)) {
            logger.error("----------参数为空------------》保存活动信息 2-1");
            return Result.error("403", "参数为空");
        }
        String data = TokenUtils.getDataByKey(activityInfo.getToken());
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》保存活动信息 2-1");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                return Result.error("206", "用户不存在");
            }
            //保存为草稿
            if (0 == activityInfo.getType()) {
                String result = activityService.saveSelectiveByActivityInfoAndUser(u, activityInfo);
                if (ObjectUtil.notEmpty(result)) {
                    return Result.success("200", "活动草稿保存成功", result);
                }
                return Result.error("209", "活动草稿保存失败");
            } else {
                //发布活动
                Result r = activityService.checkActivityInfo(activityInfo);
                //检查不合格
                String failed = "0";
                if (failed.equals(r.getData())) {
                    return Result.error("207", "活动信息不符合要求");
                } else {
                    String result = activityService.saveSelectiveByActivityInfoAndUser(u, activityInfo);
                    if (ObjectUtil.notEmpty(result)) {
                        return Result.success("200", "成功", result);
                    }
                    return Result.error("209", "保存失败", null);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("----------服务器异常------------》保存活动信息 2-1");
        return Result.error("500", "服务器异常");
    }

    /**
     * 2-2 更新活动信息
     *
     * @param activityInfo 活动所有信息
     * @return 1 更新成功 0 更新失败
     */
    @PostMapping("updateActivityInfoByToken")
    public Result<Integer> updateActivityInfoByToken(@RequestBody ActivityInfo activityInfo) {
        if (ObjectUtil.isNull(activityInfo)) {
            logger.error("----------参数为空------------》保存活动信息 2-1");
            return Result.error("403", "参数为空");
        }
        String data = TokenUtils.getDataByKey(activityInfo.getToken());
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》保存活动信息 2-1");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                return Result.error("206", "用户不存在");
            }
            //保存为草稿
            if (0 == activityInfo.getType()) {
                if (ObjectUtil.isEmpty(activityInfo.getActivity().getActivityId())) {
                    return Result.error("208", "活动信息不符合");
                }
                Integer integer = activityService.updateSelectiveByActivityInfoAndUser(u, activityInfo);
                if (integer > 0) {
                    return Result.success("200", "活动草稿保存成功");
                }
                return Result.error("209", "活动草稿保存失败");
            } else {
                //发布活动
                Result r = activityService.checkActivityInfo(activityInfo);
                //检查不合格
                String failed = "0";
                if (failed.equals(r.getData())) {
                    return Result.error("207", "活动信息不符合要求");
                } else {
                    String result = activityService.saveSelectiveByActivityInfoAndUser(u, activityInfo);
                    if (ObjectUtil.notEmpty(result)) {
                        return Result.success("200", "成功");
                    }
                    return Result.error("209", "失败");
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("----------服务器异常------------》保存活动信息 2-1");
        return Result.error("500", "服务器异常");
    }

    /**
     * 2-3 根据token 活动id  查询活动详情
     *
     * @param token      token
     * @param activityId 活动id
     * @return 返回活动详情
     */
    @GetMapping(value = "getActivityDetailByIdAndToken")
    public Result<ActivityInfo> getActivityDetailByToken(@RequestParam String token, @RequestParam String activityId) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》查询活动详情 2-2");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("--------用户不存在---------》查询活动详情 2-2");
                return Result.error("206", "用户不存在");
            }
            if (ObjectUtil.isNull(activityId)) {
                return Result.error("207", "参数异常");
            }
            ActivityInfo result = activityService.queryActivityDetail(activityId);
            if (ObjectUtil.isNull(result)) {
                return Result.error("404", "无此活动数据");
            }
            return Result.success(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("--------服务器异常---------》主办方查询草稿箱的活动 12");
        return Result.error("500", "服务器异常");
    }

    /**
     * 3 根据token 查询活动主办方信息
     *
     * @param token token值
     * @return 返回主办方对象  OrganizerInfo
     */
    @GetMapping(value = "getActivityUserDetail")
    public Result<OrganizerInfo> getActivityUserDetail(@RequestParam String token) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》查询活动主办方信息 3");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("--------用户不存在----------》查询活动主办方信息 3");
                return Result.error("206", "用户不存在");
            }
            OrganizerInfo o = organizerInfoService.queryOneByUser(u);
            return Result.success(o);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("----------服务器异常------------》查询活动主办方信息 3");
        return Result.error("500", "服务器异常");
    }

    /**
     * 4 根据token 查询活动类别
     *
     * @param token token值
     * @return 返回活动列表集合  List<Activitycategory>
     */
    @GetMapping(value = "getActivitycategoryListByToken")
    public Result<List<Activitycategory>> getActivitycategoryListByToken(@RequestParam String token) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》查询活动类别 4");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("--------用户不存在---------》查询活动类别 4");
                return Result.error("206", "用户不存在");
            }
            List<Activitycategory> activitycategories = activitycategoryService.queryAll();
            return Result.success(activitycategories);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("--------服务器异常---------》查询活动类别 4");
        return Result.error("500", "服务器异常");
    }

    /**
     * 5 根据token 查询活动音乐
     *
     * @param token token值
     * @return 返回活动音乐集合  OrganizerInfo
     */
    @GetMapping(value = "getActivityMusicListByToken")
    public Result<List<Activitymusicurl>> getActivityMusicListByToken(@RequestParam String token) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》查询活动音乐 5");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("--------用户不存在---------》查询活动音乐 5");
                return Result.error("206", "用户不存在");
            }
            List<Activitymusicurl> activitymusicurls = activitymusicurlService.queryAll();
            return Result.success(activitymusicurls);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("--------服务器异常---------》查询活动音乐 5");
        return Result.error("500", "服务器异常");
    }

    /**
     * 6 根据token 查询活动必填的报名填写项
     *
     * @param token token值
     * @return 返回list  List<ActivityFillInItem>
     */
    @GetMapping(value = "getActivityFillInItemListByToken")
    public Result<List<ActivityFillInItem>> getActivityActivityFillInItemByToken(@RequestParam String token) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》查询活动必填的报名填写项 6");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("--------用户不存在---------》查询活动必填的报名填写项 6");
                return Result.error("206", "用户不存在");
            }
            List<ActivityFillInItem> itemList = activityFillInItemService.queryRequired();
            return Result.success(itemList);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("--------服务器异常---------》查询活动必填的报名填写项 6");
        return Result.error("500", "服务器异常");
    }

    /**
     * 6-1 根据token 查询活动报名填写项
     *
     * @param activityId 活动id
     * @param token      token值
     * @return 返回list  List<ActivityFillInItem>
     */
    @GetMapping(value = "getActivityFillInItemListByActivityId")
    public Result<List<ActivityFillInItem>> getActivityActivityFillInItemByToken(@RequestParam String token, @RequestParam String activityId) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》查询活动报名填写项 6-1");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("--------用户不存在---------》查询活动报名填写项 6-1");
                return Result.error("206", "用户不存在");
            }
            if (ObjectUtil.isNull(activityId)) {
                //用户为空返回403
                logger.error("--------参数异常  activityId is null---------》查询活动报名填写项 6-1");
                return Result.error("207", "参数异常");
            }
            List<ActivityFillInItem> itemList = activityFillInItemService.queryItemByActivityId(activityId);
            return Result.success(itemList);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("--------服务器异常---------》查询活动报名填写项 6-1");
        return Result.error("500", "服务器异常");
    }

    /**
     * 7 根据token 关键字匹配已发布的活动（活动专区）
     *
     * @param token                token值
     * @param provinceCitycode     省
     * @param cityCitycode         市/县
     * @param areaCitycode         区
     * @param activityChargestatus 活动费用 0 免费 1收费
     * @param activityType         活动类型 0为线上，1线下
     * @param searchVal            输入框中的内容（主办方名称/活动名称）
     * @return 返回活动列表
     */
    @GetMapping(value = "getActivityListByKeywordsAndToken")
    public Result<List<ActivityInfo>> getActivityListByKeywordsAndToken(@RequestParam String token, @RequestParam(defaultValue = "") String provinceCitycode, @RequestParam(defaultValue = "") String cityCitycode, @RequestParam(defaultValue = "") String areaCitycode, @RequestParam(defaultValue = "") Integer activityChargestatus, @RequestParam(defaultValue = "") Integer activityType, @RequestParam(defaultValue = "") String searchVal, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer row) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》关键字匹配已发布的活动 7");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("--------用户不存在---------》关键字匹配已发布的活动 7");
                return Result.error("206", "用户不存在");
            }
            List<ActivityInfo> result = activityService.queryActivityListBySearch(u, provinceCitycode, cityCitycode, areaCitycode, activityChargestatus, activityType, searchVal, page, row);
            return Result.success(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("--------服务器异常---------》关键字匹配已发布的活动 7");
        return Result.error("500", "服务器异常");
    }

    /**
     * 8 根据token 主办方查看我已发布的活动
     *
     * @param token token
     * @param page  当前页
     * @param row   每页像显示条数
     * @return 返回活动列表
     */
    @GetMapping(value = "getPublishedActivityListByToken")
    public Result<List<ActivityResult>> getPublishedActivityListByToken(@RequestParam String token, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer row) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》主办方查看我已发布的活动 8");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("--------用户不存在---------》主办方查看我已发布的活动 8");
                return Result.error("206", "用户不存在");
            }
            List<ActivityResult> result = activityService.queryPublishedActivityList(u, page, row);
            return Result.success(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("--------服务器异常---------》主办方查看我已发布的活动 8");
        return Result.error("500", "服务器异常");
    }

    /**
     * 9 根据token 主办方查询我的已下架活动
     *
     * @param token token
     * @param page  当前页
     * @param row   每页像显示条数
     * @return 返回活动列表
     */
    @GetMapping(value = "getObtainedActivityListByToken")
    public Result<PageInfo<Activity>> getObtainedActivityListByToken(@RequestParam String token, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer row) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》用户查询我的已下架活动 9");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("--------用户不存在---------》用户查询我的已下架活动 9");
                return Result.error("206", "用户不存在");
            }
            PageInfo<Activity> result = activityService.queryObtainedActivityList(u, page, row);
            return Result.success(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("--------服务器异常---------》用户查询我的已下架活动 9");
        return Result.error("500", "服务器异常");
    }

    /**
     * 10 根据token 主办方查询我的已结束活动
     *
     * @param token 用户token值
     * @param page  页码
     * @param row   每页条数
     * @return 返回活动列表
     */
    @GetMapping(value = "getOverActivityListByToken")
    public Result<List<ActivityResult>> getOverActivityListByToken(@RequestParam String token, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer row) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》主办方查询我的已结束活动 10");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("--------用户不存在---------》主办方查询我的已结束活动 10");
                return Result.error("206", "用户不存在");
            }
            List<ActivityResult> result = activityService.queryOverActivityList(u, page, row);
            return Result.success(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("--------服务器异常---------》主办方查询我的已结束活动 10");
        return Result.error("500", "服务器异常");
    }

    /**
     * 11 根据token 主办方查询我的被举报活动
     *
     * @param token 用户token值
     * @param page  页码
     * @param row   每页条数
     * @return 返回活动列表
     */
    @GetMapping(value = "getReportedActivityListByToken")
    public Result<List<ActivityResult>> getReportedActivityListByToken(@RequestParam String token, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer row) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》主办方查询我的被举报活动 11");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("--------用户不存在---------》主办方查询我的被举报活动 11");
                return Result.error("206", "用户不存在");
            }
            List<ActivityResult> result = activityService.queryReportedActivityList(u, page, row);
            return Result.success(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("--------服务器异常---------》主办方查询我的被举报活动 11");
        return Result.error("500", "服务器异常");
    }

    /**
     * 12 根据token 主办方查询草稿箱的活动
     *
     * @param token 用户token值
     * @param page  页码
     * @param row   每页条数
     * @return 返回活动列表
     */
    @GetMapping(value = "getDraftsActivityListByToken")
    public Result<List<ActivityResult>> getDraftsActivityListByToken(@RequestParam String token, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer row) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》主办方查询草稿箱的活动 12");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("--------用户不存在---------》主办方查询草稿箱的活动 12");
                return Result.error("206", "用户不存在");
            }
            List<ActivityResult> result = activityService.queryDraftsActivityList(u, page, row);
            return Result.success(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("--------服务器异常---------》主办方查询草稿箱的活动 12");
        return Result.error("500", "服务器异常");
    }

    /**
     * 13 根据token 主办方查看客户管理
     *
     * @param token 用户token值
     * @param page  页码
     * @param row   每页条数
     * @return 返回活动列表
     */
    @GetMapping(value = "getViewUserManagementListByToken")
    public Result<List<ActivityResult>> getViewUserManagementListByToken(@RequestParam String token, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer row) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》主办方查看客户管理 13");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("--------用户不存在---------》主办方查看客户管理 13");
                return Result.error("206", "用户不存在");
            }
            List<ActivityResult> result = activityService.queryViewUserManagementList(u, page, row);
            return Result.success(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("--------服务器异常---------》主办方查看客户管理 13");
        return Result.error("500", "服务器异常");
    }

    /**
     * 14 根据token 主办方查看活动报名情况
     *
     * @param token          用户token值
     * @param activityId     活动id
     * @param dealStatus     用户每个活动收费对应的支付状态0，为未成交，1为已成交
     * @param usersignStatus 签到状态，0为未签到，1表示已签到
     * @param paymentStatus  支付提成给经理人的支付状态 0 未支付  1已支付
     * @return 返回当前活动的报名详情
     */
    @GetMapping(value = "getEventRegistrationByTokenAndActivityId")
    public Result<ActivityResult> getEventRegistrationByTokenAndActivityId(@RequestParam String token, @RequestParam String activityId, @RequestParam(defaultValue = "") Integer dealStatus, @RequestParam(defaultValue = "") Integer usersignStatus, @RequestParam(defaultValue = "") Integer paymentStatus, @RequestParam(defaultValue = "") String keywords) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》主办方查看活动报名情况 14");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("--------用户不存在---------》主办方查看活动报名情况 14");
                return Result.error("206", "用户不存在");
            }
            if (ObjectUtil.isEmpty(activityId)) {
                //用户为空返回403
                logger.error("--------参数异常---------》主办方查看活动报名情况 14");
                return Result.error("207", "参数异常");
            }
            Activity activity = activityService.queryById(activityId);
            if (ObjectUtil.isNotNull(activity) && !activity.getUserId().equals(u.getUserId())) {
                return Result.error("209", "没有权限查看");
            }
            if (0 == activity.getOnlineStatus() || 2 == activity.getOnlineStatus()) {
                ActivityResult result = ueService.queryListByWhere(activityId, dealStatus, usersignStatus, paymentStatus, keywords);
                return Result.success(result);
            }
            return Result.error("403", "活动异常");
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("--------服务器异常---------》主办方查看活动报名情况 14");
        return Result.error("500", "服务器异常");
    }

    /**
     * 15 根据token 用户活动报名
     *
     * @param activitySingInfo 活动报名参数
     * @return 返回活动报名结果
     */
    @PostMapping(value = "userActivitySignUpByTokenAndActivityId")
    public Result userActivitySignUpByTokenAndActivityId(@RequestBody ActivitySingInfo activitySingInfo) {
        logger.info("活动报名===token__activityId__activitySions,[{},{},{}]", activitySingInfo.getToken(), activitySingInfo.getActivityId(), activitySingInfo.getActivitySign());
        String data = TokenUtils.getDataByKey(activitySingInfo.getToken());
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》用户活动报名 15");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("--------用户不存在---------》用户活动报名 15");
                return Result.error("206", "用户不存在");
            }
            if (ObjectUtil.isEmpty(activitySingInfo.getActivityId()) || ObjectUtil.isNull(activitySingInfo.getActivitySign())) {
                //用户为空返回403
                logger.error("--------参数异常---------》用户活动报名 15");
                return Result.error("207", "参数异常");
            }
            u = userService.queryById(u.getUserId());
            logger.info("活动报名，用户信息 u:{}", u);
            return activityService.activitySignUp(u, activitySingInfo);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("--------服务器异常---------》用户活动报名 15");
        return Result.error("500", "服务器异常");
    }

    /**
     * 16 根据token 查询用户是否已经报名活动
     *
     * @param token      token
     * @param activityId 活动id
     * @return 返回 0 未报名  1 已报名
     */
    @GetMapping(value = "userIsActivitySignUpByTokenAndActivityId")
    public Result<Integer> userIsActivitySignUpByTokenAndActivityId(@RequestParam String token, @RequestParam String activityId) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》查询用户是否已经报名活动 16");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("--------用户不存在---------》查询用户是否已经报名活动 16");
                return Result.error("206", "用户不存在");
            }
            if (ObjectUtil.isEmpty(activityId)) {
                //用户为空返回403
                logger.error("--------参数异常---------》查询用户是否已经报名活动 16");
                return Result.error("207", "参数异常");
            }
            return ueService.queryOneByUser(u.getUserId(), activityId) == null ? Result.success("未报名", 0) : Result.success("已报名", 1);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("--------服务器异常---------》查询用户是否已经报名活动 16");
        return Result.error("500", "服务器异常");
    }

    /**
     * 17 根据token 主办方查询用户的报名信息
     *
     * @param token      token
     * @param activityId 活动id
     * @param userId     用户id
     * @return 返回 当前用户的报名信息
     */
    @GetMapping(value = "organizerCheckUserInfoByToken")
    public Result<ActivitySignUpInfo> organizerCheckUserInfoByToken(@RequestParam String token, @RequestParam String activityId, @RequestParam String userId) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》主办方查询用户的报名信息 17");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("--------用户不存在---------》主办方查询用户的报名信息 17");
                return Result.error("206", "用户不存在");
            }
            if (ObjectUtil.isEmpty(activityId)) {
                //用户为空返回403
                logger.error("--------参数异常---------》主办方查询用户的报名信息 17");
                return Result.error("207", "参数异常");
            }
            return activityService.queryActivitySignUpInfo(u.getUserId(), activityId, userId);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("--------服务器异常---------》主办方查询用户的报名信息 17");
        return Result.error("500", "服务器异常");
    }

    /**
     * 18 根据token 查询当前活动的所有报名用户信息
     *
     * @param activityId 活动id
     * @param token      token值
     * @return 返回list  List<ActivityFillInItem>
     */
    @GetMapping(value = "getActivitySignListByActivityId")
    public Result<List<ActivitySignUpInfo>> getActivitySignListByActivityId(@RequestParam String token, @RequestParam String activityId) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》查询当前活动的所有报名用户信息 18");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("--------用户不存在---------》查询当前活动的所有报名用户信息 18");
                return Result.error("206", "用户不存在");
            }
            if (ObjectUtil.isNull(activityId)) {
                //用户为空返回403
                logger.error("--------参数异常  activityId is null---------》查询当前活动的所有报名用户信息 18");
                return Result.error("207", "参数异常");
            }
            return activityService.queryActivitySignUpInfoList(u.getUserId(), activityId);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("--------服务器异常---------》查询当前活动的所有报名用户信息 18");
        return Result.error("500", "服务器异常");
    }

    /**
     * 19  根据token 活动主办方填写报名用户备注
     *
     * @param ue    报名用户信息
     * @param token token值
     * @return 返回 0 失败  1 成功
     */
    @PostMapping(value = "saveUenrollandactivityByActivityId")
    public Result<Integer> saveUenrollandactivityByActivityId(@RequestParam String token, Uenrollandactivity ue) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》活动主办方填写报名用户备注 19");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("--------用户不存在---------》活动主办方填写报名用户备注 19");
                return Result.error("206", "用户不存在");
            }
            if (ObjectUtil.isNull(ue) && ObjectUtil.isEmpty(ue.getRemar())) {
                //用户为空返回403
                logger.error("--------参数异常  activityId is null---------》活动主办方填写报名用户备注 19");
                return Result.error("207", "参数异常");
            }
            //通过id查询主办方信息
            Uenrollandactivity uenrollandactivity = ueService.queryById(ue.getUandactivityenrollId());

            if (ObjectUtil.isNull(uenrollandactivity)) {
                return Result.error("206", "主办方信息异常");
            }
            if (ObjectUtil.notEmpty(uenrollandactivity.getRemar())) {
                return Result.error("403", "当前用户备注已经添加，不允许重复添加");
            }
            uenrollandactivity.setRemar(ue.getRemar());
            Integer result = ueService.updateSelective(uenrollandactivity);
            return 0 == result ? Result.error(0) : Result.success(1);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("--------服务器异常---------》活动主办方填写报名用户备注 19");
        return Result.error("500", "服务器异常");
    }

    /**
     * 20  根据token 活动主办方填写报名用户成交信息
     *
     * @param transactionItems 用户成交信息
     * @return 返回 0 失败  1 成功
     */
    @PostMapping(value = "saveTransactionItemByActivityId")
    public Result<Integer> saveTransactionItemByActivityId(@RequestParam("transactionItems[]") TransactionItem[] transactionItems) {
        if (ObjectUtil.isNull(transactionItems)) {
            //用户为空返回403
            logger.error("--------参数异常  activityId is null---------》活动主办方填写报名用户成交信息 20");
            return Result.error("207", "参数异常");
        }
        String data = TokenUtils.getDataByKey("123");
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("--------token值错误---------》活动主办方填写报名用户成交信息 20");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("--------用户不存在---------》活动主办方填写报名用户成交信息 20");
                return Result.error("206", "用户不存在");
            }

            //return transactionItemService.saveSelectiveByTransactionItemList(u, transactionItems);
            return null;
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("--------服务器异常---------》活动主办方填写报名用户成交信息 20");
        return Result.error("500", "服务器异常");
    }

}
