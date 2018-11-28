/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: TaskServiceImp
 * Author:   yuanyuana
 * Date:     2018/11/23 11:38
 * Description: job业务代码
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity.job;

import com.yixunlian.pojo.Activity;
import com.yixunlian.pojo.User;
import com.yixunlian.pojo.system.SysUser;
import com.yixunlian.service.ActivityService;
import com.yixunlian.service.UserService;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;
import org.apache.http.util.TextUtils;
import org.omg.CORBA.SystemException;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * 〈一句话功能简述〉<br>
 * 〈job业务代码〉
 *
 * @author yuanyuana
 * @create 2018/11/23
 * @since 1.0.0
 */
@Service
public class TaskServiceImpl implements TaskService {
    private Logger log = Logger.getLogger(this.getClass().getName());

    @Resource(name = "userService")
    private UserService userService;
    @Resource(name = "activityService")
    private ActivityService activityService;

    /**
     * 具体业务逻辑
     */
    @Override
    public void exe() {
        System.out.print("第一个任务");
    }

    /**
     * 会员到期任务
     */
    @Override
    public void memberexpires() {

    }

    /**
     * 检测活动状态每隔三分钟执行
     */
    @Scheduled(cron = "0 0/3 * * * ? ")
    public void activityStatusChangeTask() {
        Date now = new Date();//获取当前时间
//        List<YxlActivity> activitySnap = new ArrayList<>();//存储要变更活动

        //活动状态判断与定时修改
        List<Activity> activities = new ArrayList<>();
        try {
            //排除活动草稿，下架和活动结束状态
            activities = activityService.queryShelfActivity();
        } catch (Exception e) {
            log.log(Level.ALL, e.toString());
        }

        if (activities == null) {
            return;
        }
        for (Activity activity : activities) {
            //报名开始时间
            Date applyStartDt = activity.getActivitysignStarttime();
            //报名结束时间
            Date applyEndDt = activity.getActivitysignEndtime();
            //活动开始时间
            Date activityStartDt = activity.getActivitystartTime();
            //活动结束时间
            Date activityEndDt = activity.getActivityendTime();
            if (applyStartDt != null && (applyStartDt.getTime() > now.getTime())) {
                //待报名
                Activity act = new Activity();
                act.setActivitySignupstatus(0);
                act.setActivityId(activity.getActivityId());
                activityService.updateSelective(act);
            }
            if (applyEndDt != null && (applyEndDt.getTime() <= now.getTime())) {
                if (activityStartDt.getTime() > now.getTime()) {
                    //报名结束
                    Activity act = new Activity();
                    act.setActivitySignupstatus(2);
                    act.setActivityId(activity.getActivityId());
                    activityService.updateSelective(act);
                }
            }
            if (activityStartDt != null && (activityStartDt.getTime() <= now.getTime())) {
                if (activityEndDt.getTime() >= now.getTime()) {
                    //进行中
                    Activity act = new Activity();
                    act.setActivityStatus(1);
                    act.setActivityId(activity.getActivityId());
                    activityService.updateSelective(act);
                }
            }
            if (activityEndDt != null && (activityEndDt.getTime() <= now.getTime())) {
                //活动结束
                Activity act = new Activity();
                act.setActivityStatus(2);
                act.setActivityId(activity.getActivityId());
                activityService.updateSelective(act);
            }
            if (applyStartDt != null && applyEndDt != null && (applyStartDt.getTime() <= now.getTime())) {
                if (applyEndDt.getTime() >= now.getTime()) {
                    //报名中
                    Activity act = new Activity();
                    act.setActivitySignupstatus(1);
                    act.setActivityId(activity.getActivityId());
                    activityService.updateSelective(act);
                }
            }
        }

    }

