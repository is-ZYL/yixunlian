/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ActivityServerce
 * Author:   yuanyuana
 * Date:     2018/9/27 19:22
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import cn.hutool.core.date.DateUtil;
import com.github.abel533.entity.Example;
import com.github.abel533.entity.Example.Criteria;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yixunlian.entity.*;
import com.yixunlian.mapper.ActivityMapper;
import com.yixunlian.pojo.*;
import com.yixunlian.service.baseservice.BaseService;
import com.yixunlian.service.baseservice.GetService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import util.myutils.ListUtils;
import util.myutils.ObjectUtil;
import util.myutils.UuidUtil;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.*;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/9/27
 * @since 1.0.0
 */
@Service
@Slf4j
public class ActivityService extends BaseService<Activity> {
    @Resource(name = "activityMapper")
    private ActivityMapper activityMapper;

    @Resource(name = "getService")
    private GetService getService;

    @Resource(name = "userService")
    private UserService userService;
    @Resource(name = "uhobbyService")
    private UhobbyService uhobbyService;
    @Resource(name = "userandhobbyService")
    private UserandhobbyService userandhobbyService;
    @Resource(name = "engagendustryService")
    private EngagendustryService engagendustryServer;
    @Resource(name = "everjoinService")
    private EverjoinService everjoinService;
    @Resource(name = "personalneedsService")
    private PersonalneedsService personalneedsService;
    @Resource(name = "userandpersonalneedsService")
    private UserandpersonalneedsService userandpersonalneedsService;
    @Resource(name = "uhobbyandactivitycategoryService")
    private UhobbyandactivitycategoryService uhAndAcCategoryService;
    @Resource(name = "organizerInfoService")
    private OrganizerInfoService organ;
    @Resource(name = "extractprojectService")
    private ExtractprojectService ex;
    @Resource(name = "uenrollandactivityService")
    private UenrollandactivityService ueService;
    @Resource(name = "activityChargeItemService")
    private ActivityChargeItemService ac;
    @Resource(name = "extractprojectService")
    private ExtractprojectService ext;
    @Resource(name = "reportService")
    private ReportService rep;
    @Resource(name = "activityFillInItemService")
    private ActivityFillInItemService af;
    @Resource(name = "extractprojectService")
    private ExtractprojectService ep;
    @Resource(name = "activitysignService")
    private ActivitysignService activitysignService;
    @Resource(name = "extractprojectService")
    private ExtractprojectService extractprojectService;
    @Resource(name = "organizerInfoService")
    private OrganizerInfoService organizerInfoService;

    /**
     * 通过用户id查询参与的活动
     *
     * @param list
     * @return
     */
    public PageInfo<Activity> queryPageListByUid(List<Everjoin> list) {
        List<Activity> result = null;
        for (Everjoin everjoin : list) {
            Activity activity = new Activity();
            activity.setActivityId(everjoin.getActivityId());
            Activity activity1 = this.activityMapper.selectByPrimaryKey(activity);
            result.add(activity1);
        }
        return new PageInfo<>(result);
    }

    /**
     * 通过用户id查询收藏的活动
     *
     * @param list
     * @return
     */
    public List<Activity> queryPageListByActivity(List<UCollection> list) {
        List<Activity> result = new ArrayList<>();
        for (UCollection uCollection : list) {
            Activity activity = new Activity();
            activity.setActivityId(uCollection.getActivityId());
            Activity activity1 = this.activityMapper.selectByPrimaryKey(activity);
            if (ObjectUtil.isNotNull(activity1)) {
                result.add(activity1);
            }
        }
        return result;
    }

    /**
     * 根据id查询活动
     *
     * @param activityId
     * @return
     */
    public Activity queryOneById(String activityId) {
        Example example = new Example(Activity.class);
        //匹配id与管理员未下架的活动
        example.createCriteria().andEqualTo("activityId", activityId).andNotEqualTo("onlineStatus", 3);

        List<Activity> activities = activityMapper.selectByExample(example);
        for (Activity activity : activities) {
            if (ObjectUtil.isNotNull(activity)) {
                return activity;
            }
        }
        return null;
    }

    /**
     * 根据map参数来匹配活动
     *
     * @param map
     * @return
     */
    public List<Activity> queryListByMaps(Map<String, String> map) {
        //String  hobbyId, String everjoinId, String personalneedsId
        Example example = new Example(Activity.class);
        //活动条件筛选：已经上架/活动未结束（未开始/进行中）/报名未结束
        Criteria criteria = example.createCriteria()
                .andEqualTo("onlineStatus", 0)
                .andNotEqualTo("activityStatus", 2)
                .andNotEqualTo("activitySignupstatus", 2);
        //爱好id
        String hobbyId = (String) map.get("hobbyId");
        //曾经参与id
        String everjoinId = (String) map.get("everjoinId");
        //个人需求id
        String personalneedsId = (String) map.get("personalneedsId");

        //存放活动列表容器
        List<Activity> activities = new ArrayList<>();
        //根据爱好id来进行匹配活动
        if (ObjectUtil.isNotNull(hobbyId)) {
            Uhobbyandactivitycategory u = Uhobbyandactivitycategory.getUhobbyAndActivityCategory();
            u.setHobbyId(hobbyId);
            //根据爱好id查询出当前爱好所关联的活动类别
            List<Uhobbyandactivitycategory> list = uhAndAcCategoryService.queryListByWhere(u);
            //循环活动类别查询对于的活动列表
            for (Uhobbyandactivitycategory uh : list) {
                //根据活动类别查询活动列表
                criteria.andEqualTo("activitycategoryId", uh.getActivitycategoryId());
                List<Activity> list1 = activityMapper.selectByExample(example);
                activities.addAll(list1);
            }
        }
        //根据曾经参与匹配活动列表
        if (ObjectUtil.isNotNull(everjoinId)) {
            Everjoin everjoin = getService.getEverjoinService().queryById(everjoinId);
            if (ObjectUtil.isNotNull(everjoin)) {
                Activity a = super.queryById(everjoin.getActivityId());
                if (ObjectUtil.isNotNull(a)) {
                    //设置活动类别
                    criteria.andEqualTo("activitycategoryId", a.getActivitycategoryId());
                    List<Activity> list1 = activityMapper.selectByExample(example);
                    activities.addAll(list1);
                }
            }
        }

        //根据个人需求
        if (ObjectUtil.isNotNull(personalneedsId)) {
            Personalneeds p = getService.getPersonalneedsService().queryById(personalneedsId);
            if (ObjectUtil.isNotNull(p)) {
                //根据活动类别查询活动列表
                criteria.andEqualTo("activitycategoryId", p.getActivitycategoryId());
                List<Activity> list1 = activityMapper.selectByExample(example);
                activities.addAll(list1);
            }
        }
        activities = ListUtils.removeDuplicate(activities);
        return activities;
    }

