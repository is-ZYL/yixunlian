/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: EngagendustryService
 * Author:   yuanyuana
 * Date:     2018/9/27 18:24
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.github.abel533.entity.Example;
import com.yixunlian.mapper.EngagendustryMapper;
import com.yixunlian.pojo.Engagendustry;
import com.yixunlian.service.baseservice.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/9/27
 * @since 1.0.0
 */
@Service
public class EngagendustryService extends BaseService<Engagendustry> {

    @Resource(name = "engagendustryMapper")
    private EngagendustryMapper engagendustryMapper;

    /**
     * 批量获取行业数据
     *
     * @return
     */
    public List<Engagendustry> queryAllListByDESC() {
        Example example = new Example(Engagendustry.class);
        example.setOrderByClause("created DESC ");
        return this.engagendustryMapper.selectByExample(example);
    }
}
