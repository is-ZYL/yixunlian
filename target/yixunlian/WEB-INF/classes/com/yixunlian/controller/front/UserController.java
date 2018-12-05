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
import com.sun.istack.internal.NotNull;
import com.yixunlian.controller.base.BaseController;
import com.yixunlian.entity.*;
import com.yixunlian.entity.job.JobManage;
import com.yixunlian.pojo.*;
import com.yixunlian.pojo.system.SystemHelp;
import com.yixunlian.pojo.system.Systembulletin;
import com.yixunlian.service.*;
import com.yixunlian.service.baseservice.GetService;
import net.sf.json.JSONObject;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import util.myutils.*;
import util.myutils.file.FileUpload;
import util.weixin.Const;
import util.weixin.EmojiStringUtils;
import util.weixin.WeiXinPayUtils;
import util.weixin.WxUtil;
import util.weixinpay.CommonUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;

/**
 * 〈一句话功能简述〉<br>
 * 〈用户控制器〉
 *
 * @author yuanyuana
 * @create 2018/9/21
 * @since 1.0.0
 */
@RestController
@RequestMapping("app/front/user")
public class UserController extends BaseController {
    private static final Integer REDIS_TIME = 60 * 60 * 24 * 365;
    private static final Integer CODE_TIME = 60 * 60;
    private static final Integer FIVE_MINUTE = 5 * 60 * 1000;
    private static final Integer DAY_TIME = 60 * 60 * 24;
    private static final ObjectMapper MAPPER = new ObjectMapper();
    private static final String ZERO = "0";
    @Autowired
    public HttpServletRequest request;
    @Resource(name = "redisService")
    private RedisService rService;
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
    @Resource(name = "activityService")
    private ActivityService activityService;
    @Resource(name = "utypeService")
    private UtypeService utypeService;
    @Resource(name = "systembulletinService")
    private SystembulletinService systembulletinService;
    @Autowired
    private UCollectionService uCollectionService;
    @Resource(name = "reportService")
    private ReportService reportService;
    @Resource(name = "sysUserService")
    private SysUserService sysUserService;
    @Resource(name = "roleService")
    private RoleService roleService;
    @Resource(name = "userprofitService")
    private UserprofitService userprofitService;
    @Resource(name = "umoneyService")
    private UmoneyService umoneyService;
    @Resource(name = "paymentflowService")
    private PaymentflowService paymentflowService;
    @Resource(name = "taxrevenueService")
    private TaxrevenueService taxrevenueService;
    @Resource(name = "feedbackadviceService")
    private FeedbackadviceService feedbackadviceService;
    @Resource(name = "systemHelpService")
    private SystemHelpService systemHelpService;
    @Resource(name = "userExperienceVipService")
    private UserExperienceVipService userExperienceVipService;
    @Resource(name = "activitysignService")
    private ActivitysignService activitysignService;
    @Resource(name = "complaintService")
    private ComplaintService complaintService;
    @Resource(name = "qrcodeService")
    private QrcodeService qrcodeService;
    @Resource(name = "uhobbyandactivitycategoryService")
    private UhobbyandactivitycategoryService uhobbyandactivitycategoryService;
    @Resource(name = "scheduleJobService")
    private ScheduleJobService scheduleJobService;

    public static void main(String[] args) throws Exception {

        //生成带logo 的二维码
        //String text = "http://yxl.lanzheng666.com/wx/perCenter_zyGongLue.html";
        //String filePath = QRCodeUtil.encode(text, "path/156302698531720432.png", QRCodeUtil.QRCODE_PATH, true);
        //System.out.print(filePath);

        //生成不带logo 的二维码
        //String textt = "http://www.baidu.com";
        // QRCodeUtil.encode(textt, "", "d:/WPS", true);

        //指定二维码图片，解析返回数据
        System.out.println(QRCodeUtil.decode("D:\\idea_workSpace\\sw-yxl\\src\\main\\webapp\\mobile\\image\\yxl-code.png"));
        //System.out.print(DigestUtils.md5Hex("123456").length());
        //查找用户id为空的数据
        //users.stream().filter(user -> "".equals(user.getUserId()));
    }

    /**
     * 测试token
     *
     * @return 返回token
     */
    @RequestMapping(value = "gettesttoken", method = RequestMethod.GET)
    public Result<String> gettesttoken(@RequestParam String openId) {
        if (ObjectUtil.isNull(openId)) {
            return Result.error("openid is null");
        }
        // 查看是否注册
        User user = new User();
        user.setOpenId(openId);
        User quser = this.userService.queryOne(user);
        String resultToken = TokenUtils.setDataByUser(quser);
        logger.info(resultToken);
        // 返回token
        return Result.success(resultToken);
    }

    /**
     * 测试token123
     *
     * @return 返回token
     */
    @GetMapping("gettest")
    public Result<List<Userandhobby>> gettest1() throws IOException {
        User u = User.getInstance();
        u.setUserId("260265d69d844ea58c82dc3b1f2f989f");
        List<Userandhobby> userandhobbyList = userandhobbyService.queryListByUserDESC(u, "desc");
        return Result.success("hello", userandhobbyList);
    }

    /**
     * 测试token
     *
     * @return 返回token
     */
    @GetMapping(value = "testUpdate")
    public Result<Integer> testUpdate() {
        int count = 0;
        try {
            List<User> users = userService.queryListByUserMemberDays();
            logger.info("查询出来的vip用户：{}", users);
            //查找用户id为空的数据
            //users.stream().filter(user -> "".equals(user.getUserId()));
            for (User user : users) {
                if (user.getMemberDays() > 0) {
                    user.setMemberDays(user.getMemberDays() - 1);
                    count += userService.updateSelective(user);
                }
            }
            logger.info("\n vip用户更新有效日期完成，完成时间为：{}共操作{}条数据", DateUtils.fomatDate(new Date()), count);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("\n vip用户更新有效日期失败，异常时间为：{}共操作{}条数据", DateUtils.fomatDate(new Date()), count);
        }
        return Result.success(count);
    }

    /**
     * 测试token
     *
     * @return 返回token
     */
    @GetMapping(value = "testUpdate1")
    public Result<ResourceListResult> testUpdate1(@RequestParam String param) {
        //180c0c8f6adf4cbbb97e798ffe653cb3
        User user = new User();
        user.setUserId("92be28997c2e4a6bb6f74402893b753c");
        // Map<Object, Object> maps = new HashMap<>();
        //  List<Map> result = this.userService.updateByPrimaryKey1(maps);
        ResourceListResult e = userService.queryResourceListResult(user, 1, 10, param);
        return Result.success(e);
    }





    /*-----------------------------------------------------------------------------*/

