package com.jww.common.web;

import com.jww.common.web.util.WebUtil;

/**
 * 控制器基类
 *
 * @author haoxi.wang
 * @date 2017/11/9 23:45
 */
public abstract class BaseController {

    /**
     * 获取当前用户Id
     *
     * @return Long
     * @author haoxi.wang
     * @date 2017-11-30 17:45
     */
    protected Long getCurrentUserId() {
        return WebUtil.getCurrentUserId();
    }

    /**
     * 获取当前用户
     *
     * @return Object
     * @author haoxi.wang
     * @date 2017-11-30 17:45
     */
    protected Object getCurrentUser() {
        return WebUtil.getCurrentUser();
    }
}