    /**
     * 会员信息检测定时任务，包括会员等级，会员到期提醒
     * cron 表达式没晚0点执行
     */
    @Scheduled(cron = "0 0 0 * * ?")
    public void memberInfoCheckTask() {
        //创建线程池
        ExecutorService pool = Executors.newFixedThreadPool(20);
        //获取当前时间
        Date now = new Date();
        Integer dayNumber = 5;

        //修改会员等级
        List<User> yxlMembers = new ArrayList<>();
        try {
            yxlMembers = userService.queryMembers();
        } catch (Exception e) {
            log.log(Level.ALL, e.toString());
        }
        if (yxlMembers == null) {
            return;
        }
        for (User yxlMember : yxlMembers) {
            if (yxlMember.getTermOfTrial() != null && (yxlMember.getTermOfTrial().getTime() <= now.getTime()) && !"2".equals(yxlMember.getMemberLevelId())) {
                yxlMember.setMemberLevelId("2");
                //修改会员所属关系
                YxlMember memberSnap = new YxlMember();
                memberSnap.setMemberRootId(yxlMember.getMemberId());
                List<YxlMember> yxlMembers1 = new ArrayList<>();
                try {
                    yxlMembers1 = memberDao.selectClean(memberSnap);//获取当前会员下的所属会员 = memberDao.selectClean(null);
                } catch (Exception e) {
                    log.log(Level.ALL, e.toString());
                }
                String rootId = yxlMember.getMemberRootId();//获取当前会员的所属人Id
                //修改当前人下属的归属id
                if (yxlMembers1 != null) {
                    for (int m = 0; m < yxlMembers1.size(); m++) {
                        if (TextUtils.isEmpty(rootId)) {
                            yxlMembers1.get(m).setMemberRootId("");
                        } else {
                            yxlMembers1.get(m).setMemberRootId(rootId);
                        }
                    }
                    try {
                        if (yxlMembers1.size() > 0) {
                            memberDao.updateInBatch(yxlMembers1);//更新所属当前会员的 所有会员的所属关系
                        }
                    } catch (Exception e) {
                        log.log(Level.ALL, e.toString());
                    }
                }
                memberDao.updateById(yxlMember);
            }

            ///发送模板消息
            if (yxlMember.getTermOfTrial() != null) {
                GregorianCalendar calendar = new GregorianCalendar();
                calendar.setTime(yxlMember.getTermOfTrial());
                calendar.add(Calendar.DAY_OF_MONTH, -dayNumber);
                Date date = calendar.getTime();//获取当前时间前【dayNumber】天，dayNumber为续费提前提醒天数
                if (date.getTime() <= now.getTime()) {
                    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                    //发送模板消息
                    SendWXMsg target = new SendWXMsg("ab1", yxlMember.getMemberId(), format.format(yxlMember.getTermOfTrial()), WxMsgTypeConfigure.SERVICEWILLEXPIRED.getType(), memberDao, userDao);
                    pool.submit(target);
                }
            }
        }

    }

    //会议提醒每隔一小时执行一次
    @Scheduled(cron = "0 0 0/1 * * ?")
    public void activityRemindTask() throws SystemException {
        GregorianCalendar calendar = new GregorianCalendar();
        YxlActivityApplication query = new YxlActivityApplication();
        query.setOtherWhereClause("_YxlActivityApplication.activityId in (select activityId from YxlActivity where activityStatus in (30,40,50))");
        List<YxlActivityApplication> applications = new ArrayList<>();
        applications = activityApplicationDao.selectClean(query);
        for (YxlActivityApplication app : applications) {
            YxlActivity activity = activityDao.selectCleanById(app.getActivityId());
            Date startDt = activity.getActivityStartDt();
            calendar.setTime(startDt);
            //活动开始时间前24小时提醒
            calendar.add(Calendar.HOUR_OF_DAY, -24);
            GregorianCalendar calendarNow = new GregorianCalendar();
            Date now = new Date();
            calendarNow.setTime(now);
            int ac = calendarNow.get(Calendar.HOUR_OF_DAY);
            int nowHour = calendar.get(Calendar.HOUR_OF_DAY);
            if (calendarNow.get(Calendar.HOUR_OF_DAY) == calendar.get(Calendar.HOUR_OF_DAY) && calendarNow.get(Calendar.DAY_OF_YEAR) == calendar.get(Calendar.DAY_OF_YEAR)) {
                //发送微信模板消息
                sendActivityMindMessage("ab1", app.getApplicationUserId(), activity);
            }
        }
    }

