package com.jww.ump.rpc.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.SqlHelper;
import com.baomidou.mybatisplus.plugins.Page;
import com.jww.common.core.base.BaseServiceImpl;
import com.jww.ump.common.UmpConstants;
import com.jww.ump.dao.mapper.SysParamMapper;
import com.jww.ump.model.SysParamModel;
import com.jww.ump.rpc.api.SysParamService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;

import java.io.Serializable;
import java.util.*;

/**
 * <p>
 * 全局参数表 服务实现类
 * </p>
 *
 * @author haoxi.wang
 * @since 2017-12-24
 */
@Service
@CacheConfig(cacheNames = UmpConstants.UmpCacheName.PARAM)
public class SysParamServiceImpl extends BaseServiceImpl<SysParamMapper, SysParamModel> implements SysParamService {

    @Override
    public Page<SysParamModel> queryListPage(Page<SysParamModel> page) {
        SysParamModel sysParamModel = new SysParamModel();
        sysParamModel.setIsDel(0);
        EntityWrapper<SysParamModel> entityWrapper = new EntityWrapper<>(sysParamModel);
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

    @Override
    @CacheEvict(value = UmpConstants.UmpCacheName.PARAM, allEntries = true)
    public SysParamModel add(SysParamModel paramModel) {
        return super.add(paramModel);
    }

    @CacheEvict(value = UmpConstants.UmpCacheName.PARAM, allEntries = true)
    public boolean deleteBatchIds(Collection<? extends Serializable> idList) {
        List<SysParamModel> sysParamModelList = new ArrayList<SysParamModel>();
        idList.forEach(id -> {
            SysParamModel entity = new SysParamModel();
            entity.setId((Long) id);
            entity.setIsDel(1);
            entity.setUpdateTime(new Date());
            sysParamModelList.add(entity);
        });
        return super.updateBatchById(sysParamModelList);
    }


    @Override
    @CacheEvict(value = UmpConstants.UmpCacheName.PARAM, allEntries = true)
    public SysParamModel modifyById(SysParamModel paramModel) {
        return super.modifyById(paramModel);
    }

    @Override
    public SysParamModel getUnique(String paramType, String paramKey) {
        if (StrUtil.isBlank(paramType) || StrUtil.isBlank(paramKey)) {
            return null;
        }
        SysParamModel sysParamModel = new SysParamModel();
        sysParamModel.setIsDel(0);
        sysParamModel.setParamType(paramType);
        sysParamModel.setParamKey(paramKey);
        EntityWrapper<SysParamModel> entityWrapper = new EntityWrapper<>(sysParamModel);
        sysParamModel = selectOne(entityWrapper);
        return sysParamModel;
    }
}
