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
import com.yixunlian.mapper.TransactionItemMapper;
import com.yixunlian.pojo.Activity;
import com.yixunlian.pojo.TransactionItem;
import com.yixunlian.pojo.User;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.stereotype.Service;
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
public class TransactionItemService extends BaseService<TransactionItem> {

    @Resource(name = "transactionItemMapper")
    private TransactionItemMapper transactionItemMapper;
    @Resource(name = "activityService")
    private ActivityService activityService;

    /**
     * 保存用户成交信息
     *
     * @param transactionItems 成交信息
     * @return 返回保存结果
     */
    public Result<Integer> saveSelectiveByTransactionItemList(User u, List<TransactionItem> transactionItems) {
        //保存成交信息条数
        Integer count = 0;
        //总成交金额
        BigDecimal money = new BigDecimal(0);
        if (transactionItems.size() == 0) {
            return Result.error("403", "数据异常,用户成交信息为空");
        }
        Activity activity = activityService.queryOneById(transactionItems.get(0).getActivityId());
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
        for (TransactionItem t : transactionItems) {
            //根据用户id与活动id查询成交信息 为空则添加，否则不允许添加
            TransactionItem tran = super.queryOne(new TransactionItem().toBuilder().userId(t.getUserId()).activityId(activity.getActivityId()).build());
            if (ObjectUtil.isNull(tran)) {
                count += super.saveSelective(new TransactionItem().toBuilder()
                        .activityId(activity.getActivityId())
                        .transactionItemId(UuidUtil.get32UUID())
                        .userId(t.getUserId())
                        .status(0)
                        .transactionItemMoney(t.getTransactionItemMoney())
                        .transactionItemName(t.getTransactionItemName()).build());
                //计算当前用户的提成
                money = money.add(t.getTransactionItemMoney());
            } else {
                return Result.error("406", "当前用户已经设置成交信息,不允许重复提交");
            }

        }
        //计算当前用户的提成
        if (!money.equals(0)) {

        }
        return count == 0 ? Result.<Integer>error("206", "保存失败") : Result.success("保存成功", count);
    }

    /**
     * 根据活动id查询用户成交信息
     *
     * @param userId
     * @param activityId
     * @return
     */
    public List<TransactionItem> queryListByUidAndActivityId(String userId, String activityId) {
        return super.queryListByWhere(new TransactionItem().toBuilder().activityId(activityId).userId(userId).build());
    }
}