    /**
     * 根据条件查询活动列表（活动区域/活动类型/活动费用）
     *
     * @param user
     * @param maps
     * @return
     */
    public List<ActivityResult> queryActivityListByMaps(User user, Map<String, Object> maps) {
        //存放查询出来的数据
        List<ActivityResult> activityResults = new ArrayList<>();
        ShareService shareService = getService.getShareService();
        ActivitysignService activitysignService = getService.getActivitysignService();
        //通过关键字查找（已实现去重）
        List<Activity> activities = activityMapper.queryActivityListByMaps(maps);
        for (Activity activity : activities) {
            ActivityResult activityResult = new ActivityResult();
            //报名此活动的人数
            Integer singnNums = activityResult.getJoinTotal();
            //分享此活动的数量
            Integer shareNums = activityResult.getShareTotal();
            Share share = Share.getShare();
            //分享活动类型
            share.setShareidStatus(1);
            //匹配活动
            share.setActivityId(activity.getActivityId());
            //设置分享者为当前用户
            share.setSharesendId(user.getUserId());
            List<Share> shares = shareService.queryListByWhere(share);
            //去重
            shares = ListUtils.removeDuplicate(shares);
            //循环得出分享接收者是否报名此活动
            for (Share share1 : shares) {
                //根据活动id 与 用户id查询是否已经报名
                Uenrollandactivity uenrollandactivity = getService.getUenrollandactivityService().queryOneByUser(share1.getSharegetId(), share1.getActivityId());
                if (ObjectUtil.isNotNull(uenrollandactivity)) {
                    singnNums++;
                }
            }
            //统计结束  将数据保存
            shareNums = shares.size();
            activityResult.setShareTotal(shareNums);
            activityResult.setJoinTotal(singnNums);
            activityResult.setObject(activity);
            activityResults.add(activityResult);
        }
        return activityResults;
    }

    /**
     * 查询活动专区的总浏览量
     *
     * @return
     */
    public Long queryViewsNums() {
        return activityMapper.queryViewsNums();
    }

    /**
     * 用户自动匹配活动列表
     *
     * @param user
     * @return
     */
    public List<ActivityResult> queryActivityListByUser(User user) {
        Example example = new Example(Activity.class);
        //活动条件筛选：已经上架/活动未结束（未开始/进行中）/报名未结束
        Criteria criteria = example.createCriteria()
                .andEqualTo("onlineStatus", 0)
                .andNotEqualTo("activityStatus", 2)
                .andNotEqualTo("activitySignupstatus", 2);
        List<ActivityResult> activityResults1 = new ArrayList<>();

        //查询出所有符合要求的活动列表
        List<Activity> activities = activityMapper.selectByExample(example);

        //最后的list集合
        List<Activity> activityList = new ArrayList<>();

        //获取用户的资源列表
        List<User> userList = userService.getResourceByUser(user);

        for (Activity activity : activities) {
            //某个活动的精准需求人数
            Integer personNums = 0;
            //封装的活动数据
            ActivityResult activityResult = new ActivityResult();
            //记录有需求的用户id
            List<String> uids = new ArrayList<>();
            for (User user1 : userList) {
                //根据个人需求
                List<Userandpersonalneeds> needs = userandpersonalneedsService.queryListByUser(user1);
                for (Userandpersonalneeds u : needs) {
                    //如果活动类别匹配上了 则停止此次循环
                    if (u.getActivitycategoryId().equals(activity.getActivitycategoryId())) {
                        //将当前有需求的用户保存至集合中
                        uids.add(user1.getUserId());
                        personNums++;
                        break;
                    }
                }
                //如果当前用户已经匹配上了则跳过此次循环
                if (personNums > 0) {
                    continue;
                }
                //根据曾经参与匹配活动
                Everjoin everjoin = Everjoin.getEverjoin();
                everjoin.setUserId(user1.getUserId());
                everjoin.setIsDelete(0);
                List<Everjoin> everjoinList = everjoinService.queryListByWhere(everjoin);
                for (Everjoin everjoin1 : everjoinList) {
                    //如果活动类别匹配上了 则停止循环
                    if (activity.getActivitycategoryId().equals(everjoin1.getActivitycategoryId())) {
                        //将当前有需求的用户保存至集合中
                        uids.add(user1.getUserId());
                        personNums++;
                        break;
                    }
                }
                //如果当前用户已经匹配上了则跳过此次循环
                if (personNums > 0) {
                    continue;
                }
                //根据爱好列表进行匹配
                List<Userandhobby> userandhobbyList = userandhobbyService.queryListByUserDESC(user1, "DESC");
                for (Userandhobby userandhobby : userandhobbyList) {
                    //如果活动类别匹配上了 则停止循环
                    if (userandhobby.getActivitycategoryId().equals(activity.getActivitycategoryId())) {
                        //将当前有需求的用户保存至集合中
                        uids.add(user1.getUserId());
                        break;
                    }

                }

            }
            //循环到最后都没有 则判断该活动是否通过该用户分享过其他人
            if (personNums > 0) {
                activityResult.setObject(activity);
                activityResult.setNeedsTotal(personNums);
                activityResult.setUids(uids);
            } else {
                ShareService s = getService.getShareService();
                //通过活动和用户查询分享信息
                List<Share> shares = s.queryListByUserAndActivity(user, activity);
                if (ObjectUtil.isNotNull(shares)) {
                    ListUtils.removeDuplicate(shares);
                    activityResult.setShareTotal(shares.size());
                }
            }
            activityResults1.add(activityResult);
        }
        return activityResults1;
    }

