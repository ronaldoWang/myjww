package com.jww.ump.rpc.service.impl;

import com.jww.common.core.base.BaseServiceImpl;
import com.jww.ump.dao.mapper.SysRoleMenuMapper;
import com.jww.ump.model.SysRoleMenuModel;
import com.jww.ump.rpc.api.SysRoleMenuService;
import org.apache.dubbo.config.annotation.Service;

/**
 * <p>
 * 角色授权表 服务实现类
 * </p>
 *
 * @author haoxi.wang
 * @since 2017-12-17
 */
@Service
public class SysRoleMenuServiceImpl extends BaseServiceImpl<SysRoleMenuMapper, SysRoleMenuModel> implements SysRoleMenuService {

    @Override
    public boolean delBatchByRoleId(Long roleId) {
        return false;
    }
}
