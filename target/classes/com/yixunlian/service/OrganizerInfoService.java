/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: OrganizerInfoService
 * Author:   yuanyuana
 * Date:     2018/10/19 10:31
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import util.myutils.ObjectUtil;
import com.yixunlian.mapper.OrganizerInfoMapper;
import com.yixunlian.pojo.OrganizerInfo;
import com.yixunlian.pojo.User;
import com.yixunlian.service.baseservice.BaseService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import util.myutils.file.FileNameUtil;
import util.myutils.file.FileUpload;

import javax.annotation.Resource;
import java.io.IOException;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/10/19
 * @since 1.0.0
 */
@Service
@Slf4j
public class OrganizerInfoService extends BaseService<OrganizerInfo> {

    @Resource(name = "organizerInfoMapper")
    private OrganizerInfoMapper organizerInfoMapper;

    /**
     * 根据用户查询活动主办方信息
     *
     * @param u
     * @return
     */
    public OrganizerInfo queryOneByUser(User u) {
        OrganizerInfo o = OrganizerInfo.getcInstance().toBuilder().userId(u.getUserId()).build();
        return super.queryOne(o);
    }

    /**
     * 根据用户id查询主办方信息
     *
     * @param userId
     * @return
     */
    public OrganizerInfo queryOneByUId(String userId) {
        OrganizerInfo o = OrganizerInfo.getcInstance().toBuilder().userId(userId).build();
        return super.queryOne(o);
    }

    /**
     * 保存活动主办方信息
     *
     * @param u
     * @param organizerInfo
     * @return
     */
    public Integer saveByOrganizerInfo(User u, OrganizerInfo organizerInfo) throws IOException {
        log.info("保存主办方信息[{},{}]", u, organizerInfo);
        OrganizerInfo o = OrganizerInfo.getcInstance();
        o.init();
        //获取头像
        String headUrl = getHeadUrl(u, organizerInfo.getHeadUrl());
        o.setHeadUrl(headUrl);
        o.setDetailInfo(organizerInfo.getDetailInfo());
        o.setName(organizerInfo.getName());
        o.setUserId(u.getUserId());
        o.setPhone(organizerInfo.getPhone());
        return super.saveSelective(o);
    }

    /**
     * 更新活动主办方信息
     *
     * @param u
     * @param o
     * @return
     */
    public Integer updateByOrganizerInfo(User u, OrganizerInfo o) throws IOException {
        //获取头像
        String headUrl = getHeadUrl(u, o.getHeadUrl());
        o.setHeadUrl(headUrl);
        return super.updateSelective(o);
    }

    /**
     * 判断主办方头像是否为空 ，不为空将临时文件夹中的文件保存至真实路径中去
     * 为空则拿取用户信息中的头像
     * {
     * changeHeadUrl为空就直接拿取用户默认的微信头像
     * }
     *
     * @param u       用户信息
     * @param headUrl 头像
     * @return 返回头像路径
     * @throws IOException
     */
    private String getHeadUrl(User u, String headUrl) throws IOException {
        String toPath = "c:\\file\\img\\orginHead\\";
        if (ObjectUtil.isNotNull(headUrl)) {
            //判断是否是网络图片
            if (headUrl.contains("http") || headUrl.contains("https")) {
                //将网站上面的图片下载至本地
                headUrl = FileUpload.getHtmlPicture(headUrl, toPath, FileNameUtil.getRandomFileName() + ".jpg");
            } else {
                headUrl = FileUpload.copyFile(headUrl, toPath);
            }
        } else if (ObjectUtil.isNotNull(u.getChangeHeadUrl())) {
            headUrl = u.getChangeHeadUrl();
        } else {
            headUrl = FileUpload.getHtmlPicture(u.getHeadUrl(), toPath, FileNameUtil.getRandomFileName() + ".jpg");
        }
        return headUrl;
    }

}
