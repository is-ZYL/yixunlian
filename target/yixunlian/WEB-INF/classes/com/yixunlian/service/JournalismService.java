/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: JournalismService
 * Author:   yuanyuana
 * Date:     2018/10/16 17:41
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yixunlian.mapper.JournalismMapper;
import com.yixunlian.pojo.Journalism;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/10/16
 * @since 1.0.0
 */
@Service
public class JournalismService extends BaseService<Journalism> {

    @Resource(name = "journalismMapper")
    private JournalismMapper journalismMapper;

    public PageInfo<Journalism> queryJournalismByWhere(Integer page, Integer rows) {
        return super.queryPageListByWhereDesc(page, rows, new Journalism());
    }
}
