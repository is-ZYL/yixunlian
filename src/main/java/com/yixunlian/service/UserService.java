/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: UserService
 * Author:   yuanyuana
 * Date:     2018/9/25 10:17
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.github.abel533.entity.Example;
import com.github.abel533.entity.Example.Criteria;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yixunlian.entity.ObjectResult;
import com.yixunlian.entity.ResourceListResult;
import com.yixunlian.entity.UtypeEnum;
import com.yixunlian.mapper.UserMapper;
import com.yixunlian.pojo.*;
import com.yixunlian.pojo.system.Role;
import com.yixunlian.pojo.system.SysUser;
import com.yixunlian.service.baseservice.BaseService;
import com.yixunlian.service.baseservice.GetService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import util.myutils.DateUtils;
import util.myutils.ListUtils;
import util.myutils.ObjectUtil;
import util.myutils.Tools;
import util.weixin.Const;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.*;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/9/25
 * @since 1.0.0
 */
@Service
@Slf4j
public class UserService extends BaseService<User> {
    /**
     * 区域代理id
     */
    private final static Integer UTYPEID = 7;
    @Autowired
    private UserMapper userMapper;
    @Resource(name = "userService")
    private UserService userService;
    @Resource(name = "getService")
    private GetService getService;
    @Resource(name = "uhobbyService")
    private UhobbyService uhobbyService;
    @Resource(name = "userandhobbyService")
    private UserandhobbyService userandhobbyService;
    @Resource(name = "everjoinService")
    private EverjoinService everjoinService;
    @Resource(name = "personalneedsService")
    private PersonalneedsService personalneedsService;
    @Resource(name = "userandpersonalneedsService")
    private UserandpersonalneedsService userandpersonalneedsService;
    @Resource(name = "utypeService")
    private UtypeService utypeService;
    @Resource(name = "resourceUpgradingService")
    private ResourceUpgradingService resUpgradingService;
    @Resource(name = "memberupdateextractService")
    private MemberupdateextractService memUpdateEService;
    @Resource(name = "extractprojectService")
    private ExtractprojectService extractprojectService;
    @Resource(name = "sysUserService")
    private SysUserService sysUserService;
    @Resource(name = "roleService")
    private RoleService roleService;

    /**
     * 查询当前区域的最小代理人（市级代理人，省级代理）
     *
     * @param user  当前注册用户
     * @param utype 区域代理对象
     * @return 返回user
     */
    public User queryMiddleBelong(User user, Utype utype) {
        Example example = new Example(User.class);
        Criteria criteria = example.createCriteria();
        //匹配当前用户的区域
        criteria.andEqualTo("citycode", user.getAreaCitycode());
        //查询大于或者等于
        criteria.andGreaterThanOrEqualTo("utypeId", utype.getUtypeId());
        List<User> uList = userMapper.selectByExample(example);
        if (ObjectUtil.isNotNull(uList)) {
            for (User user1 : uList) {
                //查询当前区域的最小代理
                if (Integer.parseInt(user1.getUtypeId()) >= Integer.parseInt(utype.getUtypeId())) {
                    return user1;
                }
            }
        }
        return null;
    }

    /**
     * 用户查询我的资源列表 并进行数据封装
     *
     * @param user
     * @param page
     * @param rows
     * @return
     */
    public ResourceListResult queryResourceListResult(User user, Integer page, Integer rows, String keyWord) {
        //查询当前用户的当月/当日新增结果
        ResourceListResult resourceListResult = queryResourceListResult(user);

        if (!"".equals(keyWord)) {
            //根据关键字搜索资源
            PageInfo<User> list = queryResourceListResultByKeywords(user, page, rows, keyWord);
            resourceListResult.setRows(list.getList());
            resourceListResult.setTotal(list.getTotal());
            return resourceListResult;
        }
        //搜索当前用户的全部资源
        PageHelper.startPage(page, rows);
        List<User> list = getResourceByUser(user);

        log.info("搜索当前用户的全部资源list长度=" + list.size());

        PageInfo<User> users = new PageInfo<>(list);
        resourceListResult.setRows(users.getList());
        resourceListResult.setTotal(users.getTotal());
        return resourceListResult;
    }