    /**
     * 根据活动id，活动类型查询活动
     * 活动上下架情况，活动发布者上架为0，下架为1，草稿为4，管理员上架为2，下架为3
     *
     * @param activityId
     * @param onlineStatus
     * @return
     */
    public Activity queryOneByActivityId(String activityId, Integer onlineStatus) {
        Example example = new Example(Activity.class);
        example.createCriteria().andEqualTo("activityId", activityId);
        List<Activity> activities = activityMapper.selectByExample(example);
        if (ObjectUtil.isNotNull(activities)) {
            return activities.get(0);
        }
        return null;
    }

    /**
     * 关键字匹配已发布的活动
     *
     * @param u                    用户
     * @param provinceCitycode     省
     * @param cityCitycode         市/县
     * @param areaCitycode         区
     * @param activityChargestatus 活动费用 0 免费 1 收费
     * @param activityType         活动类型 0 为线上，1 线下
     * @param searchVal            输入框中的内容
     * @param page                 当前页
     * @param row                  每页显示条数
     * @return
     */
    public List<ActivityInfo> queryActivityListBySearch(User u, String provinceCitycode, String cityCitycode, String areaCitycode, Integer activityChargestatus, Integer activityType, String searchVal, Integer page, Integer row) {
        Example example = new Example(Activity.class);
        //活动条件筛选：已经上架/活动未结束（未开始/进行中）/报名未结束
        Criteria criteria = example.createCriteria()
                .andEqualTo("onlineStatus", 0)
                .andNotEqualTo("activityStatus", 2)
                .andNotEqualTo("activitySignupstatus", 2);

        //根据省匹配
        if (ObjectUtil.notEmpty(provinceCitycode) && !"000000".equals(provinceCitycode)) {
            criteria.andEqualTo("provinceCitycode", provinceCitycode);
        }
        //根据市/县匹配
        if (ObjectUtil.notEmpty(cityCitycode) && !"000000".equals(cityCitycode)) {
            criteria.andEqualTo("cityCitycode", cityCitycode);
        }
        //根据区匹配
        if (ObjectUtil.notEmpty(areaCitycode) && !"000000".equals(areaCitycode)) {
            criteria.andEqualTo("areaCitycode", areaCitycode);
        }
        //根据活动费用匹配
        if (null != activityChargestatus) {
            criteria.andEqualTo("activityChargestatus", activityChargestatus);
        }
        //根据活动类型匹配
        if (null != activityType) {
            criteria.andEqualTo("activityType", activityType);
        }
        //根据主办方名称/活动名称匹配
        if (ObjectUtil.notEmpty(searchVal)) {
            criteria.andLike("activityName", "%" + searchVal + "%");
            criteria.andLike("userNickName", "%" + searchVal + "%");
        }
        //根据创建时间进行升序排列
        example.setOrderByClause("created ASC");
        //分页
        PageHelper.startPage(page, row);
        List<Activity> activities = activityMapper.selectByExample(example);
        List<ActivityInfo> activityInfos = new ArrayList<>();
        for (Activity a : activities) {
            ActivityInfo activityInfo = queryActivityDetail(a.getActivityId());
            //查询活动的报名人数
            Integer activityJoinNum = ueService.queryTotalCount(Uenrollandactivity.getUenrollAndActivity().toBuilder().activityId(a.getActivityId()).build());
            a.setJoinNum(activityJoinNum);
            activityInfo.setActivity(a);
            activityInfos.add(activityInfo);
        }
        return activityInfos;
    }

    /**
     * 主办方分页查询被举报活动列表
     *
     * @param u    主办方信息
     * @param page 页码
     * @param row  每页显示条数
     * @return 返回活动列表
     */
    public List<ActivityResult> queryReportedActivityList(User u, Integer page, Integer row) {
        List<ActivityResult> activityResults = new ArrayList<>();
        List<Activity> activities = queryListByUser(u, page, row);
        //循环找出当前有哪些活动被举报
        for (Activity activity : activities) {
            Report report = rep.queryReportByActivity(activity);
            if (ObjectUtil.isNull(report)) {
                continue;
            }
            ActivityResult activityResult = new ActivityResult();
            //活动对象
            activityResult.setObject(activity);
            //是主办方
            activityResult.setIsOrganizer(true);
            //举报内容
            activityResult.setReportContext(report.getReportContext());
            activityResults.add(activityResult);

        }
        return activityResults;
    }

