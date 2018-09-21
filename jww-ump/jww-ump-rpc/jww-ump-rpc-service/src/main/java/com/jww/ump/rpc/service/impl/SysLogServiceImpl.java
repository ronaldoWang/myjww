package com.jww.ump.rpc.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.jww.common.core.base.BaseServiceImpl;
import com.jww.ump.dao.mapper.SysLogMapper;
import com.jww.ump.model.SysLogModel;
import com.jww.ump.rpc.api.SysLogService;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * <p>
 * 系统日志 服务实现类
 * </p>
 *
 * @author RickyWang
 * @since 2017-12-26
 */
@Service("sysLogService")
@Slf4j
public class SysLogServiceImpl extends BaseServiceImpl<SysLogMapper, SysLogModel> implements SysLogService {

    @Autowired
    private SysLogMapper sysLogMapper;

    @Override
    public Page<SysLogModel> queryListPage(Page<SysLogModel> page) {
        EntityWrapper<SysLogModel> entityWrapper = new EntityWrapper<>();
        if (ObjectUtil.isNotNull(page.getCondition())) {
            StringBuilder conditionSql = new StringBuilder();
            Map<String, Object> paramMap = page.getCondition();
            paramMap.forEach((k, v) -> {
                if (StrUtil.isNotBlank(v + "")) {
                    conditionSql.append(k + " like '%" + v + "%' OR ");
                }
            });
            if(StrUtil.isNotBlank(conditionSql)){
                entityWrapper.where(StrUtil.removeSuffix(conditionSql.toString(), "OR "));
            }
        }
        entityWrapper.orderBy("create_time", false);
        page.setCondition(null);
        return super.selectPage(page, entityWrapper);
    }
}