    /**
     * 用户查询我的资源列表的新增状态
     *
     * @param user
     * @return
     */
    private ResourceListResult queryResourceListResult(User user) {
        ResourceListResult resourceListResult = new ResourceListResult();
        Integer thisMonthAddNums = 0;
        Integer thisDayAddNums = 0;
        Integer thisMonthShareNums = 0;
        Integer thisDayShareNums = 0;
        //获取当前用户的资源
        List<User> list = getResourceByUser(user);
        log.info("查询到的用户资源list长度", list.size());
        for (User user2 : list) {
            //判断当前用户的创建时间是否是当月
            if (DateUtils.isThisMonth(user2.getResourceAddTime().getTime())) {
                thisMonthAddNums++;
            }
            //判断当前用户的创建时间是否是当日
            if (DateUtils.isToday(user2.getResourceAddTime().getTime())) {
                thisDayAddNums++;
            }

            //统计当前推荐人数
            if (user2.getUserrefereeUid().equals(user.getUserId())) {
                //判断当前用户的创建时间是否是当月
                if (DateUtils.isThisMonth(user2.getResourceAddTime().getTime())) {
                    thisMonthShareNums++;
                }
                //判断当前用户的创建时间是否是当日
                if (DateUtils.isToday(user2.getResourceAddTime().getTime())) {
                    thisDayShareNums++;
                }
            }
        }
        //设置当前用户资源库中的当日新增人数
        resourceListResult.setThisDayAddNums(thisDayAddNums);
        //设置当前用户资源库中的当月新增人数
        resourceListResult.setThisMonthAddNums(thisMonthAddNums);
        //设置当前用户资源库中的当月推荐人数
        resourceListResult.setThisMonthShareNums(thisMonthShareNums);
        //设置当前用户资源库中的当日推荐人数
        resourceListResult.setThisDayShareNums(thisDayShareNums);
        return resourceListResult;
    }

    /**
     * 用户根据关键字搜索资源列表1
     *
     * @param user
     * @param page
     * @param rows
     * @return
     */
    public PageInfo<User> queryResourceListResultByKeywords(User user, Integer page, Integer rows, String keyWord) {
        Example example = new Example(User.class);
        Criteria criteria = example.createCriteria();
        //归属人
        criteria.andEqualTo("usermanagerUid", user.getUserId())
                //未封号
                .andEqualTo("closedUserStatus", 0)
                //已注册
                .andNotEqualTo("userIsactivation", 0);

        example.or().andLike("uNickname", "%" + keyWord + "%");
        example.or().andLike("memberid", "%" + keyWord + "%");
        example.or().andLike("userrefereeName", "%" + keyWord + "%");

        PageHelper.startPage(page, rows);
        List<User> userList = userMapper.selectByExample(example);
        return new PageInfo<>(userList);
    }

    /**
     * 用户根据关键字搜索资源列表1
     *
     * @param user
     * @param page
     * @param rows
     * @return
     */
    public PageInfo<User> queryResourceListResultByKeywords1(User user, Integer page, Integer rows, String keyWord) {

        Map map = new Hashtable();
        map.put("usermanagerUid", user.getUserId());
        map.put("keyWord", keyWord);
        //map.put("page", page);
        //map.put("rows", rows);

        List<User> userList = userMapper.queryResourceListResultByKeywords(map);
        return new PageInfo<>(userList);
    }