    /**
     * 主办方查询已下架的活动
     *
     * @param u 当前用户信息
     * @return 返回活动list
     */
    public PageInfo<Activity> queryObtainedActivityList(User u, Integer page, Integer row) {
        OrganizerInfo organizerInfo = organ.queryOneByUser(u);
        //判断是否是活动主办方
        if (ObjectUtil.isNotNull(organizerInfo)) {
            Example example = new Example(Activity.class);
            Criteria criteria = example.createCriteria();
            Criteria criteria1 = example.createCriteria();
            //活动上下架情况，活动发布者上架为0，下架为1，草稿为4，管理员上架为2，下架为3 onlineStatus
            criteria.andEqualTo("onlineStatus", 1);
            criteria1.andEqualTo("onlineStatus", 3);
            example.or(criteria);
            PageHelper.startPage(page, row);
            example.setDistinct(true);
            example.setOrderByClause("created DESC");
            List<Activity> activities = activityMapper.selectByExample(example);
            return new PageInfo<>(activities);
        }
        return null;
    }

    /**
     * 主办方查询已发布的活动
     *
     * @param u
     * @param page
     * @param row
     * @return
     */
    public List<ActivityResult> queryPublishedActivityList(User u, Integer page, Integer row) {
        OrganizerInfo organizerInfo = organ.queryOneByUser(u);
        //存放活动的集合
        List<ActivityResult> activities = new LinkedList<>();
        //判断是否是活动主办方
        if (ObjectUtil.isNotNull(organizerInfo)) {
            Example example = new Example(Activity.class);
            Criteria criteria = example.createCriteria();
            //活动上下架情况，活动发布者上架为0，下架为1，草稿为4，管理员上架为2，下架为3 onlineStatus
            criteria.andEqualTo("onlineStatus", 0);
            PageHelper.startPage(page, row);
            List<Activity> activities1 = activityMapper.selectByExample(example);
            //循环得出当前活动的精准需求人数以及是否设置邀约提成
            for (Activity activity : activities1) {
                ActivityResult activityResult = new ActivityResult();
                //当前活动是否设置分享提成:0为否,1为是
                if (null != activity.getActivityIsextract() && activity.getActivityIsextract() == 1) {
                    List<Extractproject> e = ext.queryListByActivity(activity);
                    //设置该活动是否设置项目提成
                    boolean isSetExtractProject = ObjectUtil.isNotNull(e);
                    activityResult.setIsSetExtractProject(isSetExtractProject);
                }
                //根据当前活动查询在活动区域的用户
                List<User> users = this.queryUsersByActivity(activity);
                for (User user1 : users) {
                    //某个活动的精准需求人数
                    Integer personNums = 0;
                    //封装的活动数据
                    //记录有需求的用户id
                    List<String> uids = new ArrayList<>();
                    //根据个人需求
                    List<Userandpersonalneeds> needs = userandpersonalneedsService.queryListByUser(user1);
                    for (Userandpersonalneeds u1 : needs) {
                        //如果活动类别匹配上了 则停止此次循环
                        if (u1.getActivitycategoryId().equals(activity.getActivitycategoryId())) {
                            //将当前有需求的用户保存至集合中
                            uids.add(user1.getUserId());
                            personNums++;
                            break;
                        }
                    }
                    //如果当前用户已经匹配上了则跳过此次循环
                    if (personNums > 0) {
                        continue;
                    }
                    //根据曾经参与匹配活动
                    Everjoin everjoin = Everjoin.getEverjoin();
                    everjoin.setUserId(user1.getUserId());
                    everjoin.setIsDelete(0);
                    List<Everjoin> everjoinList = everjoinService.queryListByWhere(everjoin);
                    for (Everjoin everjoin1 : everjoinList) {
                        //如果活动类别匹配上了 则停止循环
                        if (activity.getActivitycategoryId().equals(everjoin1.getActivitycategoryId())) {
                            //将当前有需求的用户保存至集合中
                            uids.add(user1.getUserId());
                            personNums++;
                            break;
                        }
                    }
                    //如果当前用户已经匹配上了则跳过此次循环
                    if (personNums > 0) {
                        continue;
                    }
                    //根据爱好列表进行匹配
                    List<Userandhobby> userandhobbyList = userandhobbyService.queryListByUserDESC(user1, "DESC");
                    for (Userandhobby userandhobby : userandhobbyList) {
                        //如果活动类别匹配上了 则停止循环
                        if (userandhobby.getActivitycategoryId().equals(activity.getActivitycategoryId())) {
                            //将当前有需求的用户保存至集合中
                            uids.add(user1.getUserId());
                            break;
                        }
                    }
                    //封装数据
                    activityResult.setObject(activity);
                    activityResult.setNeedsTotal(personNums);
                    activityResult.setUids(uids);
                    activities.add(activityResult);
                }
            }
        }
        return activities;
    }