    private void sendActivityMindMessage(String senderId, String receiveId, Activity activity) throws SystemException {
        if ("off".equals(SystemProperty.getSystemProperty().getProperty("wx.model.message.mode"))) {
            System.out.println("-----------------------微信模板消息功能未打开------------------------");
            return;
        }
        if (TextUtils.isEmpty(senderId) || TextUtils.isEmpty(receiveId)) {
            return;
        }

        Token token = WxConfigUtil.getTokenTicket(ContentValues.TOKEN);
        if (token == null || TextUtils.isEmpty(token.getToken())) {
            token = WxConfigUtil.getToken(ContentValues.APPID, ContentValues.SECRET, System.currentTimeMillis());
        }

        String url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=" + token.getToken();
        //添加参数
        YxlMember yxlMember;
        SysUser senderUser = new SysUser();
        SysUser receiveUser = new SysUser();
        String receiveOpenId = "";
        String userName = "";
        try {
            yxlMember = memberDao.selectCleanById(receiveId);
            receiveOpenId = yxlMember.getOpenId();
            receiveUser = userDao.selectCleanById(yxlMember.getUserId());
            userName = receiveUser.getUserName();
            senderUser = userDao.selectCleanById(senderId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (senderUser == null || TextUtils.isEmpty(receiveOpenId)) {
            return;
        }
        /**
         *亲爱的xxx用户您好，您有报名参加的会议将在24小时后开始。
         会议主题：xxx
         会议时间：XXXX年xx月xx日 xx：xx
         会议地点：xxx
         请您提前安排好时间，准时参加。
         */
        Map<String, Object> map = new HashMap<>();
        Map<String, Object> dataMap = new HashMap<>();
        String title = "亲爱的" + userName + "用户您好，您有报名参加的会议将在24小时后开始";

        map.put("touser", receiveOpenId);
        map.put("template_id", "ykrJfhok9CDiTw_tHOb8MDJmlrhkvYwKjdkv6h0DyMQ");
        map.put("url", "http://m.yxl58.com/mobileApp.do#/wx/activityDetail/" + activity.getActivityId() + "/");
        Map<String, Object> firstMap = new HashMap<>();

        firstMap.put("value", title);
        firstMap.put("color", "#173177");
        Map<String, Object> keyword1Map = new HashMap<>();
        keyword1Map.put("value", activity.getActivityName());
        keyword1Map.put("color", "#173177");
        Map<String, Object> keyword2Map = new HashMap<>();
        keyword2Map.put("value", activity.getActivityStartDtString());
        keyword2Map.put("color", "#173177");
        Map<String, Object> keyword3Map = new HashMap<>();
        keyword3Map.put("value", activity.getActivityAddress());
        keyword3Map.put("color", "#173177");

        Map<String, Object> remarkMap = new HashMap<>();
        remarkMap.put("value", "请您提前安排好时间，准时参加");
        remarkMap.put("color", "#173177");
        dataMap.put("first", firstMap);
        dataMap.put("Topic", keyword1Map);
        dataMap.put("Time", keyword2Map);
        dataMap.put("Address", keyword3Map);
        dataMap.put("remark", remarkMap);
        map.put("data", dataMap);
        JSONObject jsonObject = JSONObject.fromObject(map);
        WxConfigUtil.httpRequest(url, "POST", jsonObject.toString());
        System.out.printf(" 微信发送成功");
    }

}