    public List<User> queryResourceListResultByAdvancedSearch(User user, Map<Object, Object> maps) {
        //需要传到后台的参数  Date birthdayStart, Date birthdayEnd, Integer sex, String memberid,String citycode, String  hobbyId, String everjoinId, String personalneedsId

        Example example = new Example(User.class);
        Criteria criteria = example.createCriteria();

        /*-------------------获取数据-----------------------------*/

        Date birthdayStart = DateUtils.fomatDate(maps.get("birthdayStart").toString());
        Date birthdayEnd = DateUtils.fomatDate(maps.get("birthdayEnd").toString());
        //性别 0为女 1为男
        Integer sex = (Integer) maps.get("sex");
        //会员号
        String memberid = (String) maps.get("memberid");
        //区域
        String citycode = (String) maps.get("address");
        //兴趣爱好id
        String hobbyId = (String) maps.get("hobbyId");
        //曾经参与id
        String everjoinId = (String) maps.get("everjoinId");
        //个人需求id
        String personalneedsId = (String) maps.get("personalneedsId");


        /*-------------------逻辑判断-----------------------------*/
        //匹配是当前用户的资源并且处于未封号状态
        criteria.andEqualTo("usermanagerUid", user.getUserId()).andNotEqualTo("closedUserStatus", 0);

        //根据性别
        if (ObjectUtil.isNotNull(sex)) {
            criteria.andEqualTo("sex", sex);
        }

        //根据生日截止时间
        if (ObjectUtil.isNotNull(birthdayStart) && ObjectUtil.isNotNull(birthdayEnd)) {
            criteria.andBetween("ubirthday", birthdayStart, birthdayEnd);
        }

        //根据区域
        if (ObjectUtil.isNotNull(citycode)) {
            criteria.andLike("citycode", citycode);
        }

        List<User> userList = userMapper.selectByExample(example);

        //根据会员号
        if (ObjectUtil.isNotNull(memberid)) {
            User user1 = new User();
            user1.setUsermanagerUid(user.getUserId());
            user1.setMemberid(memberid);
            //根据会员号查询出用户
            User user2 = userService.queryOne(user1);
            for (User user3 : userList) {
                //判断查询出来的userList的用户的分享人是不是user1
                if (!user3.getUserrefereeUid().equals(user2.getUserId())) {
                    userList.remove(user3);
                }
            }
        }

        //兴趣爱好
        if (ObjectUtil.isNotNull(hobbyId)) {
            //在查询出来的数据中进行匹配爱好
            for (User user1 : userList) {
                Userandhobby userandhobby = new Userandhobby();
                userandhobby.setUserId(user1.getUserId());
                //根据当前用户id查询出爱好
                List<Userandhobby> userandhobbyList = userandhobbyService.queryListByWhere(userandhobby);
                //记录用户id
                List<String> uids = new ArrayList<>();
                for (Userandhobby userandhobby1 : userandhobbyList) {
                    //与资源库中的用户爱好进行匹配
                    if (hobbyId.equals(userandhobby1.getHobbyId())) {
                        uids.add(userandhobby1.getUserId());
                    }
                }
                //用户id去重
                uids = ListUtils.removeDuplicate(uids);

                //根据爱好获取用户id
                for (String s : uids) {
                    for (User u : userList) {
                        //将查询出来的id与list进行匹配得出最后的结果
                        if (!s.equals(u.getUserId())) {
                            userList.remove(u);
                        }
                    }
                }

            }
            return userList;
        }

        //曾经参与
        if (ObjectUtil.isNotNull(everjoinId)) {
            //通过循环查询出当前用户有哪些曾经
            for (User user1 : userList) {
                Everjoin everjoin1 = new Everjoin();
                everjoin1.setUserId(user1.getUserId());
                //未逻辑删除的活动
                everjoin1.setIsDelete(0);
                //根据每个用户与曾经参与id在数据库中查询 为空说明没有
                if (ObjectUtil.isNull(everjoinService.queryOne(everjoin1))) {
                    userList.remove(user1);
                }
            }
            return userList;
        }

        //个人需求
        if (ObjectUtil.isNotNull(personalneedsId)) {
            for (User user1 : userList) {
                Userandpersonalneeds userandpersonalneeds = new Userandpersonalneeds();
                userandpersonalneeds.setUserId(user1.getUserId());
                userandpersonalneeds.setPersonalneedsId(personalneedsId);
                //根据每个用户与个人需求id在数据库中查询 为空说明没有
                if (ObjectUtil.isNull(userandpersonalneedsService.queryOne(userandpersonalneeds))) {
                    userList.remove(user1);
                }
            }
            return userList;
        }
        return userList;
    }

    /**
     * 查询当前用户的资源列表
     *
     * @param user
     * @return
     */
    public List<User> getResourceByUser(User user) {
        if (ObjectUtil.isNotNull(user)) {
            Example example = new Example(User.class);
            example.createCriteria()
                    //归属人
                    .andEqualTo("usermanagerUid", user.getUserId())
                    //未封号
                    .andEqualTo("closedUserStatus", 0)
                    //已注册
                    .andNotEqualTo("userIsactivation", 0);
            example.setDistinct(true);
            return userMapper.selectByExample(example);
        }
        return null;
    }