    /**
     * 主办方查询已结束的活动
     *
     * @param u
     * @param page
     * @param row
     * @return
     */
    public List<ActivityResult> queryOverActivityList(User u, Integer page, Integer row) {
        OrganizerInfo organizerInfo = organ.queryOneByUser(u);
        //存放活动的集合
        List<ActivityResult> activities = new LinkedList<>();
        //判断是否是活动主办方
        if (ObjectUtil.isNotNull(organizerInfo)) {
            Example example = new Example(Activity.class);
            Criteria criteria = example.createCriteria();
            //活动上下架情况，活动发布者上架为0，下架为1，草稿为4，管理员上架为2，下架为3 onlineStatus
            criteria.andEqualTo("onlineStatus", 1);
            criteria.andEqualTo("activityStatus", 1);
            PageHelper.startPage(page, row);
            List<Activity> activities1 = activityMapper.selectByExample(example);
            //循环得出当前活动的精准需求人数以及是否设置邀约提成
            for (Activity activity : activities1) {
                ActivityResult activityResult = new ActivityResult();
                Integer unfilledNums = activityResult.getUnfilledNum();
                List<Uenrollandactivity> uenrollAndActivities = ueService.queryListByActivity(activity);
                //循环得出当前活动的报名用户是否是未成交状态
                for (Uenrollandactivity ue : uenrollAndActivities) {
                    if (ue.getDealStatus() == 0) {
                        ++unfilledNums;
                    }
                }

                //如果未成交人数为0则计算成交总金额和发放提成总金额
                if (unfilledNums == 0) {
                    BigDecimal money = ac.querySumMoneyByActivity(activity);
                    //设置成交总金额
                    activityResult.setTransactionTotalAmount(money);
                    //查询出当前活动的总提成
                    BigDecimal decimal = ext.queryProjectRateSumByActivityId(activity.getActivityId());
                    //设置发放提成总金额(保留两位小数)
                    activityResult.setCommissionTotalAmount(money.multiply(decimal).setScale(2, BigDecimal.ROUND_HALF_UP));
                }
                activities.add(activityResult);
            }
        }
        return activities;
    }

    /**
     * 主办方查询草稿箱的活动
     *
     * @param u    用户
     * @param page 页码
     * @param row  条数
     * @return 返回ActivityResult
     */
    public List<ActivityResult> queryDraftsActivityList(User u, Integer page, Integer row) {
        OrganizerInfo organizerInfo = organ.queryOneByUser(u);
        //存放活动的集合
        List<ActivityResult> activities = new LinkedList<>();
        //判断是否是活动主办方
        if (ObjectUtil.isNotNull(organizerInfo)) {
            Example example = new Example(Activity.class);
            Criteria criteria = example.createCriteria();
            //活动上下架情况，活动发布者上架为0，下架为1，草稿为4，管理员上架为2，下架为3 onlineStatus
            criteria.andEqualTo("onlineStatus", 4);
            PageHelper.startPage(page, row);
            List<Activity> activities1 = activityMapper.selectByExample(example);
            //循环得出当前活动的精准需求人数以及是否设置邀约提成
            for (Activity activity : activities1) {
                ActivityResult activityResult = new ActivityResult();
                //当前活动是否设置分享提成:0为否,1为是
                if (null != activity.getActivityIsextract() && 1 == activity.getActivityIsextract()) {
                    List<Extractproject> e = ext.queryListByActivity(activity);
                    if (ObjectUtil.isNull(e)) {
                        //说明该活动未设置项目提成
                        activityResult.setIsSetExtractProject(false);
                    }
                    //说明该活动已设置项目提成
                    activityResult.setIsSetExtractProject(true);
                }
                activities.add(activityResult);
            }
        }
        return activities;
    }

    /**
     * 查询主办方用户管理页面数据（统计所有已发布的活动类别数）
     * <p>
     * 客户管理上方的活动类别是本主办方所有发布
     * 过的活动类别，可左右滑动显示，需统计本类别所有活动报过名的总人数；
     * <p>
     * 客户列表的状态：未参加为报名后一次也没有参
     * 加（以签到为准），如有参加则为未成交或已成交；
     * 未成交为本人参加过本类别所有活动一次也没有成交，
     * 只要成交一次则为已成交
     *
     * @param u
     * @param page
     * @param row
     * @return
     */
    public List<ActivityResult> queryViewUserManagementList(User u, Integer page, Integer row) {
        //统计每个类别的报名人数
        List<ActivityResult> uenroList = new ArrayList<>();
        OrganizerInfo organizerInfo = organ.queryOneByUser(u);
        //判断是否是活动主办方
        if (ObjectUtil.isNotNull(organizerInfo)) {
            //查询用户所有发布的活动
            Example example = new Example(Activity.class);
            Criteria criteria = example.createCriteria();
            //活动上下架情况，活动发布者上架为0，下架为1，草稿为4，管理员上架为2，下架为3 onlineStatus
            criteria.andEqualTo("onlineStatus", 0);
            PageHelper.startPage(page, row);
            List<Activity> activities1 = activityMapper.selectByExample(example);
            Map<String, String> list = new HashMap<>();
            //循环统计
            for (Activity a : activities1) {
                if (!list.containsKey(a.getActivitycategoryId())) {
                    //将类别名称与id封装
                    list.put(a.getActivitycategoryId(), a.getActivitycategoryName());
                }
            }
            //统计每个类别的报名人数
            uenroList = ueService.queryTotalCountAndUser(list, organizerInfo);
        }
        return uenroList;
    }

    /**
     * 根据当前活动查询在活动区域的用户
     *
     * @param activity
     * @return
     */
    private List<User> queryUsersByActivity(Activity activity) {
        Example example = new Example(User.class);
        Criteria criteria = example.createCriteria();
        if (ObjectUtil.isNotNull(activity.getProvinceCitycode()) && !"000000".equals(activity.getProvinceCitycode())) {
            criteria.andEqualTo("provinceCitycode", activity.getProvinceCitycode());
        }
        if (ObjectUtil.isNotNull(activity.getCityCitycode()) && !"000000".equals(activity.getCityCitycode())) {
            criteria.andEqualTo("cityCitycode", activity.getCityCitycode());
        }
        if (ObjectUtil.isNotNull(activity.getAreaCitycode()) && !"000000".equals(activity.getAreaCitycode())) {
            criteria.andEqualTo("areaCitycode", activity.getAreaCitycode());
        }
        criteria.andBetween("userIsactivation", 1, 2);
        criteria.andEqualTo("closedUserStatus", 0);
        return userService.queryListByExample(example);
    }

