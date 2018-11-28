/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: MemberupdateextractService
 * Author:   yuanyuana
 * Date:     2018/10/18 13:54
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.yixunlian.mapper.MemberupdateextractMapper;
import com.yixunlian.pojo.Memberupdateextract;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/10/18
 * @since 1.0.0
 */
@Service
public class MemberupdateextractService extends BaseService<Memberupdateextract> {

    @Resource(name = "memberupdateextractMapper")
    private MemberupdateextractMapper meMapper;

    /**
     * 根据等级id查询用户用户升级归属人提成情况
     *
     * @param utypeId
     * @return
     */
    public Memberupdateextract queryOneByUtypeId(String utypeId) {
        Memberupdateextract m = Memberupdateextract.getMemberupdateextract();
        m.setMemberUpdateExtractType(0);
        m.setTypeId(utypeId);
        return super.queryOne(m);
    }
}