    /**
     * 查询当前用户是否合格
     *
     * @param user
     * @param needCheckExperience 是否需要查询vip体验状态（已体验....）
     * @return
     */
    public boolean checkUserIsOk(User user, boolean needCheckExperience) {
        if (ObjectUtil.isNotNull(user)) {
            // needCheckExperience为真，则说明需要判断用户是否体验过vip;
            if (needCheckExperience) {
                //未封号且已激活,已体验
                return user.getResourceStrategyIsexperience() == 0 && user.getClosedUserStatus() == 0 && user.getUserIsactivation() == 2;
            }
            //未封号且已激活
            return user.getClosedUserStatus() == 0 && user.getUserIsactivation() == 2;
        }
        return false;
    }

    /**
     * 判断用户填写参数是否合格
     *
     * @param user
     * @return
     */
    public boolean checkUserIsOkByRegister(User user) {
        if (ObjectUtil.isNull(user)) {
            return false;
        }
        return ObjectUtil.notEmpty(user.getuNickname())
                && ObjectUtil.isNotNull(user.getuSex())
                && ObjectUtil.notEmpty(user.getProvinceCitycode())
                && ObjectUtil.notEmpty(user.getCityCitycode())
                && ObjectUtil.notEmpty(user.getAreaCitycode())
                && ObjectUtil.notEmpty(user.getuPhone())
                && Tools.isMobile(user.getuPhone());
    }

    /**
     * 根据多个用户id查询多个用户
     *
     * @param uids
     * @return
     */
    public List<User> queryListByUids(List<String> uids) {
        Set<User> users = new HashSet<>();
        User user = User.getInstance();
        for (String s : uids) {
            user.setUserId(s);
            //已经激活
            user.setUserIsactivation(2);
            //未封号
            user.setClosedUserStatus(0);
            User user1 = userService.queryOne(user);
            if (ObjectUtil.isNotNull(user1)) {
                users.add(user1);
            }
        }
        return new ArrayList<>(users);
    }

    /**
     * 更新用户信息
     *
     * @param u1       数据库信息
     * @param users    前端传过来的信息
     * @param uhobbies 爱好信息
     * @return 返回1 更新成功 0 更新失败
     */
    public Integer updateSelective(User u1, User users, List<Userandhobby> uhobbies) {
        //区域
        if (ObjectUtil.isNotNull(users.getProvinceCitycode()) && ObjectUtil.isNotNull(users.getCityCitycode()) && ObjectUtil.isNotNull(users.getAreaCitycode()) && ObjectUtil.isNotNull(users.getAddressName())) {
            u1.setProvinceCitycode(users.getProvinceCitycode());
            u1.setCityCitycode(users.getCityCitycode());
            u1.setAreaCitycode(users.getAreaCitycode());
            u1.setAddressName(users.getAddressName());
        }
        //手机号
        if (ObjectUtil.isNotNull(users.getuPhone())) {
            u1.setuPhone(users.getuPhone());
        }
        //头像
        if (ObjectUtil.isNotNull(users.getChangeHeadUrl())) {
            u1.setChangeHeadUrl(users.getChangeHeadUrl());
        }
        //专业职称
        if (ObjectUtil.isNotNull(users.getProfessionalTitle())) {
            u1.setProfessionalTitle(users.getProfessionalTitle());
        }
        //我能提供
        if (ObjectUtil.isNotNull(users.getCanProvide())) {
            u1.setCanProvide(users.getCanProvide());
        }
        //我需要
        if (ObjectUtil.isNotNull(users.getNeed())) {
            u1.setNeed(users.getNeed());
        }
        //人生信念
        if (ObjectUtil.isNotNull(users.getBeliefInLife())) {
            u1.setBeliefInLife(users.getBeliefInLife());
        }
        if (userService.updateSelective(u1) > 0 && userandhobbyService.saveSelectiveByUAndhobbyList(u1, uhobbies) > 0) {
            return Const.SUCCESS;
        }
        return Const.FAIL;
    }

