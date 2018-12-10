/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: TransactionItemService
 * Author:   yuanyuana
 * Date:     2018/12/7 14:09
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.yixunlian.entity.Result;
import com.yixunlian.entity.UserTransactionInfo;
import com.yixunlian.mapper.TransactionItemMapper;
import com.yixunlian.pojo.*;
import com.yixunlian.service.baseservice.BaseService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import util.myutils.BigDecimalUtils;
import util.myutils.ObjectUtil;
import util.myutils.UuidUtil;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/12/7
 * @since 1.0.0
 */
@Service
@Slf4j
public class TransactionItemService extends BaseService<TransactionItem> {

    @Resource(name = "transactionItemMapper")
    private TransactionItemMapper transactionItemMapper;
    @Resource(name = "activityService")
    private ActivityService activityService;
    @Resource(name = "uenrollandactivityService")
    private UenrollandactivityService uen;

    /**
     * 保存用户成交信息
     *
     * @param userTransactionInfo 成交信息
     * @return 返回保存结果
     */
    public Result<Integer> saveSelectiveByTransactionItemList(User u, UserTransactionInfo userTransactionInfo) {

        List<TransactionItem> transactionItems = userTransactionInfo.getTransactionItems();

        String userId = userTransactionInfo.getUserId();
        String activityId = userTransactionInfo.getActivityId();

        if (ObjectUtil.isEmpty(userId) || ObjectUtil.isEmpty(activityId)) {
            return Result.error("403", "活动参数/用户异常", 0);
        }

        log.info("用户成交信息{}", userTransactionInfo);
        Uenrollandactivity uen = this.uen.queryOne(Uenrollandactivity.getUenrollAndActivity().toBuilder().userId(userId).activityId(activityId).status(0).build());
        log.info("报名用户信息{}", uen);

        if (ObjectUtil.isNull(uen)) {
            return Result.error("404", "报名用户信息异常", 0);
        }

        if (1 == uen.getIsOperation()) {
            return Result.error("403", "不允许重复修改客户信息", 0);
        }

        /*-------------------------------------主办发设置用户未成交状态-------------------------------------*/

        //主办发设置当前用户为未成交状态
        if (null != userTransactionInfo.getDealStatus() && userTransactionInfo.getDealStatus() == 0) {
            Uenrollandactivity build = Uenrollandactivity.getUenrollAndActivity().toBuilder().uandactivityenrollId(uen.getUandactivityenrollId()).userId(userId).activityId(activityId).dealStatus(1).status(0).isOperation(1).build();
            Integer result = this.uen.updateSelective(build);
            return result == 0 ? Result.<Integer>error("206", "保存失败") : Result.success("保存成功", result);
        }

        /*-------------------------------------主办发设置用户成交信息-------------------------------------*/

        //保存成交信息条数
        Integer count = 0;
        //总成交金额
        BigDecimal money = new BigDecimal(0);
        if (transactionItems.size() == 0) {
            return Result.error("403", "数据异常,用户成交信息为空");
        }
        Activity activity = activityService.queryOneById(activityId);
        if (ObjectUtil.isNull(activity)) {
            return Result.error("404", "活动异常,找不到活动数据");
        }
        if (activity.getOnlineStatus() == 4) {
            return Result.error("403", "活动异常,活动还未发布");
        }
        if (activity.getOnlineStatus() == 3) {
            return Result.error("403", "活动异常,活动已被平台下架");
        }
        //活动未结束不允许修改
        if (activity.getActivityStatus() != 2) {
            return Result.error("403", "活动未结束");
        }
        //根据用户id与活动id查询成交信息 为空则添加，否则不允许添加
        List<TransactionItem> tran = super.queryListByWhere(new TransactionItem().toBuilder().userId(userId).activityId(activityId).build());
        log.info("测试成交信息{}" + tran);
        if (ObjectUtil.isNull(tran) || tran.isEmpty()) {
            for (TransactionItem t : transactionItems) {
                count += super.saveSelective(new TransactionItem().toBuilder()
                        .activityId(activityId)
                        .transactionItemId(UuidUtil.get32UUID())
                        .userId(userId)
                        .status(0)
                        .transactionItemMoney(t.getTransactionItemMoney())
                        .transactionItemName(t.getTransactionItemName()).build());
                //计算当前用户的提成
                money = money.add(t.getTransactionItemMoney());
            }
        } else {
            return Result.error("406", "当前用户已经设置成交信息,不允许重复提交");
        }
        log.info("money总金额为：{}", money);
        //计算当前用户的提成
        BigDecimal amount = BigDecimalUtils.safeMultiply(money, activity.getRoyaltyRatio());
        //更改客户状态
        Uenrollandactivity build = uen.toBuilder().uandactivityenrollId(uen.getUandactivityenrollId()).dealStatus(1).transactionNum(money).paymentNum(amount).paymentStatus(0).isOperation(1).build();
        Integer result = this.uen.updateSelective(build);
        return count == 0 && result == 0 ? Result.<Integer>error("206", "保存失败") : Result.success("保存成功", count);
    }

    /**
     * 根据活动id查询用户成交信息
     *
     * @param userId
     * @param activityId
     * @return
     */
    public List<TransactionItem> queryListByUidAndActivityId(String userId, String activityId) {
        TransactionItem transactionItem = new TransactionItem().toBuilder().activityId(activityId).userId(userId).status(0).build();
        return super.queryListByWhere(transactionItem);
    }
}