    /**
     * 1 用户注册
     *
     * @param user  注册用户
     * @param code  验证码
     * @param token 用户token值
     * @return 返回token值
     */
    @PostMapping("userRegister")
    public Result<String> userRegister(User user, @RequestParam("code") String code, @RequestParam String token) {
        try {
            if (ObjectUtil.isNotNull(user)) {
                logger.info(user + "-----------------用户信息--------------------》注册");
                //将验证码从redis中取出
                String data = TokenUtils.getDataByuPhone(user.getuPhone());
                if (ObjectUtil.isEmpty(data)) {
                    logger.error(user.getuNickname() + "----------key值错误------------》注册");
                    return Result.build("201", "验证码不存在");
                }
                User user1 = User.getInstance();
                user1.setOpenId(user.getOpenId());
                User user2 = userService.queryOne(user1);
                if (ObjectUtil.isNull(user2)) {
                    return Result.error("410", "当前用户未授权");
                }
                if (user2.getUserIsactivation() == 1) {
                    return Result.error("203", "当前用户已经注册");
                }
                if (data.equals(code)) {
                    //设置用户昵称
                    user2.setuNickname(EmojiStringUtils.replaceEmoji(user.getuNickname()));
                    user2.setuSex(user.getuSex());
                    user2.setUtypeId("1");
                    user2.setUtypeName("普通用户");
                    user2.setProvinceCitycode(user.getProvinceCitycode());
                    user2.setCityCitycode(user.getCityCitycode());
                    user2.setAreaCitycode(user.getAreaCitycode());
                    user2.setAddressName(user.getAddressName());
                    user2.setuPhone(user.getuPhone());
                    //初始化用户类型 普通用户（已注册未激活）
                    user2.setUserIsactivation(1);
                    //将密码设置为当前手机号，并md5加密
                    user2.setPassword(DigestUtils.md5Hex(user.getuPhone()));
                    userService.updateSelective(user2);
                    //删除之前的token并获取新的token值
                    TokenUtils.delToken(token);
                    // 把用户信息放到rides中
                    String resultToken = TokenUtils.setDataByUser(user2);
                    logger.info(user.getuNickname() + "--------注册成功(更新用户信息)--------》注册");
                    return Result.success("200", "注册成功", resultToken);
                } else {
                    // 验证码错误
                    logger.error(user.getuNickname() + "----------验证码错误------------》注册");
                    return Result.build("204", "验证码错误");
                }
            } else {
                logger.error(user.getuNickname() + "----------参数异常------------------》注册");
                return Result.build("403", "参数异常");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.build("500", "服务器异常");
    }

    /**
     * 2 根据code值获取用户信息 getWxUserInfo
     *
     * @param code 微信code值
     * @return 返回token值
     */
    @GetMapping("getWxUserInfo")
    public Result<JSONObject> getWxUserInfo(@RequestParam("code") String code) {
        try {
            if (ObjectUtil.isNotNull(code)) {
                logger.error("----------code=====" + code + "------------------》获取微信用户信息");
                String userInfo = WxUtil.getUserInfo(code);
                if (ObjectUtil.isNull(userInfo)) {
                    logger.error("----------获取用户信息错误code------》获取微信用户信息");
                    return Result.error("409", "获取用户信息错误code");
                }
                JSONObject object = JSONObject.fromObject(userInfo);
                String openId = object.getString("openid");
                String headimgurl = object.getString("headimgurl");
                String nickname = object.getString("nickname");
                logger.error("----------openId=====" + openId + "------》获取微信用户信息");
                logger.error("----------object=====" + object + "------》获取微信用户信息");
                //查询当前用户是否已经存在于数据库中
                User u = new User();
                if (ObjectUtil.isNotNull(openId)) {
                    u.setOpenId(openId);
                    //查询当前用户的数据
                    User us = this.userService.queryOne(u);
                    //不为空设置分享人以及归属人
                    if (ObjectUtil.isNotNull(us)) {
                        us.setHeadUrl(headimgurl);
                        us.setWxNickname(EmojiStringUtils.replaceEmoji(nickname));
                        this.userService.updateSelective(us);
                        String resultToken = TokenUtils.setDataByUser(us);
                        object.put("token", resultToken);
                        logger.error("----------object=====" + object + "------------------》获取微信用户信息");
                        return Result.success("200", "获取用户信息成功", object);
                        //为0说明是用户自主进入公众号，则只能注册时才能进行设置归属人
                    } else {
                        //初始化
                        u.init();
                        u.setOpenId(openId);
                        u.setHeadUrl(headimgurl);
                        u.setWxNickname(EmojiStringUtils.replaceEmoji(nickname));
                        this.userService.saveSelective(u);
                        String resultToken = TokenUtils.setDataByUser(u);
                        object.put("token", resultToken);
                        logger.error("----------object=====" + object + "------------------》获取微信用户信息");
                        return Result.success("200", "获取用户信息成功", object);
                    }
                } else {
                    logger.error("----------openId为空------------------》获取微信用户信息");
                    return Result.error("403", "openId为空");
                }
            } else {
                logger.error("----------code/token参数为空------------------》获取微信用户信息");
                return Result.error("406", "code/token参数为空");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.error("500", "服务器异常");
    }

    /**
     * 2-1 根据用户id查询用户信息
     *
     * @param token  当前用户token值
     * @param userId 查询的用户id
     * @return
     */
    @GetMapping("getUserDetailByuserId")
    public Result<User> getUserDetailByuserId(@RequestParam String token, @RequestParam String userId) {
        //将验证码从redis中取出
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            user = userService.queryById(user.getUserId());
            if (!"".equals(userId)) {
                User u = userService.queryById(userId);
                if (ObjectUtil.isNull(u)) {
                    return Result.error("207", "没有此用户信息");
                }
                if (ObjectUtil.isNotNull(user.getUsermanagerUid()) && !u.getUsermanagerUid().equals(user.getUserId())) {
                    return Result.error("206", "当前用户没有权限查看此用户信息");
                }
                return Result.success("查询成功", u);
            }
            return Result.error("403", "参数异常");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return Result.error("500", "服务器异常");
    }

    /**
     * 3 获取短信验证码
     *
     * @param uPhone 手机号
     * @return 返回验证码
     */
    @PostMapping("getAuthCodeByToken")
    public Result<Integer> getAuthCodeByToken(@RequestParam String uPhone) {
        //判断手机号是否合格
        if (ObjectUtil.isNotNull(uPhone) && !Tools.isMobile(uPhone)) {
            //手机号不合格
            return Result.build("403", "手机号码格式错误");
        }
           /* //记录当前用户获取验证码的次数
            String totalCount = TokenUtils.getCodeCountByUphone(uPhone, rService);
            logger.info("用户获取验证码次数为=====" + totalCount);
            if (ObjectUtil.isNotNull(totalCount) && Integer.parseInt(totalCount) > 20) {
                return Result.error("今日可获取验证码次数为0");
            }*/
        int i = (int) ((Math.random() * 9 + 1) * 100000);
        //短信发送的URL 请登录zz.253.com 获取完整的URL接口信息
        //String smsSingleRequestServerUrl = "http://smssh1.253.com/msg/send/json";
        //// 设置您要发送的内容：其中“【】”中括号为运营商签名符号，多签名内容前置添加提交
        //String msg = "【易讯连】您好,您的验证码是" + i + "在5分钟内有效，若非本人操作，请忽略！";
        ////状态报告
        //String report = "true";
        //SmsSendRequest smsSingleRequest = new SmsSendRequest(Const.account, Const.password, msg, uPhone, report);
        //String requestJson = JSON.toJSONString(smsSingleRequest);
        //System.out.println("before request string is: " + requestJson);
        //String response = ChuangLanSmsUtil.sendSmsByPost(smsSingleRequestServerUrl, requestJson);
        //System.out.println("response after request result is :" + response);
        //SmsSendResponse smsSingleResponse = JSON.parseObject(response, SmsSendResponse.class);
        //System.out.println("response  toString is :" + smsSingleResponse);
        //将验证码存到redis中 五分钟有效
        rService.set("CHECK" + uPhone, i + "", FIVE_MINUTE);
        System.out.println(uPhone + "-------------------------------" + i);
        //   发送成功
        //int i1 = Integer.parseInt(totalCount);
        //i1++;
        ////   将获取验证码次数存到redis中  保存一天
        //this.rService.set("COUNT" + uPhone, i1 + "", DateUtils.getSecondsNextEarlyMorning().intValue());
        return Result.success("发送成功", i);
    }

    /**
     * 4 判断会员号唯一性
     *
     * @return 204
     */
    @GetMapping("checkUserNameIsOk")
    public Result<String> checkUserNameIsOk(@RequestParam String token, @RequestParam String memberid) {
        try {
            logger.info("用户判断会员号唯一性");
            String data = TokenUtils.getDataByKey(token);
            if (ObjectUtil.isNull(data)) {
                // token不正确 返回204
                logger.error("token值错误----------------------用户判断会员号唯一性 ");
                return Result.error("204", "token值错误");
            }
            if (ObjectUtil.isNull(memberid)) {
                logger.error("会员名为空----------------------用户判断会员号唯一性 ");
                return Result.error("403", "会员名为空");
            }
            User u = new User();
            u.setMemberid(memberid);
            User result = this.userService.queryOne(u);
            //判断用户是否存在
            if (ObjectUtil.isNotNull(result)) {
                return Result.success("200", "no");
            } else {
                return Result.success("200", "ok");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("服务器异常----------------------用户判断会员号唯一性 ");
        return Result.error("500", "服务器异常");
    }

    /**
     * 4-1 判断手机号是否已经注册
     *
     * @return 204
     */
    @GetMapping("checkUphoneIsOk")
    public Result<String> checkUphoneIsOk(@NotNull @RequestParam String phone) {
        User u = User.getInstance();
        u.setuPhone(phone);
        User result = this.userService.queryOne(u);
        //判断用户是否存在
        if (ObjectUtil.isNotNull(result)) {
            return Result.success("200", "ok");
        } else {
            return Result.success("204", "no");
        }
    }

    /**
     * 5 获取兴趣爱好列表
     *
     * @param token 用户token值
     * @param page  当前页码
     * @param rows  每页显示数据条数
     * @return 返回EasyUIResult{总条数，兴趣数据List}
     */
    @GetMapping("getHobbyList")
    public Result<PageInfo<Uhobby>> getHobbyList(@RequestParam String token, @RequestParam(value = "page", defaultValue = "1") Integer page, @RequestParam(value = "rows", defaultValue = "10") Integer rows) {
        try {
            String data = TokenUtils.getDataByKey(token);
            if (ObjectUtil.isNull(data)) {
                // token不正确 返回204
                return Result.error("204", "token不正确");
            }
            PageInfo<Uhobby> result = this.uhobbyService.queryAllListByDESC(page, rows);
            return Result.success("200", "查询成功", result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 出错500
        return Result.success("500", "服务器异常");
    }

    /**
     * 6 用户登录
     *
     * @param account  账号（会员号/手机号）
     * @param password 密码
     * @return 返回token值
     */
    @PostMapping("userLogin")
    public Result<String> userLogin(@RequestParam String account, @RequestParam String password) {
        try {
            if (ObjectUtil.isNull(account) || ObjectUtil.isNull(password)) {
                return Result.error("403", "用户名或密码为空");
            }
            User user = new User();
            //md5加密
            user.setPassword(DigestUtils.md5Hex(password));
            //判断用户是否输入的是手机号
            if (Tools.isMobile(account)) {
                user.setuPhone(account);
            } else {//说明是输入的会员号
                user.setMemberid(account);
            }
            User resultUser = userService.queryOne(user);
            if (ObjectUtil.isNotNull(resultUser)) {
                logger.info("用户信息" + resultUser);
                //判断当前用户是否封户
                if (resultUser.getClosedUserStatus().equals(0)) {
                    // 把用户信息放到rides中
                    String token = TokenUtils.setDataByUser(resultUser);
                    // 返回token 200
                    return Result.success("200", "登录成功", token);
                } else {
                    // 用户处于封号状态 204
                    logger.error("----------用户处于封号状态------------》用户登录 6");
                    return Result.success("204", "用户处于封号状态");
                }
            }
            logger.error("----------用户名或密码错误------------》用户登录 6");
            //密码错误 403
            return Result.error("403", "用户名或密码错误");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.error("500", "服务器异常");
    }

    /**
     * 6-1 用户退出登录
     *
     * @return 返回1 退出成功 0 退出失败
     */
    @GetMapping("userExitLogin")
    public Result<Integer> userExitLogin(@RequestParam String token) {
        try {
            String data = TokenUtils.getDataByKey(token);
            if (ObjectUtil.isNull(data)) {
                // token不正确 返回204
                logger.error("----------token值错误------------》用户退出登录 6-1");
                return Result.error("204", "token值错误");
            }
            // 删除token的值
            if (this.rService.del("TOKEN_" + token) > 0) {
                return Result.success("200", "退出成功", Const.SUCCESS);
            }
            logger.error("----------删除token失败------------》用户退出登录 6-1");
            return Result.success("206", "退出失败", Const.FAIL);
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("----------服务器异常------------》用户退出登录 6-1");
        return Result.error("500", "服务器异常");
    }

    /**
     * 7 激活用户
     *
     * @param userInfo 用户信息
     * @return 0 激活失败 1激活成功
     */
    @PostMapping("userActivation")
    public Result<Integer> userActivation(@RequestBody UserInfo userInfo) {
        if (ObjectUtil.isNull(userInfo)) {
            return Result.error("403", "参数为空");
        }
        String token = userInfo.getToken();
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            logger.error("----------token值错误------------》激活用户 7");
            return Result.error("204", "token值错误");
        }
        User user = userInfo.getUser();
        List<Uhobby> uhobbies = userInfo.getUhobbies();
        if (ObjectUtil.isNotNull(user) && ObjectUtil.isNotNull(uhobbies)) {
            try {
                User redisUser = MAPPER.readValue(data, User.class);
                //用户为空返回403
                if (ObjectUtil.isNull(redisUser)) {
                    logger.error("----------用户不存在------------》激活用户 7");
                    return Result.error("401", "用户不存在");
                }
                //设置用户填写的字段数据
                redisUser.setUbirthday(user.getUbirthday());
                redisUser.setMemberid(user.getMemberid());
                //将此用户设置为已激活状态
                redisUser.setUserIsactivation(2);
                userService.updateSelective(redisUser);
                //利用循环将用户所选的爱好与用户绑定
                //批量保存用户的兴趣爱好
                Integer count = userandhobbyService.saveSelectiveByUhobbyList(redisUser, uhobbies);
                if (count > 0) {
                    return Result.success("200", "激活成功", Const.SUCCESS);
                }
                logger.error("----------爱好数据保存失败------------》激活用户 7");
                return Result.error("206", "激活失败");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            //激活失败
            logger.error("----------userInfo参数为空------------》激活用户 7");
            return Result.error("403", "userInfo参数为空");
        }
        // 出错500
        logger.error("----------服务器异常------------》激活用户 7");
        return Result.error("500", "服务器异常");
    }

    /**
     * 8 根据token获取用户信息
     *
     * @param token 用户token值
     * @return 返回用户信息user
     */
    @GetMapping("getUserDetailByToken")
    public Result<User> getUserDetail(@RequestParam String token) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            logger.error("----------token值为空------------》根据token获取用户信息 8");
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            logger.info("根据token获取用户信息" + user);
            if (ObjectUtil.isNull(user)) {
                return Result.error("209", "用户不存在");
            }
            User result = userService.queryById(user.getUserId());
            //用户为空返回403
            if (ObjectUtil.isNull(result)) {
                logger.error("----------未从数据库成功查询到用户数据------------》根据token获取用户信息 8");
                return Result.error("403", "未从数据库成功查询到用户数据");
            }
            return Result.success("200", "查询成功", result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("----------服务器异常------------》根据token获取用户信息 8");
        return Result.error("500", "服务器异常");
    }

    /**
     * 9 根据token更改用户信息(区域，从事行业，昵称，专业职称，我能提供，我所需要，人生信念)
     *
     * @return 0 更改失败 1更改成功
     */
    @PostMapping("updateUserBaseInfoByToken")
    public Result<User> updateUserBaseInfoByToken(@RequestBody UserInfo userInfo) {
        String token = userInfo.getToken();
        List<Userandhobby> uhobbies = userInfo.getHobbyList();
        User users = userInfo.getUser();
        if (ObjectUtil.isNull(uhobbies) && ObjectUtil.isNull(users) && ObjectUtil.isNull(token)) {
            return Result.error("403", "参数异常");
        }
        logger.error("uhobbies=====" + uhobbies);
        String data = TokenUtils.getDataByKey(userInfo.getToken());
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            logger.error("----------token值错误------------》根据token更改用户信息 9");
            return Result.error("204", "token值错误");
        }
        try {
            if (ObjectUtil.isAllFieldNull(users)) {
                logger.error("----------用户没有任何更改------------》根据token更改用户信息 9");
                return Result.error("403", "没有任何更改");
            }
            //通过token值获取user对象
            User u = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(u)) {
                return Result.error("205", "用户不存在");
            }
            //通过user对象查询数据库对应的user
            User u1 = userService.queryById(u.getUserId());
            //判断参数是否为空
            if (ObjectUtil.isNotNull(users.getEgidId()) && ObjectUtil.isNotNull(users.getEgidName())) {
                Engagendustry e = engagendustryServer.queryById(users.getEgidId());
                if (ObjectUtil.isNull(e)) {
                    return Result.error("207", "没有这个行业");
                }
                u1.setEgidId(users.getEgidId());
                u1.setEgidName(users.getEgidName());
            }
            userService.updateSelective(u1, users, uhobbies);
            //更新数据库
            if (userService.updateSelective(u1) > 0 && userandhobbyService.saveSelectiveByUAndhobbyList(u1, uhobbies) > 0) {
                // 删除token的值
                TokenUtils.delToken(token);
                //将u1保存至redis,token值不变
                TokenUtils.setDataByUser(u1, token);
                //将用户数据查询出来返回给前端
                User user = userService.queryById(u.getUserId());
                return Result.success("200", "更新成功", user);
            }
            logger.error("----------更新数据库异常------------》根据token更改用户信息 9");
            return Result.error("206", "更新失败");
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("----------服务器异常------------》根据token更改用户信息 9");
        return Result.error("500", "服务器异常");
    }

    /**
     * 9-1 用户更改密码
     *
     * @param uPhone
     * @param password
     * @param code
     * @return
     */
    @PostMapping("userUpdatePassword")
    public Result<Integer> userUpdatePassword(@RequestParam String uPhone, @RequestParam String password, @RequestParam String code) {
        if (ObjectUtil.isNotNull(uPhone) && ObjectUtil.isNotNull(password) && ObjectUtil.isNotNull(code)) {
            User user = User.getInstance();
            if (!Tools.isMobile(uPhone)) {
                logger.error("----------手机号格式有误------------》用户更改密码 9-1");
                return Result.error("403", "手机号格式有误");
            }
            user.setuPhone(uPhone);
            User result = userService.queryOne(user);
            //用户为空返回406
            if (ObjectUtil.isNull(result)) {
                logger.error("----------用户不存在------------》用户更改密码 9-1");
                return Result.error("406", "用户不存在");
            }
            if (result.getUserIsactivation() == 0) {
                logger.error("----------当前账号未注册------------》用户更改密码 9-1");
                return Result.error("407", "当前账号未注册");
            }
            String data = TokenUtils.getDataByuPhone(result.getuPhone());
            //验证码匹配
            if (data.equals(code)) {
                result.setPassword(DigestUtils.md5Hex(password));
                Integer r = userService.updateSelective(result);
                if (r > 0) {
                    return Result.success("200", "修改成功", r);
                }
                return Result.success("201", "修改失败", r);
            }
            logger.error("----------验证码错误------------》用户更改密码 9-1");
            return Result.error("407", "验证码错误");
        }
        logger.error("----------参数为空------------》用户更改密码 9-1");
        return Result.error("408", "参数为空");
    }

    /**
     * 9-2 用户更改头像
     *
     * @param token token值
     * @param file  头像
     * @return 返回文件路径
     */
    @PostMapping("userUpdateHeadUrl")
    public Result<String> userUpdateHeadUrl(@RequestParam String token, @RequestParam("file") CommonsMultipartFile file) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            logger.error("----------token值错误------------》用户更改头像 9-2");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            if (ObjectUtil.isNull(u)) {
                //用户为空返回403
                logger.error("----------用户不存在------------》用户更改头像 9-2");
                return Result.error("403", "用户不存在");
            }
            if (!file.isEmpty()) {
                String path = FileUpload.fileUploadToDisk(file);
                u.setChangeHeadUrl(path);
                if (userService.updateSelective(u) > 0) {
                    return Result.success("403", "更改成功", path);
                }
                File file1 = new File("c:\\" + path);
                if (file1.exists()) {
                    file1.delete();
                }
                logger.error("----------数据库更新失败------------》用户更改头像 9-2");
                return Result.error("406", "更新失败");
            }
            logger.error("----------file文件为空------------》用户更改头像 9-2");
            return Result.error("407", "上传文件为空");
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("----------服务器异常------------》用户更改头像 9-2");
        return Result.error("500", "服务器异常");
    }

    /**
     * 10 根据token 用户更新兴趣爱好
     *
     * @param token 用户token值
     * @return 0 更新失败 1更新成功
     */
    @PostMapping(value = "updateUserHobbyByHobbyId")
    public Result<Integer> updateUserHobbyByHobbyId(@NotNull @RequestParam String token, @NotNull @RequestParam(required = false, value = "uhobbies[]") ArrayList<Userandhobby> uhobbies) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            logger.error("----------token值错误------------》用户删除兴趣爱好 10");
            return Result.error("204", "token值错误");
        }
        try {
            //通过token值获取user对象
            User u = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(u)) {
                logger.error("----------用户不存在------------》用户删除兴趣爱好 10");
                return Result.error("403", "用户不存在");
            }
            Integer count = userandhobbyService.saveSelectiveByUAndhobbyList(u, uhobbies);
            return Result.success("200", "更新成功", count);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("----------服务器异常------------》用户删除兴趣爱好 10");
        return Result.error("500", "服务器异常");
    }

    /**
     * 11 根据token 用户查看兴趣爱好
     *
     * @param token 用户token值
     * @return 返回当前用户的兴趣爱好
     */
    @GetMapping("getUserHobbyByToken")
    public Result<List<Userandhobby>> getUserHobbyByToken(@RequestParam String token, @RequestParam(defaultValue = "") String userId) {
        logger.info("\n用户查看兴趣爱好userId[{}]", userId);
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            logger.error("----------token值错误------------》用户查看兴趣爱好 11");
            return Result.error("204", "token值错误");
        }
        try {
            //通过token值获取user对象
            User u = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(u)) {
                logger.error("----------用户不存在------------》用户查看兴趣爱好 11");
                return Result.error("206", "用户不存在");
            }
            List<Userandhobby> uhlists = null;
            if (!"".equals(userId)) {
                uhlists = userandhobbyService.queryListByUserDESC(userId, "desc");
                if (ObjectUtil.isNull(uhlists)) {
                    return Result.error("207", "参数userId错误");
                }
            } else {
                //查询当前用户的所有兴趣
                uhlists = userandhobbyService.queryListByUserDESC(u, "desc");
            }
            return Result.success("获取成功", uhlists);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("----------服务器异常------------》用户查看兴趣爱好 11");
        return Result.error("500", "服务器异常");
    }

    /**
     * 13 根据token 用户分页获取行业列表
     *
     * @param token 用户token值
     * @return 返回行业数据List
     */
    @GetMapping(value = "getEngagendustryList")
    public Result<List<Engagendustry>> getEngagendustryList(@RequestParam String token) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            logger.error("----------token值错误------------》用户查看兴趣爱好 11");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            //通过token值获取user对象
            User u = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(u)) {
                logger.error("----------用户不存在------------》用户查看兴趣爱好 11");
                return Result.error("206", "用户不存在");
            }
            List<Engagendustry> list = engagendustryServer.queryAllListByDESC();
            return Result.success(list);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("----------服务器异常------------》用户分页获取行业列表 13");
        return Result.error("500", "服务器异常");
    }

    /**
     * 14 根据token 用户获取我参与的活动列表
     *
     * @param token 用户token值
     * @param page  当前页码
     * @param rows  每页显示数据条数
     * @return 返回EasyUIResult{总条数，曾经参与的活动List}
     */
    @GetMapping(value = "getUserOverJoinActivityByToken")
    public Result<PageInfo<Activity>> getUserOverJoinActivityByToken(@RequestParam String token, @RequestParam(value = "page", defaultValue = "1") Integer page, @RequestParam(value = "rows", defaultValue = "10") Integer rows) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            logger.error("----------token值错误------------》用户获取我参与的活动列表 14");
            return Result.error("204", "token值错误");
        }
        //通过token值获取user对象
        try {
            User u = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(u)) {
                logger.error("----------用户不存在------------》用户获取我参与的活动列表 14");
                return Result.error("206", "用户不存在");
            }
            //查询当前用户的所有参与的活动id
            List<Everjoin> list = everjoinService.queryPageListByUid(page, rows, u);
            //根据活动id查询活动列表
            PageInfo<Activity> result = activityService.queryPageListByUid(list);
            return Result.success(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("----------服务器异常------------》用户获取我参与的活动列表 14");
        return Result.error("500", "服务器异常");
    }

    /**
     * 15 根据token 用户获取注册服务协议
     *
     * @param token token值
     * @return 返回注册协议对象
     */
    @GetMapping(value = "getServiceAgreementByToken")
    public Result<Systembulletin> getServiceAgreementByToken(@RequestParam String token) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            logger.error("----------token不正确------------》用户获取注册服务协议 15");
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户不存在------------》用户获取注册服务协议 15");
                return Result.error("206", "用户不存在");
            }
            Systembulletin systembulletin = new Systembulletin();
            systembulletin.setSystemStatus(Const.SERVICE_AGREEMENT);
            //查询注册协议
            systembulletinService.queryOne(systembulletin);
            Systembulletin result = systembulletinService.queryOne(systembulletin);
            return Result.success(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("----------服务器异常------------》用户获取注册服务协议 15");
        return Result.error("500", "服务器异常");
    }

    /**
     * 16 根据token 用户逻辑删除参与的活动
     *
     * @param token      token值
     * @param activityId 活动id
     * @return 0 删除失败 1 删除成功
     */
    @PostMapping(value = "delUserOverJoinActivityByActivityId")
    public Result<Integer> delUserOverJoinActivityByActivityId(@RequestParam String token, String activityId) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            logger.error("----------token不正确------------》用户逻辑删除参与的活动 16");
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户不存在------------》用户逻辑删除参与的活动 16");
                return Result.error("206", "用户不存在");
            }
            if (ObjectUtil.isNotNull(activityId)) {
                //删除
                everjoinService.deleteById(activityId);
                return Result.success("删除成功", Const.SUCCESS);
            }
            logger.error("----------activityId参数为空------------》用户逻辑删除参与的活动 16");
            return Result.error("activityId参数为空", Const.FAIL);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("----------服务器异常------------》用户逻辑删除参与的活动 16");
        return Result.error("500", "服务器异常");
    }

    /**
     * 18 根据token 用户收藏活动
     *
     * @param token      token值
     * @param activityId 活动id
     * @return 0 收藏失败 1 收藏成功
     */
    @PostMapping(value = "saveActivityByActivityId")
    public Result<Integer> saveActivityByActivityId(@RequestParam String token, String activityId) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            logger.error("----------token不正确------------》用户收藏活动 18");
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户不存在------------》用户收藏活动 18");
                return Result.error("206", "用户不存在");
            }
            if (ObjectUtil.notEmpty(activityId)) {
                //保存到数据库
                UCollection u = new UCollection(user.getUserId(), activityId);
                UCollection uCollection = uCollectionService.queryOne(u);
                if (ObjectUtil.isNotNull(uCollection)) {
                    return Result.success(Const.SUCCESS);
                }
                uCollectionService.save(u);
                return Result.success(Const.SUCCESS);
            }
            logger.error("----------activityId参数为空------------》用户收藏活动 18");
            return Result.error("403", "参数异常");
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("----------服务器异常------------》用户收藏活动 18");
        return Result.error("500", "服务器异常");
    }

    /**
     * 19 根据token 检查当前用户是否收藏此活动
     *
     * @param token      token值
     * @param activityId 活动id
     * @return 0 未收藏 1 已收藏
     */
    @GetMapping(value = "checkIsCollectionByActivityId")
    public Result<Integer> checkIsCollectionByActivityId(@RequestParam String token, String activityId) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            logger.error("----------token不正确------------》检查当前用户是否收藏此活动 19");
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户不存在------------》检查当前用户是否收藏此活动 19");
                return Result.error("206", "用户不存在");
            }
            if (ObjectUtil.notEmpty(activityId)) {
                //保存到数据库
                UCollection u = new UCollection();
                u.setUserId(user.getUserId());
                u.setActivityId(activityId);
                UCollection result = uCollectionService.queryOne(u);
                //为空则未收藏当前活动 返回0反之返回1
                return null == result ? Result.success(Const.FAIL) : Result.success(Const.SUCCESS);
            }
            logger.error("----------activityId参数为空------------》检查当前用户是否收藏此活动 19");
            return Result.error("403", "参数异常");
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("----------服务器异常------------》检查当前用户是否收藏此活动 19");
        return Result.error("500", "服务器异常");
    }

    /**
     * 20 根据token 用户取消收藏活动
     *
     * @param token      token值
     * @param activityId 活动id
     * @return 0 取消失败 1取消成功
     */
    @PostMapping(value = "cancelActivityByActivityId")
    public Result<?> cancelActivityByActivityId(@RequestParam String token, String activityId) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isEmpty(data)) {
            // token不正确 返回204
            logger.error("----------token不正确------------》用户取消收藏活动 20");
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户不存在------------》用户取消收藏活动 20");
                return Result.error("206", "用户不存在");
            }
            if (ObjectUtil.notEmpty(activityId)) {
                UCollection u = new UCollection();
                u.setUserId(user.getUserId());
                u.setActivityId(activityId);
                Integer integer = uCollectionService.deleteByWhere(u);
                return 1 == integer ? Result.success(integer) : Result.error("204", "取消失败", null);
            }
            logger.error("----------activityId为空------------》用户取消收藏活动 20");
            return Result.error("403", "参数异常");
        } catch (IOException e) {
            e.printStackTrace();
        }
        logger.error("----------服务器异常------------》用户取消收藏活动 20");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 21 根据token 用户举报当前活动
     *
     * @param token  token值
     * @param report 举报对象（活动id，举报内容）
     * @return 0 举报失败 1 举报成功
     */
    @PostMapping(value = "reportActivityByToken")
    public Result<Integer> reportActivityByToken(@RequestParam String token, Report report) {
        logger.info("----------------------》用户举报当前活动 21");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》用户举报当前活动 21");
                return Result.error("206", "用户不存在");
            }
            if (ObjectUtil.isNotNull(report)) {
                //初始化举报对象
                report.init();
                //保存到数据库
                if (reportService.saveSelective(report) > 0) {
                    return Result.success(Const.SUCCESS);
                }
                return Result.error("举报异常");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        logger.error("----------服务器异常------------》用户举报当前活动 21");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 21-1 根据token 查看当前用户是否参加过当前活动
     *
     * @param token token值
     * @return 1 参加过 0 未参加过
     */
    @PostMapping(value = "checkUserisAddActivityByToken")
    public Result<Integer> checkUserisAddActivityByToken(@RequestParam String token, @RequestParam String activityId) {
        logger.info("----------------------》查看当前用户是否参加过当前活动 21-1");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》查看当前用户是否参加过当前活动 21-1");
                return Result.error("206", "用户不存在");
            }
            if (ObjectUtil.isNotNull(activityId)) {
                //根据活动id与用户id查询是否参加过此活动
                Activitysign activitysign = activitysignService.queryActivitysignsByUser(user, activityId);
                if (ObjectUtil.isNotNull(activitysign)) {
                    //参加过返回1
                    return Result.success(Const.SUCCESS);
                }
                //未参加过返回0
                return Result.success(Const.FAIL);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        logger.error("----------服务器异常------------》查看当前用户是否参加过当前活动 21-1");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 21-2 根据token 用户投诉当前活动
     *
     * @param token token值
     * @return 1 成功 0 投诉失败
     */
    @PostMapping(value = "userComplaintActivitiesByToken")
    public Result<Integer> userComplaintActivitiesByToken(@RequestParam String token, Complaint complaint) {
        logger.info("----------------------》用户投诉当前活动 21-2");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》用户投诉当前活动 21-2");
                return Result.error("206", "用户不存在");
            }
            if (ObjectUtil.isNotNull(complaint)) {

                if (complaintService.saveByUserActivityId(user, complaint) > 0) {
                    return Result.success(Const.SUCCESS);
                }
                return Result.success(Const.FAIL);
            }
            logger.error("----------投诉对象为空 返回403------------》用户投诉当前活动 21-2");
            return Result.error("403", "投诉对象异常");
        } catch (IOException e) {
            e.printStackTrace();
        }
        logger.error("----------服务器异常------------》用户投诉当前活动 21-2");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 22 根据token 用户查看收藏的活动列表
     *
     * @param token 用户token值
     * @param page  当前页码
     * @param rows  每页显示数据条数
     * @return 返回EasyUIResult
     */
    @GetMapping(value = "getCollectionActivityByToken")
    public Result<List<Activity>> getCollectionActivityByToken(@RequestParam String token, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows) {
        logger.info("----------------------》用户查看收藏的活动列表 22");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》用户查看收藏的活动列表 22");
                return Result.error("206", "用户不存在");
            }
            //分页查询当前用户收藏的活动数据
            PageInfo<UCollection> list = uCollectionService.queryPageListByUser(page, rows, user);
            //根据活动数据查询出所有活动
            List<Activity> result = activityService.queryPageListByActivity(list.getList());
            //结果封装
            return Result.success(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
        logger.error("----------服务器异常------------》用户查看收藏的活动列表 22");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 23 根据token 用户查看我的收益记录
     *
     * @param token     用户token值
     * @param page      当前页码
     * @param rows      每页显示数据条数
     * @param startTime 根据时间查询当前用户的记录
     * @param endTime   根据时间查询当前用户的记录
     * @return 活动提成记录数据封装结果
     */
    @GetMapping(value = "getMyWalletByToken")
    public Result<ProfitListResult> getMyWalletByToken(@RequestParam String token, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows, @RequestParam Date startTime, @RequestParam Data endTime) {
        logger.info("----------------------》用户查看我的收益记录 23");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);

            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》用户查看我的收益记录 23");
                return Result.error("206", "用户不存在");
            }
            //根据用户id查询当前用户的提成记录表
            ProfitListResult result = userprofitService.queryUserProfitListByUserAndTime(user, page, rows, startTime, endTime);
            //结果封装
            return Result.success(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
        logger.error("----------服务器异常------------》用户查看我的收益记录 23");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 24 根据token 查看平台总收益
     *
     * @param token 用户token值
     * @return
     */
    @GetMapping(value = "getAllWalletByToken")
    public Result<Double> getAllWalletByToken(@RequestParam String token) {
        logger.info("----------------------》查看平台总收益 24");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》查看平台总收益 24");
                return Result.error("206", "用户不存在");
            }
            double result = userprofitService.queryAllWallet();
            //结果封装
            return Result.success(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
        logger.error("----------服务器异常------------》查看平台总收益 24");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 25 根据token 用户查看我的提现记录
     *
     * @param token     用户token值
     * @param page      当前页码
     * @param rows      每页显示数据条数
     * @param startTime 根据时间查询当前用户的记录
     * @param endTime   根据时间查询当前用户的记录
     * @return 活动提成记录数据封装结果
     */
    @GetMapping(value = "getMyPresentRecordByToken")
    public Result<UmoneyResult> getMyPresentRecordByToken(@RequestParam String token, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows, @RequestParam Date startTime, @RequestParam Data endTime) {
        logger.info("----------------------》用户查看我的提现记录 25");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》用户查看我的提现记录 25");
                return Result.error("206", "用户不存在");
            }
            //根据用户id查询当前用户的提现记录表
            UmoneyResult result = umoneyService.queryUmoneyListByUserAndTime(user, page, rows, startTime, endTime);
            return Result.success(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
        logger.error("----------服务器异常------------》用户查看我的提现记录 25");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 26 根据token 用户进行微信支付一元收款验证
     *
     * @param request request
     * @param token   token值
     * @param money   支付金额
     * @return 返回支付结果
     */
    @PostMapping(value = "userWeChatPaymentVerification")
    public Result<String> userWeChatPaymentVerification(HttpServletRequest request, @RequestParam String token, @RequestParam BigDecimal money) {
        logger.info("----------------------》微信支付一元收款验证 26");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》微信支付一元收款验证 26");
                return Result.error("206", "用户不存在");
            }
            //支付逻辑
            String json = WeiXinPayUtils.weixinpay(request, money, user);
            //将用户缴费状态设置为已缴费
            user.setIsPay(1);
            //更新数据库
            userService.updateSelective(user);
            return Result.success(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("----------服务器异常-----------------》微信支付一元收款验证 26");
        return Result.error("500", "服务器异常");
    }

    /**
     * 27 根据token值 添加支付记录
     *
     * @param token
     * @return 0 添加失败 1 添加成功
     */
    @PostMapping(value = "addPaymentFlowByToken")
    public Result<Integer> addProductOrderByToken(@RequestParam("token") String token, @RequestParam Paymentflow paymentflow) {
        logger.info("----------添加支付记录------------》添加支付记录 27");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》添加支付记录 27");
                return Result.error("206", "用户不存在");
            }
            //保存订单
            if (this.paymentflowService.saveSelectiveByUser(user, paymentflow) > 0) {
                return Result.success(Const.SUCCESS);
            }
            return Result.success(Const.FAIL);
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("----------服务器异常------------》添加支付记录 27");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 28 根据token 用户提现获取个人税率
     *
     * @param token 用户token值
     */
    @GetMapping(value = "getPersonalIncomeTaxByToken")
    public Result<Taxrevenue> getPersonalIncomeTaxByToken(@RequestParam String token) {
        logger.info("----------用户提现获取个人税率-----------------》用户提现获取个人税率 28");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》用户提现获取个人税率 28");
                return Result.error("206", "用户不存在");
            }
            Taxrevenue taxrevenue = new Taxrevenue();
            //查询当前税率
            taxrevenue.setTaxrevenueStatus(1);
            Taxrevenue result = taxrevenueService.queryOne(taxrevenue);
            return Result.success(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("----------服务器异常-----------------》用户提现获取个人税率 28");
        return Result.error("500", "服务器异常");
    }

    /**
     * 30 根据token 用户提现到零钱
     *
     * @param token token值
     * @param money 提现金额
     * @return map{
     * {state:success/Const.FAIL}
     * {payment_no:'支付成功后，微信返回的订单号'}
     * {payment_time:'支付成功的时间'}
     * {err_code:'支付失败后，返回的错误代码'}
     * {err_code_des:'支付失败后，返回的错误描述'}
     */
    @PostMapping(value = "userPutForwardByToken")
    public Result<Map<String, String>> userPutForwardByToken(@RequestParam String token, @RequestParam BigDecimal money, @RequestParam String taxrevenueId) {
        logger.info("----------用户提现到微信零钱-----------------》用户提现到微信零钱 30");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》用户提现到微信零钱 30");
                return Result.error("206", "用户不存在");
            }
            logger.info("----------用户提现到微信零钱-----------------》用户提现到微信零钱 30");
            //提现到微信零钱描述
            String desc = "易迅连_提现到零钱";
            //获取当前用户的可提现金额
            double isOkPutForwardMoney = userprofitService.queryUserIsPutForwardUserprofit(user);
            if (isOkPutForwardMoney > money.doubleValue()) {
                //执行提现操作
                Map<String, String> map = WeiXinPayUtils.transfer(user.getOpenId(), money, desc);
                if (ObjectUtil.isNotNull(map)) {
                    //保存至数据库中
                    umoneyService.saveSelectiveByBaseInfo(user, money, taxrevenueId, map);
                    return Result.success(map);
                }
                logger.error("----------用户提现出现异常-----------------》用户提现到微信零钱 30");
                return Result.error("用户提现出现异常", map);
            } else {
                logger.error("----------用户可提现金额不足-----------------》用户提现到微信零钱 30");
                return Result.error("403", "用户可提现金额不足");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 30 根据token 查看资源列表/关键字搜索资源列表
     *
     * @param token token值
     * @return
     */
    @GetMapping(value = "getMyResourcesByToken")
    public Result<ResourceListResult> getMyResourcesByToken(@RequestParam String token, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows, @RequestParam(required = false, defaultValue = "") String keyWord) {
        logger.info("----------用户查询我的资源列表------------》用户查询资源列表 30");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》用户查询资源列表 30");
                return Result.error("403", "用户不存在");
            }
            user = userService.queryById(user.getUserId());
            if (ObjectUtil.isEmpty(user.getUtypeId()) || "1".equals(user.getUtypeId()) || user.getIsVip() == 0) {
                return Result.error("206", "当前用户没有资源库", null);
            }
            logger.info("----------用户查询我的资源列表------------》用户查询资源列表 30", user);
            //查询当前用户资源库的资源列表数据
            ResourceListResult resourceListResult = userService.queryResourceListResult(user, page, rows, keyWord);
            return Result.success("200", "查询成功", resourceListResult);
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("----------用户查询我的资源列表------------》用户查询资源列表 30");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 30-1 根据token 高级搜索查询当前用户资源库中的爱好集合（匹配爱好与当前资源库中的用户的爱好数量）
     *
     * @param token token值
     * @return
     */
    @GetMapping(value = "getHobbyListInUserResourcesByToken")
    public Result<List<ObjectResult>> getHobbyListInUserResourcesByToken(@RequestParam String token) {

        logger.info("----------高级搜索查询当前用户资源库中的爱好集合------------》高级搜索查询当前用户资源库中的爱好集合 30-1");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》高级搜索查询当前用户资源库中的爱好集合 30-1");
                return Result.error("206", "用户不存在");
            }

            //查询爱好数据
            List<ObjectResult> objectResultList = userandhobbyService.queryListInUserResources(user);

            return Result.success(objectResultList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("----------高级搜索查询当前用户资源库中的爱好集合，服务器异常------------》高级搜索查询当前用户资源库中的爱好集合 30-1");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 31 根据token 高级搜索查询当前用户资源库中的曾经参与集合
     *
     * @param token token值
     * @return
     */
    @GetMapping(value = "getEverJoinListInUserResourcesByToken")
    public Result<List<ObjectResult>> getEverJoinListInUserResourcesByToken(@RequestParam String token) {
        logger.info("----------高级搜索查询当前用户资源库中的曾经参与集合------------》高级搜索查询当前用户资源库中的曾经参与集合 31");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》高级搜索查询当前用户资源库中的曾经参与集合 31");
                return Result.error("206", "用户不存在");
            }

            //查询曾经参与数据
            List<ObjectResult> objectResultList = everjoinService.queryEverJoinListInUserResources(user);

            return Result.success(objectResultList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("----------高级搜索查询当前用户资源库中的曾经参与集合，服务器异常------------》高级搜索查询当前用户资源库中的曾经参与集合 31");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 32 根据token 高级搜索查询当前用户资源库中的个人需求集合
     *
     * @param token token值
     * @return
     */
    @GetMapping(value = "getUserNeedsListInUserResourcesByToken")
    public Result<List<ObjectResult>> getUserNeedsListInUserResourcesByToken(@RequestParam String token) {
        logger.info("----------高级搜索查询当前用户资源库中的个人需求集合------------》高级搜索查询当前用户资源库中的爱好集合 32");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》高级搜索查询当前用户资源库中的个人需求集合 32");
                return Result.error("206", "用户不存在");
            }

            //查询曾经参与数据
            List<ObjectResult> objectResultList = userandpersonalneedsService.queryUserNeedsListInUserResources(user);

            return Result.success(objectResultList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("----------高级搜索查询当前用户资源库中的个人需求集合，服务器异常------------》高级搜索查询当前用户资源库中的爱好集合 32");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 33 根据token 通过指定字段高级搜索查询资源列表
     *
     * @param token token值
     * @return
     */
    @PostMapping(value = "getResourcesByToken")
    public Result<List<User>> getMyResourcesByToken(@RequestParam String token, Map<Object, Object> maps) {

        //需要传到后台的参数  Date birthdayStart, Date birthdayEnd, Integer sex, String memberid,String citycode, String  hobbyId, String everjoinId, String personalneedsId

        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》用户高级搜索我的资源列表 33");
                return Result.error("206", "用户不存在");
            }
            /*---------------------------------------------------------------------------------------*/

            logger.info("----------用户高级搜索我的资源列表------------》用户高级搜索我的资源列表 33");
            //通过关键字高级搜索当前用户资源库的资源列表数据
            List<User> resourceListResult = userService.queryResourceListResultByAdvancedSearch(user, maps);
            return Result.success(resourceListResult);
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("----------用户高级搜索我的资源列表，服务器异常------------》用户高级搜索我的资源列表 33");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 33-1 根据token 自动匹配资源与活动
     *
     * @param token token值
     * @return
     */
    @GetMapping(value = "autoMatchingResourcesByToken")
    public Result<List<ActivityResult>> autoMatchingResourcesByToken(@RequestParam String token) {

        //需要传到后台的参数  Date birthdayStart, Date birthdayEnd, Integer sex, String memberid,String citycode, String  hobbyId, String everjoinId, String personalneedsId

        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            logger.error("----------token值不正确------------》自动匹配资源与活动 33-1");
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》自动匹配资源与活动 33-1");
                return Result.error("206", "用户不存在");
            }
            /*---------------------------------------------------------------------------------------*/

            //通过自动匹配当前用户资源库的资源与活动列表数据
            List<ActivityResult> result = activityService.queryActivityListByUser(user);
            return Result.success(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("----------服务器异常------------》自动匹配资源与活动 33-1");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 33-2 根据token 根据多个用户id查询出对应的对象
     *
     * @param token token值
     * @return
     */
    @PostMapping(value = "getUserListByTokenAndUids")
    public Result<List<User>> getUserListByTokenAndUids(@RequestParam String token, @RequestParam List<String> uids) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            logger.error("----------用户为空------------》根据多个用户id查询出对应的对象 33-2");
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》根据多个用户id查询出对应的对象 33-2");
                return Result.error("206", "用户不存在");
            }
            /*---------------------------------------------------------------------------------------*/

            if (ObjectUtil.isNotNull(uids)) {
                List<User> result = userService.queryByIds(uids);
                return Result.success(result);
            }
            logger.error("----------参数为空------------》根据多个用户id查询出对应的对象 33-2");
            return Result.error("403", "参数异常");
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("----------服务器异常------------》根据多个用户id查询出对应的对象 33-2");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /*----------------------------资源攻略------------------------------------*/

    /**
     * 34 根据token 用户提交反馈建议
     *
     * @param token          token值
     * @param feedbackadvice 建议信息
     * @return 返回 0提交失败 1 提交成功
     */
    @PostMapping(value = "setFeedbackAdviceByToken")
    public Result<Integer> setFeedbackAdviceByToken(@RequestParam String token, Feedbackadvice feedbackadvice) {
        logger.info("----------用户提交反馈建议------------》用户提交反馈建议 34");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》用户提交反馈建议 34");
                return Result.error("206", "用户不存在");
            }

            /*-----------------------逻辑代码-----------------------------------*/
            //初始化反馈建议数据并保存至数据库中
            if (feedbackadviceService.saveSelective(feedbackadvice.init()) > 0) {
                return Result.success(Const.SUCCESS);
            }
            return Result.success(Const.FAIL);
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("----------用户提交反馈建议，服务器异常------------》用户提交反馈建议 34");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 35 根据token 查看资源攻略
     *
     * @param token
     * @return
     */
    @GetMapping(value = "getResourceStrategyByToken")
    public Result<Systembulletin> getResourceStrategyByToken(@RequestParam String token) {
        logger.info("----------用户查看资源攻略------------》查看资源攻略 35");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》查看资源攻略 35");
                return Result.error("206", "用户为空");
            }

            /*-----------------------逻辑代码-----------------------------------*/
            Systembulletin systembulletin = new Systembulletin();
            systembulletin.setSystemStatus(Const.RESOURCE_STRATEGY);
            systembulletin = systembulletinService.queryOne(systembulletin);
            return Result.success("200", "查询成功", systembulletin);

        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("----------查看资源攻略，服务器异常------------》查看资源攻略 35");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 36 根据token 用户体验vip客户经理
     *
     * @param token
     * @return 0 体验失败 1 体验成功
     */
    @GetMapping(value = "userExperienceVipByToken")
    public Result<Integer> userExperienceVipByToken(@RequestParam String token) {
        logger.info("----------用户体验vip------------》用户体验vip客户经理 36");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值不正确");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》用户体验vip客户经理 36");
                return Result.error("206", "用户不存在");
            }
            //获取当前用户的信息
            user = userService.queryById(user.getUserId());
            /*-----------------------逻辑代码-----------------------------------*/
            //排除封号、未激活 以及 已经体验过
            if (userService.checkUserIsOk(user, true)) {
                Date date = new Date();
                //通过枚举对象查询到等级类型
                Utype utype = utypeService.queryOne(UtypeEnum.VIP_experience_CUSTOMER_MANAGER.getUtypeId());
                if (ObjectUtil.isNull(utype)) {
                    return Result.error("207", "体验失败,体验vip数据异常");
                }
                Integer saveIsOk = userExperienceVipService.saveByUser(user, utype, date);
                if (saveIsOk > 0) {
                    user.setUtypeId(utype.getUtypeId());
                    user.setIsVip(1);
                    user.setUtypeName(utype.getUserType());
                    //设置用户为体验状态
                    user.setResourceStrategyIsexperience(1);
                    //设置体验开始时间
                    user.setExperienceTime(date);
                    //设置体验结束时间
                    String s = DateUtils.getAfterDayDate(utype.getUserDay());
                    Date date1 = DateUtils.fomatDateTime(s);
                    //添加会员过期任务
                    JobManage jobManage = new JobManage();
                    ScheduleJob scheduleJob = ScheduleJob.getsScheduleJob().toBuilder().jobDesc("用户体验vip").jobGroup("1").jobId(UuidUtil.get32UUID()).jobName(user.getuNickname() + "体验vip").jobStatus(1).cronExpression(com.yixunlian.entity.job.CronUtil.getCron(date1)).build();
                    //保存至数据库中
                    scheduleJobService.saveSelective(scheduleJob);
                    jobManage.addJob(scheduleJob);
                    user.setExperienceEndTime(date1);
                    //设置会员天数
                    user.setMemberDays(utype.getUserDay());
                    //保存至数据库
                    if (userService.updateSelective(user) > 0) {
                        logger.info("----------用户体验vip成功------------》用户体验vip客户经理 36");
                        return Result.success("200", "用户体验vip成功", Const.SUCCESS);
                    }
                    logger.error("----------用户体验vip失败------------》用户体验vip客户经理 36");
                    return Result.error("206", "用户体验vip失败");
                }
            }
            return Result.error("403", "用户无法体验（身份有误）");
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("----------用户体验vip失败  服务器异常------------》用户体验vip客户经理 36");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 36-1 根据token 查询或生成用户体验vip客户经理邀请二维码 每个用户都有分享二维码
     *
     * @param token
     * @return 返回生成的二维码路径
     */
    @GetMapping(value = "getUserExperienceVipQrcodeByToken")
    public Result<String> getUserExperienceVipQrcodeByToken(@RequestParam String token, HttpSession session) {
        logger.info("----------------------》查询或生成用户体验vip客户经理邀请二维码 36-1");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值不正确");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》查询或生成用户体验vip客户经理邀请二维码 36-1");
                return Result.error("403", "用户不存在");
            }
            if (user.getUserIsactivation() < 1) {
                return Result.error("206", "当前用户未注册");
            }
            /*-----------------------逻辑代码-----------------------------------*/
            Qrcode qrcode = qrcodeService.queryOneByUser(user);
            // 跳转页面地址
            String content = Const.DO_MAIN + "/wx/perCenter_zyGL_recieveInvitate.html?shareToken=" + token;
            // logo图片
            String imgPath = session.getServletContext().getRealPath("/") + "\\path\\156292698531720432.png";
            //存放地址
            String destPath = QRCodeUtil.QRCODE_PATH;
            //是否需要压缩
            boolean needCompress = true;
            //如果为空 则立即生成
            if (ObjectUtil.isNull(qrcode)) {
                String qrcodePath = QRCodeUtil.encode(content, imgPath, destPath, needCompress);
                //将数据保存至数据库
                qrcodeService.saveSelectiveByUserAndQrcodePath(user, qrcodePath);
                return Result.success("200", "获取成功", qrcodePath);
            }
            //判断文件是否存在
            if (new File(QRCodeUtil.QRCODE_PATH + qrcode.getQrcodeUrl()).exists()) {
                return Result.success("200", "获取成功", qrcode.getQrcodeUrl());
            } else { //如果文件不存在则立马生成
                qrcodeService.deleteById(qrcode.getQrcodeId());
                String qrcodePath = QRCodeUtil.encode(content, imgPath, destPath, needCompress);
                //将数据保存至数据库
                qrcodeService.saveSelectiveByUserAndQrcodePath(user, qrcodePath);
                return Result.success("200", "获取成功", qrcodePath);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("----------服务器异常------------》查询或生成用户体验vip客户经理邀请二维码 36-1");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 36-2 根据token 设置用户归属关系
     *
     * @param token
     * @return
     */
    @GetMapping(value = "userSetOwnershipRelationship")
    public Result<Integer> userSetOwnershipRelationship(@RequestParam String token, @RequestParam(defaultValue = "") String shareToken) {
        logger.info("\n用户设置归属关系{}，{}", token, shareToken);
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值不正确");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            logger.info("设置用户关系登录用户：" + user);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》设置用户归属关系 36-2");
                return Result.error("206", "用户不存在");
            }
            if ("".equals(shareToken) && token.equals(shareToken)) {
                return Result.error("207", "参数异常");
            }
            //分享的用户token
            String dataByKey = TokenUtils.getDataByKey(shareToken);
            User shareUser = null;
            if (ObjectUtil.isNotNull(dataByKey)) {
                shareUser = MAPPER.readValue(dataByKey, User.class);
            }
            //获取当前用户的信息
            user = userService.queryById(user.getUserId());
            try {
                if (ObjectUtil.isNull(shareUser)) {
                    return Result.error("208", "分享用户不存在");
                }
                if (ObjectUtil.isNull(user)) {
                    return Result.error("209", "用户未登录");
                }
                shareUser = userService.queryById(shareUser.getUserId());
                //设置归属关系
                Integer result = userService.setOwnershipRelationship(user, shareUser, sysUserService, roleService);
                if (result > 1) {
                    return Result.success("200", "设置成功");
                } else {
                    return Result.error("403", "设置失败");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("设置用户归属关系失败 36-2");
        }
        logger.error("----------服务器异常------------》设置用户归属关系 36-2");
        // 出错500
        return Result.success("500", "服务器异常");
    }

    /**
     * 37 根据token 用户查看系统帮助
     *
     * @param token
     * @return
     */
    @GetMapping(value = "getSystemHelpByToken")
    public Result<List<SystemHelp>> getSystemHelpByToken(@RequestParam String token) {
        logger.info("----------用户查看系统帮助------------》查看系统帮助 37");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》查看系统帮助 37");
                return Result.error("206", "用户不存在");
            }
            /*-----------------------逻辑代码-----------------------------------*/
            List<SystemHelp> systemHelps = systemHelpService.queryAll();
            return Result.success(systemHelps);
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("----------查看系统帮助，服务器异常------------》查看系统帮助 37");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 38 根据token   根据高级搜索查询的兴趣爱好/个人需求/曾经参与来匹配活动列表，在当前用户的资源库中查找（如果没有选择兴趣爱好/个人需求/曾经参与的其中一个都不进行查询）
     *
     * @param token
     * @return
     */
    @PostMapping(value = "getActivityByMapsAndToken")
    public Result<List<Activity>> getActivityByMapsAndToken(@RequestParam String token, @RequestParam(defaultValue = "") String hobbyId, @RequestParam(defaultValue = "") String everjoinId, @RequestParam(defaultValue = "") String personalneedsId) {

        //maps的参数  String  hobbyId, String everjoinId, String personalneedsId 三者之一
        Map<String, String> maps = new HashMap<>();
        maps.put("hobbyId", hobbyId);
        maps.put("everjoinId", everjoinId);
        maps.put("personalneedsId", personalneedsId);

        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》根据高级搜索查询的兴趣爱好/个人需求/曾经参与来匹配活动列表 38");
                return Result.error("403", "用户不存在");
            }
            /*---------------------------逻辑代码------------------------------------*/

            List<Activity> activityList = null;
            if (ObjectUtil.isNotNull(maps)) {
                activityList = activityService.queryListByMaps(maps);
                return Result.success("200", "获取成功", activityList);
            }
            //maps参数如果为空则说明不进行任何操作
            return Result.success("200", "获取成功", activityList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("---------服务器异常------------》根据高级搜索查询的兴趣爱好/个人需求/曾经参与来匹配活动列表 38");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 39 根据token 根据用户等级查询会员升级数据
     *
     * @param token
     * @return
     */
    @GetMapping(value = "getUtypeListToken")
    public Result<List<Utype>> getUtypeListToken(@RequestParam String token) {

        logger.info("----------------------》根据用户等级查询会员升级数据 39");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》根据用户等级查询会员升级数据 39");
                return Result.error("206", "用户不存在");
            }

            /*---------------------------------------------------------------------------------------*/

            //从数据库中查询出用户信息
            user = userService.queryById(user.getUserId());
            if (userService.checkUserIsOk(user, false)) {
                //匹配用户等级然后查询出要显示的数据
                List<Utype> utypes = utypeService.queryByUser(user);
                return Result.success(utypes);
            }
            logger.error("----------用户身份不合格------------》根据用户等级查询会员升级数据 39");
            return Result.error("403", "用户身份不合格");
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("----------服务器异常------------》根据用户等级查询会员升级数据 39");
        // 出错500
        return Result.error("500", "服务器异常");
    }






    /*---------------------------------资源共享-----------------------------------------*/

    /**
     * 40 根据token 用户升级等级
     *
     * @param token
     * @param utypeId
     * @return
     */
    @PostMapping(value = "userUpgradeVipByToken")
    public Result<Integer> userUpgradeVipByToken(@RequestParam String token, @RequestParam String utypeId) {

        logger.info("----------------------》用户升级为vip客户经理 40");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("------------用户不存在-----------------》用户升级为vip客户经理 40");
                return Result.error("206", "用户不存在");
            }

            /*------------------------------逻辑代码-----------------------------*/

            //从数据库中查询出用户信息
            user = userService.queryById(user.getUserId());
            //查询当前类型id是否存在
            Utype utype = utypeService.queryById(utypeId);
            if (ObjectUtil.isNotNull(utype)) {
                boolean result = userService.userUpgradeVip(user, utype);
                if (result) {
                    return Result.success(Const.SUCCESS);
                }
                return Result.success(Const.FAIL);
            }
            logger.error("---------当前类型id数据不存在-------------》用户升级为vip客户经理 40");
            return Result.error("403", "当前类型id数据不存在");
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("-----------服务器异常-----------》用户升级为vip客户经理 40");
        // 出错500
        return Result.error("500", "服务器异常");
    }



    /*----------------------------------分享赚钱----------------------------------------------*/

    /**
     * 41 根据token 查询满足条件的资源列表-资源共享(资源库大于200的会员列表)
     *
     * @param token
     * @param maps
     * @return
     */
    @PostMapping(value = "getUserListByKeywordsAndToken")
    public Result<List<ObjectResult>> getUserListByKeywordsAndToken(@RequestParam String token, @RequestParam Map<String, Object> maps) {
        //maps 应该包含的参数为：行业id egidId，区域 citycode，姓名 uNickname，会员号 memberid
        logger.info("----------------------》查询满足条件的资源列表-资源共享 41");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("-------------用户为空----------------》查询满足条件的资源列表-资源共享 41");
                return Result.error("206", "用户不存在");
            }

            /*---------------------------逻辑代码-----------------------------------*/

            List<ObjectResult> result = userService.getUserListByKeywords(user, maps, 200);
            return Result.success(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("-----------服务器异常-----------》查询满足条件的资源列表-资源共享 41");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 42 根据token 根据关键字查询设置了邀约提成的活动
     *
     * @param token
     * @param maps
     * @return
     */
    @PostMapping(value = "getActivityListByKeywordsAndToken")
    public Result<List<ActivityResult>> getActivityListByKeywordsAndToken(@RequestParam String token, @RequestParam Map<String, Object> maps) {
        //maps包含参数： 区域 citycode 活动类型（线上/线下） activity_type  活动费用（免费/收费）  activity_chargestatus
        logger.info("----------------------》查询设置了邀约提成的活动 42");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("-------------用户为空----------------》查询设置了邀约提成的活动 42");
                return Result.error("206", "用户不存在");
            }

            /*---------------------------逻辑代码-----------------------------------*/

            List<ActivityResult> result = activityService.queryActivityListByMaps(user, maps);
            return Result.success(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("-----------服务器异常-----------》查询设置了邀约提成的活动 42");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 43 根据token 用户查看分享活动给其他用户的报名情况(配置记录)
     *
     * @param token
     * @param activityId
     * @return
     */
    @GetMapping(value = "getUenrollandactivityDetailByToken")
    public Result<List<Uenrollandactivity>> getUenrollandactivityDetailByToken(@RequestParam String token, @RequestParam String activityId) {
        //maps包含参数： 区域 citycode 活动类型（线上/线下） activity_type  活动费用（免费/收费）  activity_chargestatus
        logger.info("----------------------》用户查看分享活动给用户的报名情况 43");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("-------------用户为空----------------》用户查看分享活动给用户的报名情况 43");
                return Result.error("206", "用户不存在");
            }

            /*---------------------------逻辑代码-----------------------------------*/

            List<Uenrollandactivity> result = activitysignService.queryActivitySignListByUidAndActivityId(user, activityId);
            return Result.success(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("-----------服务器异常-----------》用户查看分享活动给用户的报名情况 43");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 44 根据token 保存用户分享活动给其他用户记录
     *
     * @param token
     * @param activityId
     * @return
     */
    @PostMapping(value = "userShareActivityByToken")
    public Result<Integer> userShareActivityByToken(@RequestParam String token, @RequestParam String activityId, @RequestParam List<String> sendIds) {
        //sendIds： 为当前用户要分享活动给其他人的id
        logger.info("----------------------》用户分享活动给其他用户 44");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("-------------用户为空----------------》用户分享活动给其他用户 44");
                return Result.error("206", "用户不存在");
            }

            /*---------------------------逻辑代码-----------------------------------*/

            Integer result = getService.getShareService().savaByUserAndActivityIdAndSendIds(user, activityId, sendIds);
            return Result.success(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("-----------服务器异常-----------》用户分享活动给其他用户 44");
        // 出错500
        return Result.error("500", "服务器异常");
    }







    /*--------------------------------新闻------------------------------------------------------------*/

    /**
     * 45 根据token 生成活动链接模板  ？？？？
     *
     * @param token      token值
     * @param activityId 活动id
     * @return 返回活动链接
     */
    @PostMapping(value = "generateTemplateByTokenAndActivityId")
    public Result<String> generateTemplateByTokenAndActivityId(@RequestParam String token, @RequestParam String activityId) {
        //sendIds： 为当前用户要分享活动给其他人的id
        logger.info("----------------------》生成活动链接模板 45");
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("-------------用户为空----------------》生成活动链接模板 45");
                return Result.error("206", "用户不存在");
            }

            /*---------------------------逻辑代码-----------------------------------*/

            //String result = getService.getActivityService().generateTemplate(activityId, sendIds);
            return Result.success(null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.error("-----------服务器异常-----------》生成活动链接模板 45");
        // 出错500
        return Result.error("500", "服务器异常");
    }

    /**
     * 46 根据token 分页获取新闻列表
     *
     * @return 返回list
     */
    @GetMapping(value = "getJournalismListByToken")
    public Result<PageInfo<Journalism>> getJournalismListByToken(@RequestParam String token, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            logger.error("----------token值错误------------》分页获取新闻列表 46");
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》分页获取新闻列表 46");
                return Result.error("206", "用户不存在");
            }
            JournalismService j = getService.getJournalismService();
            PageInfo<Journalism> result = j.queryJournalismByWhere(page, rows);
            return Result.success(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("----------服务器异常------------》分页获取新闻列表 46");
        return Result.error("500", "服务器异常");
    }

    /* --------------------------------分享------------------------------------- */

    /**
     * 47 根据token 根据新闻id查询新闻详情
     *
     * @return 返回list
     */
    @GetMapping(value = "getJournalismByTokenAndId")
    public Result<Journalism> getJournalismListByToken(@RequestParam String token, @RequestParam String journalismId) {
        String data = TokenUtils.getDataByKey(token);
        if (ObjectUtil.isNull(data)) {
            logger.error("----------token值错误------------》根据新闻id查询新闻详情 47");
            // token不正确 返回204
            return Result.error("204", "token值错误");
        }
        try {
            User user = MAPPER.readValue(data, User.class);
            //用户为空返回403
            if (ObjectUtil.isNull(user)) {
                logger.error("----------用户为空------------》根据新闻id查询新闻详情 47");
                return Result.error("206", "用户不存在");
            }
            if (ObjectUtil.isNotNull(journalismId)) {
                JournalismService j = getService.getJournalismService();
                Journalism result = j.queryById(journalismId);
                return Result.success(result);
            }
            logger.error("----------journalismId为空------------》根据新闻id查询新闻详情 47");
            return Result.error("参数异常");
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 出错500
        logger.error("----------服务器异常------------》根据新闻id查询新闻详情 47");
        return Result.error("500", "服务器异常");
    }

    @GetMapping("/getParamter")
    public Result<JSONObject> getParamter(@RequestParam("url") String url) {
        JSONObject jo = WxUtil.getParameter(url);
        return Result.success("200", "获取成功", jo);
    }

    @RequestMapping(value = "getParamter1")
    public Result<JSONObject> getJsMethod(@RequestParam String token) {
        try {
            JSONObject jo = new JSONObject();
            String pageUrl = "http://yxl.lanzheng666.com/wx/perCenter_zyGongLue.html";
            //随机字符串
            String nonceStr = CommonUtil.createNoncestr(16);
            //时间
            String timeStamp = "" + System.currentTimeMillis();
            //获取全局access_token
            String access = rService.get("accessToken");
            if (ObjectUtil.isNull(access)) {
                access = WxUtil.getAccessToken();
            }
           /* //获取ticket
            String ur = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=" + access + "&type=jsapi";
            String users = HttpKit.get(ur);
            JSONObject obj = JSONObject.fromObject(users);
            String ticket = obj.getString("ticket");*/

            String postUrl = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=" + access;
            String param = "{\"expire_seconds\": 2592000, \"action_name\": \"QR_STR_SCENE\", \"action_info\": {\"scene\": {\"token\": " + token + "}}}";
            StringEntity entity = new StringEntity(param, "utf-8");
            HttpPost httpPost = new HttpPost(postUrl);
            HttpClient httpClient = new DefaultHttpClient();
            httpPost.setEntity(entity);
            HttpResponse response = httpClient.execute(httpPost);
            String str = EntityUtils.toString(response.getEntity(), "utf-8");
            org.json.JSONObject jsonObject2 = new org.json.JSONObject(str);
            String ticket = (String) jsonObject2.get("ticket");
            //进行签名算法
            String sign = "jsapi_ticket=" + ticket + "&noncestr=" + nonceStr + "&timestamp=" + timeStamp + "&url=" + pageUrl;
            sign = CommonUtil.SHA1(sign);
            jo.put("ticket", ticket);
            jo.put("appId", Const.APPID);
            jo.put("nonceStr", nonceStr);
            jo.put("timeStamp", timeStamp);
            jo.put("signature", sign);
            return Result.success("200", "成功", jo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Result.error("500", "服务器异常");
    }
}
