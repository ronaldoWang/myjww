package com.jww.quartz.rpc.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.jww.common.core.base.BaseServiceImpl;
import com.jww.quartz.dao.mapper.SysScheduleJobLogMapper;
import com.jww.quartz.model.SysScheduleJobLogModel;
import com.jww.quartz.rpc.api.SysScheduleJobLogService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.*;

/**
 * <p>
 * 定时任务日志 服务实现类
 * </p>
 *
 * @author kevinWang
 * @since 2018-09-29
 */

@Slf4j
@Service
public class SysScheduleJobLogServiceImpl extends BaseServiceImpl<SysScheduleJobLogMapper, SysScheduleJobLogModel> implements SysScheduleJobLogService {

    @Override
    public Page<SysScheduleJobLogModel> selectPage(Page<SysScheduleJobLogModel> page, Wrapper<SysScheduleJobLogModel> entityWrapper) {
        SysScheduleJobLogModel sysScheduleJobLogModel = new SysScheduleJobLogModel();
        sysScheduleJobLogModel.setIsDel(0);
        if (ObjectUtil.isNotNull(page.getCondition())) {
            StringBuilder conditionSql = new StringBuilder();
            Map<String, Object> paramMap = page.getCondition();
            paramMap.forEach((k, v) -> {
                if (StrUtil.isNotBlank(v + "")) {
                    conditionSql.append(k + " like '%" + v + "%' AND ");
                }
            });
            entityWrapper.and(StrUtil.removeSuffix(conditionSql.toString(), "AND "));
        }
        page.setCondition(null);
        return super.selectPage(page, entityWrapper);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public boolean deleteBatchIds(Collection<? extends Serializable> idList) {
        List<SysScheduleJobLogModel> sysScheduleJobLogModelList = new ArrayList<SysScheduleJobLogModel>();
        idList.forEach(id -> {
            SysScheduleJobLogModel entity = new SysScheduleJobLogModel();
            entity.setId((Long) id);
            entity.setIsDel(1);
            entity.setUpdateTime(new Date());
            sysScheduleJobLogModelList.add(entity);
        });
        return super.updateBatchById(sysScheduleJobLogModelList);
    }
}