    /**
     * 当前用户的曾经发布的所有活动
     *
     * @param u
     * @param page
     * @param row
     * @return
     */
    public List<Activity> queryListByUser(User u, Integer page, Integer row) {
        Activity activity = Activity.getActivity();
        activity.setUserId(u.getUserId());
        PageHelper.startPage(page, row);
        return super.queryListByWhereDesc(activity);
    }

    /**
     * 保存活动信息
     *
     * @param u
     * @param activityInfo
     * @return
     */
    public String saveSelectiveByActivityInfoAndUser(User u, ActivityInfo activityInfo) {
        log.debug("活动保存为草稿[{}]", activityInfo);
        //是否是活动更新
        boolean update = false;
        Activity activity = activityInfo.getActivity();
        if (null != activity.getActivityId()) {
            update = true;
        }
        if (0 == activityInfo.getType()) {
            //保存为活动草稿
            activity.setOnlineStatus(4);
        } else {
            //活动发布
            activity.setOnlineStatus(0);
            //若为活动发布，则判断活动状态
            Date date = new Date();
            //活动报名开始
            if (DateUtil.isIn(date, activity.getActivitysignStarttime(), activity.getActivitysignEndtime()) || date.getTime() >= activity.getActivitysignStarttime().getTime()) {
                activity.setActivitySignupstatus(1);
            }
            //活动开始
            if (DateUtil.isIn(date, activity.getActivitystartTime(), activity.getActivityendTime()) || date.getTime() >= activity.getActivitystartTime().getTime()) {
                activity.setActivityStatus(1);
            }

            //活动结束
            if (!DateUtil.isIn(date, activity.getActivitystartTime(), activity.getActivityendTime()) && date.getTime() < activity.getActivitystartTime().getTime()) {
                activity.setActivityStatus(2);
            }

        }
        activity.setUserId(u.getUserId());
        if (!update) {
            activity.init();
            //保存至数据库
            super.saveSelective(activity);
        } else {
            super.updateSelective(activity);
            //删除之前的数据
            ac.deleteByWhere(ActivityChargeItem.getInstance().toBuilder().activityId(activity.getActivityId()).build());
            ext.deleteByWhere(Extractproject.getExtractproject().toBuilder().activityId(activity.getActivityId()).build());
            af.deleteByWhere(ActivityFillInItem.getInstance().toBuilder().activityId(activity.getActivityId()).build());
        }
        List<ActivityChargeItem> c;
        List<Extractproject> e;
        //保存收费项目
        if (null != activity.getActivityChargestatus() && 1 == activity.getActivityChargestatus()) {
            c = activityInfo.getChargeItemList();
            Integer i = ac.saveSelective(activity, c);
            log.info("活动保存--共保存收费项目——" + i + "——条");
        }
        //保存提成项目
        if (null != activity.getActivityIsextract() && 1 == activity.getActivityIsextract()) {
            e = activityInfo.getExtractprojectList();
            Integer i = ext.saveSelective(activity, e);
            log.info("活动保存--共保存提成项目——" + i + "——条");
        }
        //保存报名填写项
        List<ActivityFillInItem> f = activityInfo.getFillInItems();
        Integer i = af.saveSelective(activity, f);
        log.info("活动保存--共保存报名填写项——" + i + "——条");
        return activity.getActivityId();
    }

    /**
     * 更新活动信息
     *
     * @param u
     * @param activityInfo
     * @return
     */
    public Integer updateSelectiveByActivityInfoAndUser(User u, ActivityInfo activityInfo) {
        Activity activity = activityInfo.getActivity();
        if (0 == activityInfo.getType()) {
            //活动发布
            activity.setOnlineStatus(0);
        } else {
            //保存为活动草稿
            activity.setOnlineStatus(4);
        }
        activity.setUserId(u.getUserId());
        Integer result = super.updateSelective(activity);
        List<ActivityChargeItem> c;
        List<Extractproject> e;
        //保存收费项目
        if (null != activity.getActivityChargestatus() && 1 == activity.getActivityChargestatus()) {
            c = activityInfo.getChargeItemList();
            Integer i = ac.saveSelective(activity, c);
            log.info("活动保存--共保存收费项目——" + i + "——条");
        }
        //保存提成项目
        if (null != activity.getActivityIsextract() && 1 == activity.getActivityIsextract()) {
            e = activityInfo.getExtractprojectList();
            Integer i = ext.saveSelective(activity, e);
            log.info("活动保存--共保存提成项目——" + i + "——条");
        }
        //保存报名填写项
        List<ActivityFillInItem> f = activityInfo.getFillInItems();
        Integer i = af.saveSelective(activity, f);
        log.info("活动保存--共保存报名填写项——" + i + "——条");
        return result;
    }

