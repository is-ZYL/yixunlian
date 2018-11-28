/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: QrcodeService
 * Author:   yuanyuana
 * Date:     2018/10/12 20:15
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.yixunlian.mapper.QrcodeMapper;
import com.yixunlian.pojo.Qrcode;
import com.yixunlian.pojo.User;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/10/12
 * @since 1.0.0
 */
@Service
public class QrcodeService extends BaseService<Qrcode> {

    @Resource(name = "qrcodeMapper")
    private QrcodeMapper qrcodeMapper;

    /**
     * 根据用户查询vip客户经理邀请码对象
     *
     * @param user
     * @return
     */
    public Qrcode queryOneByUser(User user) {
        Qrcode qrcode = Qrcode.getQrcode();
        qrcode.setQrcodeUserId(user.getUserId());
        //设置为vip客户经理邀请码类型
        qrcode.setQrcodeType(1);
        return super.queryOne(qrcode);
    }

    /**
     * 根据用户id和二维码路径保存至数据库
     *
     * @param user
     * @param qrcodePath
     * @return
     */
    public Integer saveSelectiveByUserAndQrcodePath(User user, String qrcodePath) {
        Qrcode qrcode1 = Qrcode.getQrcode().init();
        qrcode1.setQrcodeUserId(user.getUserId());
        //设置为体验vip客户经理邀请二维码类型
        qrcode1.setQrcodeType(1);
        qrcode1.setQrcodeUrl(qrcodePath);
        return super.saveSelective(qrcode1);
    }
}
