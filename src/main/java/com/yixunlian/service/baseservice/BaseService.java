package com.yixunlian.service.baseservice;

import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yixunlian.pojo.BasePojo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.abel533.mapper.Mapper;

import java.util.Date;
import java.util.List;

@Service
public abstract class BaseService<T extends BasePojo> {

    // spring3不一样

    // spring4可以这样注入 泛型注入

    @Autowired
    private Mapper<T> mapper;

    /**
     * 通过主键查询内容
     *
     * @param id
     * @return
     */
    public T queryById(Long id) {
        return this.mapper.selectByPrimaryKey(id);
    }

    public T queryById(String id) {
        return this.mapper.selectByPrimaryKey(id);
    }

    public T queryById(Integer id) {
        return this.mapper.selectByPrimaryKey(id);
    }

    /**
     * 查询所有数据
     *
     * @return
     */
    public List<T> queryAll() {
        return this.mapper.select(null);
    }

    /**
     * 根据条件查询一条数据
     *
     * @return
     */
    public T queryOne(T record) {
        return this.mapper.selectOne(record);
    }

    /**
     * 根据条件查询一个列表
     *
     * @return
     */
    public List<T> queryListByWhere(T record) {
        return this.mapper.select(record);
    }

    /**
     * 倒序排序
     *
     * @param record
     * @return
     */
    public List<T> queryListByWhereDesc(T record) {
        Example example = new Example(record.getClass());
        example.setOrderByClause("created DESC");
        return this.mapper.selectByExample(example);
    }

    /**
     * 去重
     *
     * @param record
     * @return
     */
    public List<T> queryDistinctListByWhere(T record) {
        Example example = new Example(record.getClass());
        example.setDistinct(true);
        return this.mapper.selectByExample(example);
    }

    /**
     * 分页查询数据列表
     *
     * @return
     */
    public PageInfo<T> queryPageListByWhere(Integer page, Integer rows, T record) {
        PageHelper.startPage(page, rows);
        List<T> list = this.mapper.select(record);
        return new PageInfo<>(list);
    }

    /**
     * 倒序排序
     *
     * @param page
     * @param rows
     * @param record
     * @return
     */
    public PageInfo<T> queryPageListByWhereDesc(Integer page, Integer rows, T record) {
        PageHelper.startPage(page, rows);
        Example example = new Example(record.getClass());
        example.setOrderByClause("created DESC ");
        List<T> list = this.mapper.selectByExample(example);
        return new PageInfo<T>(list);
    }

    /**
     * sava 返回修改的条数 需要返回创建的时间 让T继承BasePojo 就可以设置值了
     */
    public Integer save(T t) {
        t.setCreated(new Date());
        // 这样设置两个时间就一样了
        t.setUpdated(t.getCreated());
        return this.mapper.insert(t);
    }

    /**
     * 有选择的保存 选择不为null的字段作为插入字段 让T继承BasePojo 就可以设置值了
     */
    public Integer saveSelective(T t) {
        t.setCreated(new Date());
        // 这样设置两个时间就一样了
        t.setUpdated(t.getCreated());
        return this.mapper.insertSelective(t);
    }

    /**
     * update 返回修改的条数 需要返回创建的时间 让T继承BasePojo 就可以设置值了
     */
    public Integer update(T t) {
        // 这样设置两个时间就一样了
        t.setUpdated(new Date());
        return this.mapper.updateByPrimaryKey(t);
    }

    /**
     * 有选择的更新 选择不为null的字段作为插入字段 让T继承BasePojo 就可以设置值了
     */
    public Integer updateSelective(T t) {
        t.setUpdated(new Date());
        return this.mapper.updateByPrimaryKeySelective(t);
    }

    /**
     * 根据主键删除记录
     *
     * @param id
     * @return
     */
    public Integer deleteById(Long id) {
        return this.mapper.deleteByPrimaryKey(id);
    }

    /**
     * 根据主键删除记录
     *
     * @param id
     * @return
     */
    public Integer deleteById(String id) {
        return this.mapper.deleteByPrimaryKey(id);
    }

    /**
     * 批量删除
     *
     * @param clazz
     * @param property
     * @param values
     * @return
     */
    public Integer deleteByIds(Class<T> clazz, String property, List<Object> values) {
        Example example = new Example(clazz);
        example.createCriteria().andIn(property, values);
        return this.mapper.deleteByExample(example);
    }

    /**
     * 批量删除
     *
     * @param ids
     */
    public void deleteByIds(String ids) {
        String[] paramList = StringUtils.split(ids, ",");
        for (String id : paramList) {
            Long idL = Long.parseLong(id);
            deleteById(idL);
        }
    }

    /**
     * 根据条件删除数据
     *
     * @param record
     * @return
     */
    public Integer deleteByWhere(T record) {
        return this.mapper.delete(record);
    }

    /**
     * 查询总记录数
     *
     * @param record
     * @return
     */
    public Integer queryTotalCount(T record) {

        return this.mapper.selectCount(record);
    }

}