    /**
     * 用户升级为vip
     *
     * @param user
     * @param utype
     * @return
     */
    public boolean userUpgradeVip(User user, Utype utype) {
        int result;
        int result1 = 0;
        //最终结果
        boolean endResult = false;
        //初级会员
        String commonUserId = UtypeEnum.COMMON_USERS.getUtypeId();
        //客户经理
        String generalAccountManagerId = UtypeEnum.GENERAL_ACCOUNT_MANAGER.getUtypeId();
        // VIP（体验）id
        String vipExperienceCustomerManagerId = UtypeEnum.VIP_experience_CUSTOMER_MANAGER.getUtypeId();
        // VIP（试用）id
        String vipTryCustomerManagerUtypeId = UtypeEnum.VIP_TRY_CUSTOMER_MANAGER.getUtypeId();
        //钻石客户经理
        String vipDiamondsCustomerManagerDayId = UtypeEnum.VIP_DIAMONDS_CUSTOMER_MANAGER_DAY.getUtypeId();

        //查看当前用户的归属人是否已经获得过提成金额
        ResourceUpgrading r = resUpgradingService.queryOneByUser(user);

        //升级为普通客户经理 ：必须是普通客户经理或以下的等级(初级会员、客户经理)
        if (commonUserId.equals(user.getUtypeId()) || generalAccountManagerId.equals(user.getUtypeId())) {
            if (utype.getUtypeId().equals(commonUserId)) {
                user.setMemberDays(utype.getUserDay());
            } else {//否则将用户之前的剩余天数进行累加
                user.setMemberDays(user.getMemberDays() + utype.getUserDay());
            }
            //更改用户的等级
            user.setUtypeId(utype.getUtypeId());
            //则设置会员开始时间
            user.setMemberStartTime(new Date());
            //计算当前会员结束时间
            String s = DateUtils.getAfterDayDate(user.getMemberDays());
            Date date = null;
            try {
                date = DateUtils.fomatDateTime(s);
            } catch (ParseException e) {
                log.info("会员结束时间转换失败,类名及行数为：[{},{}]", getClass(), 507);
            }
            //设置结束时间
            user.setMemberEndTime(date);
            result = super.updateSelective(user);

            //如果当前用户为未升级过 则查询当前等级的提成金额
            if (ObjectUtil.isNull(r)) {
                Memberupdateextract m = Memberupdateextract.getMemberupdateextract();
                m.setMemberUpdateExtractType(0);
                m.setTypeId(utype.getUtypeId());
                //查询出当前提成对象
                Memberupdateextract mem = memUpdateEService.queryOne(m);
                if (ObjectUtil.isNotNull(mem)) {
                    UserprofitService u = getService.getUserprofitService();
                    //新增提成信息
                    result1 = u.saveSelectiveByMemberAndUser(user, m, new Date());
                }
            }
            if (result > 0 && result1 > 0) {
                endResult = true;
            }
        }
        //用户身份为 VIP（体验）用户,vip体验客户经理升级为vip客户经理
        else if (vipExperienceCustomerManagerId.equals(user.getUtypeId())) {
            String utypeId = utype.getUtypeId();
            //更改用户的等级
            user.setUtypeId(utypeId);
            //除普通客户经理外都是vip
            if (!utypeId.equals(generalAccountManagerId)) {
                //设置为vip
                user.setIsVip(1);
            }
            //将用户之前的剩余天数进行累加
            user.setMemberDays(user.getMemberDays() + utype.getUserDay());
            //计算当前会员结束时间
            String s = DateUtils.getAfterDayDate(user.getMemberDays());
            Date date = null;
            try {
                date = DateUtils.fomatDateTime(s);
            } catch (ParseException e) {
                log.info("会员结束时间转换失败,类名及行数为：[{},{}]", getClass(), 548);
            }
            //设置结束时间
            user.setMemberEndTime(date);
            result = super.updateSelective(user);
            //如果当前用户为未升级过 则查询当前等级的提成金额
            if (ObjectUtil.isNull(r)) {
                //查询出当前提成对象
                Memberupdateextract mem = memUpdateEService.queryOneByUtypeId(utypeId);
                if (ObjectUtil.isNotNull(mem)) {
                    UserprofitService u = getService.getUserprofitService();
                    result = u.saveSelectiveByMemberAndUser(user, mem, new Date());
                }
            }
            if (result > 0) {
                endResult = true;
            }
            return endResult;
        }
        //用户身份为 VIP（试用）用户,vip试用客户经理只允许升级为钻石vip客户经理
        else if (vipTryCustomerManagerUtypeId.equals(user.getUtypeId())) {
            String utypeId = utype.getUtypeId();
            //只允许升级为钻石客户经理
            if (vipDiamondsCustomerManagerDayId.equals(utypeId)) {
                //更改用户的等级
                user.setUtypeId(utype.getUtypeId());
                //除普通客户经理外都是vip
                //设置为vip
                user.setIsVip(1);
                //将用户之前的剩余天数进行累加
                user.setMemberDays(user.getMemberDays() + utype.getUserDay());
                //计算当前会员结束时间
                String s = DateUtils.getAfterDayDate(user.getMemberDays());
                Date date = null;
                try {
                    date = DateUtils.fomatDateTime(s);
                } catch (ParseException e) {
                    log.info("会员结束时间转换失败,类名及行数为：[{},{}]", getClass(), 585);

                }
                //设置结束时间
                user.setMemberEndTime(date);
                result = super.updateSelective(user);
                //如果当前用户为未升级过 则查询当前等级的提成金额
                if (ObjectUtil.isNull(r)) {
                    //查询出当前提成对象
                    Memberupdateextract mem = memUpdateEService.queryOneByUtypeId(utypeId);
                    if (ObjectUtil.isNotNull(mem)) {
                        UserprofitService u = getService.getUserprofitService();
                        result = u.saveSelectiveByMemberAndUser(user, mem, new Date());
                    }
                }
                if (result > 0) endResult = true;
            }
        }

        return endResult;
    }

