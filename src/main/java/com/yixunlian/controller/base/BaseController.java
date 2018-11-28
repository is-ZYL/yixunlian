package com.yixunlian.controller.base;

import util.myutils.UuidUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import util.PageData;

import javax.servlet.http.HttpServletRequest;

/**
 * @author FH Q728971035
 * 修改时间：2015、12、11
 */
public class BaseController {

    private static final long serialVersionUID = 6357869213649815390L;
    public final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * new PageData对象
     *
     * @return
     */
    public PageData getPageData() {
        return new PageData(this.getRequest());
    }

    /**
     * 得到ModelAndView
     *
     * @return
     */
    public ModelAndView getModelAndView() {
        return new ModelAndView();
    }

    /**
     * 得到request对象
     *
     * @return
     */
    public HttpServletRequest getRequest() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request;
    }

    /**
     * 得到32位的uuid
     *
     * @return
     */
    public String get32UUID() {
        return UuidUtil.get32UUID();
    }

}
