package com.jww.ump.rpc.api;

import com.jww.common.core.base.BaseService;
import com.jww.ump.model.SysScheduleJobModel;

/**
 * <p>
 * 定时任务 服务类
 * </p>
 *
 * @author kevinWang
 * @since 2018-09-18
 */
public interface SysScheduleJobService extends BaseService<SysScheduleJobModel> {

    void run(Long[] jobIds);

    void resume(Long[] jobIds);

    void pause(Long[] jobIds);
}