    /**
     * 查询满足条件的资源列表-资源共享
     *
     * @param user
     * @param maps
     * @return
     */
    public List<ObjectResult> getUserListByKeywords(User user, Map<String, Object> maps, Integer count) {
        //maps 应该包含的参数为：行业id egidId，区域 citycode，姓名 uNickname，会员号 memberid
        //查询出当前符合条件的数据
        List<Map> maps1 = userMapper.selectUserListCountByKeywords(maps, count);
        List<ObjectResult> resultList = new LinkedList<>();
        //查询当前用户的信息
        User user1 = userService.queryById(user.getUserId());
        for (Map map : maps1) {
            //满足条件则封装成数据
            ObjectResult objectResult = new ObjectResult();
            User user2 = userService.queryById((String) map.get("user_id"));
            objectResult.setObject(user2);
            objectResult.setTotal((Integer) map.get("COUNT(userManager_uid)"));
            if (user1.getUserId() == user2.getUserId()) {
                ((LinkedList<ObjectResult>) resultList).addFirst(objectResult);
            }
            resultList.add(objectResult);
        }
        return resultList;
    }

    /**
     * 根据多个用户id查询出对象信息
     *
     * @param uids
     * @return
     */
    public List<User> queryByIds(List<String> uids) {
        List<User> users = new ArrayList<>();
        uids = ListUtils.removeDuplicate(uids);
        for (String s : uids) {
            User u = userService.queryById(s);
            users.add(u);
        }
        return users;
    }

