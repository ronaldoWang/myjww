package com.jww.quartz.rpc.api;

import com.jww.common.core.base.BaseService;
import com.jww.quartz.model.SysScheduleJobModel;

/**
 * 定时任务
 *
 * @author czx
 * @email object_czx@163.com
 * @date 2016年11月28日 上午9:55:32
 */
public interface SysScheduleJobService extends BaseService<SysScheduleJobModel> {

    /**
     * 立即执行
     */
    void run(Long[] jobIds);

    /**
     * 暂停运行
     */
    void pause(Long[] jobIds);

    /**
     * 恢复运行
     */
    void resume(Long[] jobIds);
}
