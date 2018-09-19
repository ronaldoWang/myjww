package com.jww.quartz.dao;

import com.jww.common.core.base.BaseMapper;
import com.jww.quartz.model.SysScheduleJobModel;

import java.util.Map;

/**
 * 定时任务
 * 
 * @author czx
 * @email object_czx@163.com
 * @date 2016年12月1日 下午10:29:57
 */
public interface SysScheduleJobMapper extends BaseMapper<SysScheduleJobModel> {
	
	/**
	 * 批量更新状态
	 */
	int updateBatch(Map<String, Object> map);
}