    /**
     * 用户设置分享关系
     *
     * @param user           当前登录用户
     * @param shareUser      推荐用户
     * @param sysUserService
     * @param roleService
     */
    public Integer setOwnershipRelationship(User user, User shareUser, SysUserService sysUserService, RoleService roleService) throws Exception {

        //如果不为空  则说明用户通过分享进行体验
        if (ObjectUtil.isNotNull(shareUser) && !user.getUserId().equals(shareUser.getUserId())) {

            //推荐人为空则设置推荐人
            if (ObjectUtil.isNull(user.getUserrefereeUid())) {
                user.setUserrefereeUid(shareUser.getUserId());
                user.setUserrefereeName(shareUser.getuNickname());
            }

            //如果分享用户为客户经理以上，则将当前用户设置为分享用户的资源
            if (shareUser.getIsVip() == 1 && Integer.parseInt(shareUser.getUtypeId()) > 1) {
                user.setUsermanagerUid(shareUser.getUserId());
                user.setUsermanagerName(shareUser.getuNickname());
            } else {
                //如果分享人也没有归属人 则将归属到运营中心
                if (ObjectUtil.isNull(shareUser.getUsermanagerUid())) {
                    user = userService.setSysUserResource(shareUser);
                } else {
                    //归属人为空则设置归属人
                    if (ObjectUtil.isNull(user.getUsermanagerUid()) && ObjectUtil.isNotNull(shareUser.getUsermanagerUid())) {
                        user.setUsermanagerUid(shareUser.getUsermanagerUid());
                        user.setUsermanagerName(shareUser.getUsermanagerName());
                    } else if (ObjectUtil.isNull(user.getUsermanagerUid())) {
                        user = userService.setSysUserResource(user);
                    }
                }
            }
            //设置归属时间
            Date date = new Date();
            user.setResourceAddTime(date);
            if (shareUser.getResourceAddTime() == null) {
                shareUser.setResourceAddTime(date);
            }
            Integer integer = userService.updateSelective(user);
            Integer integer1 = userService.updateSelective(shareUser);
            return integer + integer1;
        }
        return 0;
    }

    /**
     * 设置用户归属到用户平台下
     *
     * @param user
     * @throws Exception
     */
    public User setSysUserResource(User user) throws Exception {
        Role role = roleService.queryOneByRoleName(Const.OPERATION_CENTER, Const.OPERATION_CENTER_ID);
        if (ObjectUtil.isNull(role)) {
            role = roleService.queryOneByRoleName(Const.TOTAL_OPERATIONS_CENTER, Const.TOTAL_OPERATIONS_CENTER_ID);
        }
        if (ObjectUtil.isNotNull(role)) {
            SysUser sysUser = sysUserService.querySysUserByRole(user, role);
            if (ObjectUtil.isNotNull(sysUser)) {
                //将当前用户的归属人和推荐人设置为当前运营管理账号下
                user.setUsermanagerUid(sysUser.getUserId());
                user.setUsermanagerName(sysUser.getName());
                return user;
            } else {
                throw new Exception("系统管理员异常，设置用户归属关系时找不到系统管理员信息");
            }
        } else {
            throw new Exception("运营中心异常，设置用户归属关系时找不到运营中心");
        }
    }

    /**
     * 查询有会员天数的会员
     *
     * @return
     */
    public List<User> queryListByUserMemberDays() {
        Example example = new Example(User.class);
        Criteria criteria = example.createCriteria();
        criteria.andGreaterThan("memberDays", 0);
        example.setDistinct(true);
        List<User> users = userMapper.selectByExample(example);
        //删除掉id重复的user
        for (int i = 0; i < users.size() - 1; i++) {
            for (int j = users.size() - 1; j > i; j--) {
                if (users.get(j).getUserId().equals(users.get(i).getUserId())) {
                    users.remove(j);
                }
            }
        }
        return users;
    }

    /**
     * 根据活动,用户计算活动提成金额
     *
     * @param user
     * @param a
     * @return
     */
    public BigDecimal calculationActivityCommission(User user, Activity a) {
        if (ObjectUtil.isNotNull(a) && a.getActivityIsextract() == 1) {
            //查询活动提成记录
            List<Extractproject> extractprojects = extractprojectService.queryListByActivity(a);

        }
        return null;
    }

    /**
     * 批量更新用户归属关系
     *
     * @param resourceList
     */
    public Integer updateSelective(List<User> resourceList) {
        int count = 0;
        for (User user : resourceList) {
            count += userService.updateSelective(user);
        }
        return count;
    }





    /*-------------------------------测试--------------------------------------------*/

    /**
     * 查询所有会员用户
     *
     * @return
     */
    public List<User> queryMembers() {
        User u = User.getInstance();
        //未封户
        u.setClosedUserStatus(0);
        u.setIsVip(1);
        return super.queryListByWhere(u);
    }

    public List<Map> updateByPrimaryKey1(Map<Object, Object> maps) {
        return userMapper.selectByPrimaryKey1(maps);
    }

    /**
     * 根据example对象查询用户
     *
     * @param example
     * @return
     */
    public List<User> queryListByExample(Example example) {
        return userMapper.selectByExample(example);
    }

}
