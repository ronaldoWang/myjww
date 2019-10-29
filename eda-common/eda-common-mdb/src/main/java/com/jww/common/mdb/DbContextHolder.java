package com.jww.common.mdb;

import com.jww.common.core.Constants;
import cn.hutool.core.util.StrUtil;

/**
 * 数据源DbContextHolder
 *
 * @author haoxi.wang
 * @date 2017/11/17 13:31
 */
public class DbContextHolder {
    private static final ThreadLocal<String> CONTEXTHOLDER = new ThreadLocal<String>();

    /**
     * 设置数据源
     *
     * @param dataSourceEnum
     * @author haoxi.wang
     * @date 2017/11/17 19:46
     */
    public static void setDbType(Constants.DataSourceEnum dataSourceEnum) {
        CONTEXTHOLDER.set(dataSourceEnum.getName());
    }

    /**
     * 取得当前数据源
     *
     * @return String
     * @author haoxi.wang
     * @date 2017/11/17 19:46
     */
    public static String getDbType() {
        String dataSource = CONTEXTHOLDER.get();
        // 如果没有指定数据源，使用默认数据源
        if (StrUtil.isEmpty(dataSource)) {
            DbContextHolder.setDbType(Constants.DataSourceEnum.MASTER);
        }
        return CONTEXTHOLDER.get();
    }

    /**
     * 清除上下文数据
     *
     * @author haoxi.wang
     * @date 2017-12-11 19:46
     */
    public static void clearDbType() {
        CONTEXTHOLDER.remove();
    }
}