    /**
     * 判断活动信息是否符合要求，检查必须字段是否为空
     *
     * @param activityInfo
     * @return
     */
    public Result<Integer> checkActivityInfo(ActivityInfo activityInfo) {
        log.info("检查活动信息是否合格,[{}]", activityInfo);
        Activity activity = activityInfo.getActivity();
        Map<String, Object> map = ObjectUtil.objToMap(activity);
        log.info("转化为map对象,[{}]", map);
        //主办方名称
        boolean userNickName = ObjectUtil.isNull(map.get("userNickName"));

        //活动名称
        boolean activityName = ObjectUtil.isNull(map.get("activityName"));
        //关联活动类别表id
        boolean activityCategoryId = ObjectUtil.isNull(map.get("activitycategoryId"));
        //关联活动类别名称
        boolean activityCategoryName = ObjectUtil.isNull(map.get("activityCategoryName"));
        //活动报名开始时间
        boolean activitySignStartTime = ObjectUtil.isNull(map.get("activitysignStarttime"));
        //活动报名结束时间
        boolean activitysignEndtime = ObjectUtil.isNull(map.get("activitysignEndtime"));
        //活动开始时间
        boolean activitystartTime = ObjectUtil.isNull(map.get("activitystartTime"));
        //活动结束时间
        boolean activityendTime = ObjectUtil.isNull(map.get("activityendTime"));
        //活动封面图
        boolean activityCoverimgurl = ObjectUtil.isNull(map.get("activityCoverimgurl"));
        //活动人数
        boolean activityCountpersons = ObjectUtil.isNull(map.get("activityCountpersons"));
        //活动区域详细地址
        boolean citycode = ObjectUtil.isNull(map.get("citycode"));
        //系统自动匹配精准客户的区域省
        boolean precisionDemandProvinceId = ObjectUtil.isNull(map.get("precisionDemandProvinceId"));
        //活动举办地址—省
        boolean provinceCitycode = ObjectUtil.isNull(map.get("provinceCitycode"));
        //活动举办地址—市
        boolean cityCitycode = ObjectUtil.isNull(map.get("cityCitycode"));
        //活动举办地址—区
        boolean areaCitycode = ObjectUtil.isNull(map.get("areaCitycode"));
        //活动详情
        boolean activityDetailsurl = ObjectUtil.isNull(map.get("activityDetailsurl"));
        //分享摘要
        boolean shareAbstract = ObjectUtil.isNull(map.get("shareAbstract"));
        //活动二维码路径
        boolean activityQrcode = ObjectUtil.isNull(map.get("activityQrcode"));
        //关联活动音乐表
        boolean activitymusicId = ObjectUtil.isNull(map.get("activitymusicId"));
        //活动费用，0为免费，1，收费
        String activityChargestatus = (String) map.get("activityChargestatus");
        //活动费用支付方式 0为平台代收，1为线下支付
        String activityChargemethod = (String) map.get("activityChargemethod");
        //活动类型 0为线上，1线下
        String activityType = (String) map.get("activityType");
        //是否设置提成0，为否，1为是
        String activityIsextract = (String) map.get("activityIsextract");
        //平台代收支付结果
        String paymentResult = (String) map.get("paymentResult");

        //判断基础字段是否为空
        if (userNickName && activityName && activityCategoryId && activityCategoryName
                && activitySignStartTime && activitysignEndtime && activitystartTime
                && activityendTime && activityCountpersons && precisionDemandProvinceId
                && activityCoverimgurl
                && activityDetailsurl && shareAbstract) {
            //判断线下活动是否填写了活动举办地址
            if ("1".equals(activityType) && citycode && provinceCitycode && cityCitycode && areaCitycode) {
                //验证不通过
                return Result.error(0);
            }
            //判断复杂的字段是否符合
            if (checkActivityPayment(activityChargestatus, activityIsextract,
                    activityChargemethod, paymentResult, activityInfo.getExtractprojectList(),
                    activityInfo.getChargeItemList())) {
                return Result.success(1);
            }
            //验证不通过
            return Result.error(0);
        } else {
            //验证不通过
            return Result.error(0);
        }
    }

    /**
     * 检查活动在收费状态下的其他必须字段是否符合
     *
     * @param activityChargestatus 活动费用，0为免费，1，收费
     * @param activityChargemethod 活动费用支付方式 0为平台代收，1为线下支付
     * @param paymentResult        平台代收支付结果
     * @param extractprojectList
     * @return
     */
    private Boolean checkActivityPayment(String activityChargestatus, String activityIsextract, String activityChargemethod, String paymentResult, List<Extractproject> extractprojectList, List<ActivityChargeItem> chargeItemList) {
        //判断收费项目是否合格
        boolean flag = false;
        //活动为收费
        if ("1".equals(activityChargestatus) && checkChargeItem(chargeItemList)) {
            //且为平台代收 已支付
            if ("0".equals(activityChargemethod) && "1".equals(paymentResult)) {
                flag = true;
            }
            //如果有提成，判断提成项目
            if ("1".equals(activityIsextract) && checkExtractProject(extractprojectList)) {
                flag = true;
            }
            flag = true;
        }
        return flag;
    }

    /**
     * 判断活动收费项目是否合格
     *
     * @param chargeItemList
     * @return
     */
    private boolean checkChargeItem(List<ActivityChargeItem> chargeItemList) {
        boolean chargeItem = false;
        if (chargeItemList.size() > 0) {
            for (ActivityChargeItem c : chargeItemList) {
                if (!c.getActivityChargeItemName().isEmpty() && c.getActivityChargeItemMoney() != null) {
                    chargeItem = true;
                }
            }
        }
        return chargeItem;
    }

    /**
     * 判断活动提成项目是否合格
     *
     * @param extractprojectList
     * @return
     */
    private boolean checkExtractProject(List<Extractproject> extractprojectList) {
        boolean extractProject = false;
        if (extractprojectList.size() > 0) {
            for (Extractproject e : extractprojectList) {
                if (!e.getProjectName().isEmpty() && e.getProjectRate() != null) {
                    extractProject = true;
                }
            }
        }
        return extractProject;
    }

    /**
     * 根据活动id查询活动详情
     *
     * @param activityId
     * @return
     */
    public ActivityInfo queryActivityDetail(String activityId) {
        Activity activity = super.queryById(activityId);
        //收费项目list
        List<ActivityChargeItem> ci = ac.queryListByWhere(activity);
        //提成项目
        List<Extractproject> ej = ep.queryListByActivity(activity);
        //查询活动的报名人数
        Integer activityJoinNum = ueService.queryTotalCount(Uenrollandactivity.getUenrollAndActivity().toBuilder().activityId(activityId).build());
        activity.setJoinNum(activityJoinNum);
        OrganizerInfo o = OrganizerInfo.getcInstance().toBuilder().userId(activity.getUserId()).build();
        o = organizerInfoService.queryOne(o);
        return new ActivityInfo().toBuilder().activity(activity).organizerInfo(o).chargeItemList(ci).extractprojectList(ej).build();
    }

    /**
     * 用户报名活动
     *
     * @param u
     * @param ac
     * @return
     */
    public synchronized Result activitySignUp(User u, ActivitySingInfo ac) {
        //检查用户信息是否合格
        boolean userIsOk = userService.checkUserIsOk(u, false);
        Activity activity = super.queryById(ac.getActivityId());
        //检查活动是否合格
        boolean activityIsOk = checkActivityIsOk(activity);
        //检查当前用户是否已经报名
        Uenrollandactivity ue = ueService.queryOneByUser(u.getUserId(), activity.getActivityId());
        if (ObjectUtil.isNotNull(ue)) {
            return Result.error("405", "当前用户已经报名");
        }

        if (!userIsOk) {
            log.error("报名活动，用户身份不合格,封号或者未激活[{},{},{}]", getClass(), 1008, u);
            return Result.error("403", "用户身份不合格");
        }
        if (!activityIsOk) {
            log.error("报名活动，活动不符合条件[{},{},{}]", getClass(), 1012, activity);
            return Result.error("403", "当前活动异常,请稍后再试");
        }
        //保存用户填写的报名填写项
        for (Activitysign a : ac.getActivitySign()) {
            //判断是否报名填写参数是否合格
            if (ObjectUtil.isNull(a.getFillInItemId()) || ObjectUtil.isNull(a.getFillInItemName()) || ObjectUtil.isNull(a.getFillInItemVal())) {
                return Result.error("406", "报名填写内容异常");
            }
            a.setUserId(u.getUserId());
            a.setActivityId(activity.getActivityId());
            a.setActivitySignid(UuidUtil.get32UUID());
            activitysignService.saveSelective(a);
        }

        //保存用户报名信息
        Uenrollandactivity uenrollandactivity = Uenrollandactivity.getUenrollAndActivity().toBuilder()
                .uandactivityenrollId(UuidUtil.get32UUID())
                .activitycategoryId(activity.getActivitycategoryId())
                .activityId(activity.getActivityId())
                .organizerId(activity.getUserId())
                .status(0)
                .changeHeadUrl(null == u.getChangeHeadUrl() ? u.getHeadUrl() : u.getChangeHeadUrl())
                .dealStatus(0)
                .paymentStatus(0)
                .userId(u.getUserId())
                .uSex(u.getuSex())
                .uNickname(u.getuNickname())
                .uPhone(u.getuPhone())
                .usersignStatus(0).build();
        activity.setJoinNum(activity.getJoinNum() + 1);
        super.updateSelective(activity);
        Integer result = ueService.saveSelective(uenrollandactivity);
        return (result > 0) ? Result.success("报名成功") : Result.error("报名失败");
    }

    /**
     * 检查活动是否合格
     *
     * @return
     */
    public Boolean checkActivityIsOk(Activity a) {
        //必须满足以下条件
        // 活动上下架情况:活动发布者上架为0
        // 活动报名状态:0为未开始
        // 活动状态:0为活动未开始

        return a != null && 0 == a.getOnlineStatus() && a.getActivitySignupstatus() == 1 && a.getActivityStatus() == 0 && a.getJoinNum() < a.getActivityCountpersons();
    }

    /**
     * 查询不是活动草稿，下架和活动结束状态的活动
     *
     * @return
     */
    public List<Activity> queryShelfActivity() {
        /**
         * onlineStatus
         * 活动上下架情况，活动发布者上架为0，下架为1，管理员上架为2，下架为3，草稿为4
         */
        /**
         * activitySignupstatus
         * 活动报名状态，0为未开始，1为报名中，2为已经报名结束
         */

        /**
         *  activityStatus
         * 活动状态，0为活动未开始，1为活动进行中，2活动已经结束
         */

        Example e = new Example(Activity.class);
        e.createCriteria()
                .andNotEqualTo("activityStatus", 2)
                .andEqualTo("onlineStatus", 0);
        return activityMapper.selectByExample(e);
    }

    /**
     * 主办方查询用户报名信息
     *
     * @param userId     主办方
     * @param activityId 活动id
     * @param userId1    用户id
     */
    public Result<ActivitySignUpInfo> queryActivitySignUpInfo(String userId, String activityId, String userId1) {
        log.info("主办方id=="+userId);
        if (ObjectUtil.isNull(organizerInfoService.queryById(userId))) {
            return Result.error("403", "主办方id异常");
        }
        Uenrollandactivity ue = ueService.queryOneByUser(userId1, activityId);
        Activitysign activitysign = activitysignService.queryOneByUser(userId1, activityId);
        ActivitySignUpInfo ac = ActivitySignUpInfo.getActivitySignUpInfo().toBuilder().act(activitysign).uen(ue).build();
        return Result.success("查询成功", ac);
    }
}

