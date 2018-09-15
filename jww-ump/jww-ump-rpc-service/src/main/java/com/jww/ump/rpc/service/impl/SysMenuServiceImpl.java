package com.jww.ump.rpc.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.jww.common.core.annotation.DistributedLock;
import com.jww.common.core.base.BaseServiceImpl;
import com.jww.common.core.exception.BusinessException;
import com.jww.ump.common.UmpConstants;
import com.jww.ump.dao.mapper.SysMenuMapper;
import com.jww.ump.dao.mapper.SysRoleMenuMapper;
import com.jww.ump.dao.mapper.SysTreeMapper;
import com.jww.ump.model.SysMenuModel;
import com.jww.ump.model.SysTreeModel;
import com.jww.ump.rpc.api.SysMenuService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 菜单 服务实现类
 * </p>
 *
 * @author wanyong
 * @since 2017-11-29
 */
@Slf4j
@Service("sysMenuService")
@CacheConfig(cacheNames = UmpConstants.UmpCacheName.MENU)
public class SysMenuServiceImpl extends BaseServiceImpl<SysMenuMapper, SysMenuModel> implements SysMenuService {

    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Autowired
    private SysTreeMapper sysTreeMapper;

    @Autowired
    private SysRoleMenuMapper sysRoleMenuMapper;

    @Override
    @Cacheable
    public List<SysMenuModel> queryList() {
        SysMenuModel sysMenuModel = new SysMenuModel();
        // 状态为：启用
        sysMenuModel.setEnable(1);
        // 是否删除：否
        sysMenuModel.setIsDel(0);
        EntityWrapper<SysMenuModel> entityWrapper = new EntityWrapper<>(sysMenuModel);
        entityWrapper.orderBy(" parent_id, sort_no ", true);
        return super.selectList(entityWrapper);
    }

    @Override
    public Page<SysMenuModel> queryListPage(Page<SysMenuModel> page) {
        SysMenuModel menu = new SysMenuModel();
        menu.setEnable(1);
        menu.setIsDel(0);
        System.out.println("================");
        EntityWrapper<SysMenuModel> wrapper = new EntityWrapper<>(menu);
        wrapper.eq("a.is_del", 0).eq("a.enable_", 1);
        if (ObjectUtil.isNotNull(page.getCondition())) {
            StringBuilder conditionSql = new StringBuilder();
            Map<String, Object> paramMap = page.getCondition();
            paramMap.forEach((k, v) -> {
                if (NumberUtil.isNumber(v + "")) {
                    conditionSql.append("a.").append(k + " = " + v + " and ");
                } else if (StrUtil.isNotBlank(v + "")) {
                    conditionSql.append("a.").append(k + " like '%" + v + "%' and ");
                }
            });
            if (StrUtil.isNotBlank(conditionSql)) {
                wrapper.where(StrUtil.removeSuffix(conditionSql.toString(), "and "));
            }
        }
        wrapper.orderBy(" parent_id, sort_no ", true);
        page.setCondition(null);
        return super.selectPage(page, wrapper);
    }

    @Override
    @Cacheable
    public List<SysTreeModel> queryMenuTreeByUserId(Long userId) {
        List<SysMenuModel> sysMenuModelList = null;
        // 如果是超级管理员，则查询所有目录菜单
        if (UmpConstants.USERID_ADMIN.equals(userId)) {
            SysMenuModel sysMenuModel = new SysMenuModel();
            sysMenuModel.setEnable(1);
            sysMenuModel.setIsShow(1);
            sysMenuModel.setIsDel(0);
            EntityWrapper<SysMenuModel> wrapper = new EntityWrapper<>(sysMenuModel);
            wrapper.ne("menu_type", 2);
            wrapper.orderBy("parent_id, sort_no", true);
            sysMenuModelList = sysMenuMapper.selectList(wrapper);
        } else {
            sysMenuModelList = sysMenuMapper.selectMenuTreeByUserId(userId);
        }
        return convertTreeData(sysMenuModelList, null);
    }

    @Override
    @Cacheable
    public List<SysTreeModel> queryFuncMenuTree() {
        List<SysMenuModel> sysMenuModelList = queryList();
        return convertTreeData(sysMenuModelList, null);
    }

    @Override
    @Cacheable(value = UmpConstants.UmpCacheName.ROLE)
    public List<SysTreeModel> queryFuncMenuTree(Long roleId) {
        List<SysMenuModel> sysMenuModelList = queryList();
        List<Long> menuIdList = sysRoleMenuMapper.selectMenuIdListByRoleId(roleId);
        System.out.println("menuIdList:" + JSON.toJSONString(menuIdList));
        return convertTreeData(sysMenuModelList, menuIdList.toArray());
    }

    @Override
    @Cacheable
    public List<SysTreeModel> queryTree(Long id, Integer menuType) {
        List<SysTreeModel> sysTreeModelList = sysTreeMapper.selectMenuTree(id, menuType);
        List<SysTreeModel> list = SysTreeModel.getTree(sysTreeModelList);
        return list;
    }

    @Override
    @DistributedLock
    @CacheEvict(value = UmpConstants.UmpCacheName.MENU,allEntries = true)
    public Boolean delete(Long id) {
        //查询是否有子菜单，如果有则返回false，否则允许删除
        EntityWrapper<SysMenuModel> entityWrapper = new EntityWrapper<SysMenuModel>();
        SysMenuModel sysMenuModel = new SysMenuModel();
        sysMenuModel.setParentId((Long) id);
        sysMenuModel.setIsDel(0);
        entityWrapper.setEntity(sysMenuModel);
        List<SysMenuModel> childs = super.selectList(entityWrapper);
        if (CollectionUtil.isNotEmpty(childs)) {
            log.error("删除菜单[id:{}]失败，请先删除子菜单", id);
            throw new BusinessException("删除菜单失败，请先删除子菜单");
        }
        sysMenuModel = new SysMenuModel();
        sysMenuModel.setId(id);
        sysMenuModel.setIsDel(1);
        sysMenuModel = super.modifyById(sysMenuModel);
        if (sysMenuModel != null) {
            return true;
        }
        return false;
    }

    @Override
    @CacheEvict(value = UmpConstants.UmpCacheName.MENU, allEntries = true)
    public Integer deleteBatch(Long[] ids) {
        int succ = 0;
        for (Long id : ids) {
            Boolean res = false;
            try {
                res = this.delete(id);
            } catch (Exception e) {
                log.error("删除菜单失败，id:{}", id, e);
            }
            if (res) {
                succ++;
            }
            log.debug("删除菜单完成，id:{}，执行结果：{}", id, res);
        }
        return succ;
    }

    @Override
    @CachePut
    @DistributedLock(value = "#sysMenuModel.getParentId()")
    public SysMenuModel add(SysMenuModel sysMenuModel) {
        //名称重复验证，同一目录下，菜单名称不能相同
        SysMenuModel menuModel = new SysMenuModel();
        menuModel.setParentId(sysMenuModel.getParentId());
        menuModel.setMenuName(sysMenuModel.getMenuName());
        EntityWrapper<SysMenuModel> entityWrapper = new EntityWrapper<>(menuModel);
        List<SysMenuModel> sysMenuModelList = super.selectList(entityWrapper);
        if (CollUtil.isNotEmpty(sysMenuModelList)) {
            throw new BusinessException("同一目录下，菜单名称不能相同");
        }
        return super.add(sysMenuModel);
    }

    @Override
    @CacheEvict(value = UmpConstants.UmpCacheName.MENU, allEntries = true)
    public SysMenuModel modifyById(SysMenuModel sysMenuModel) {
        if(StrUtil.isNotBlank(sysMenuModel.getMenuName())){
            //名称重复验证，同一目录下，菜单名称不能相同（需要排除自己）
            SysMenuModel menuModel = new SysMenuModel();
            menuModel.setParentId(sysMenuModel.getParentId());
            menuModel.setMenuName(sysMenuModel.getMenuName());
            menuModel.setIsDel(0);
            EntityWrapper<SysMenuModel> entityWrapper = new EntityWrapper<>(menuModel);
            entityWrapper.ne("id_", sysMenuModel.getId());
            List<SysMenuModel> sysMenuModelList = super.selectList(entityWrapper);
            if (CollUtil.isNotEmpty(sysMenuModelList)) {
                throw new BusinessException("同一目录下，菜单名称不能相同");
            }
        }
        return super.modifyById(sysMenuModel);
    }

    /**
     * 获取树模型结构数据
     *
     * @param sysMenuModelList
     * @param checkedMenuIds
     * @return List<SysTreeModel>
     * @author wanyong
     * @date 2017-12-19 10:55
     */
    private List<SysTreeModel> convertTreeData(List<SysMenuModel> sysMenuModelList, Object[] checkedMenuIds) {
        Map<Long, List<SysTreeModel>> map = new HashMap<>(3);
        for (SysMenuModel sysMenuModel : sysMenuModelList) {
            if (sysMenuModel != null && map.get(sysMenuModel.getParentId()) == null) {
                List<SysTreeModel> children = new ArrayList<>();
                map.put(sysMenuModel.getParentId(), children);
            }
            map.get(sysMenuModel.getParentId()).add(convertTreeModel(sysMenuModel, checkedMenuIds));
        }
        List<SysTreeModel> result = new ArrayList<>();
        for (SysMenuModel sysMenuModel : sysMenuModelList) {
            boolean flag = sysMenuModel != null && sysMenuModel.getParentId() == null || sysMenuModel.getParentId() == 0;
            if (flag) {
                SysTreeModel sysTreeModel = convertTreeModel(sysMenuModel, checkedMenuIds);
                sysTreeModel.setChildren(getChild(map, sysMenuModel.getId()));
                result.add(sysTreeModel);
            }
        }
        return result;
    }

    /**
     * 递归获取子树模型结构数据
     *
     * @param map
     * @param id
     * @return List<SysTreeModel>
     * @author wanyong
     * @date 2017-12-19 10:56
     */
    private List<SysTreeModel> getChild(Map<Long, List<SysTreeModel>> map, Long id) {
        List<SysTreeModel> treeModelList = map.get(id);
        if (treeModelList != null) {
            for (SysTreeModel treeModel : treeModelList) {
                if (treeModel != null) {
                    treeModel.setChildren(getChild(map, treeModel.getId()));
                }
            }
        }
        return treeModelList;
    }

    /**
     * 把菜单模型对象转换成树模型对象
     *
     * @param sysMenuModel
     * @param checkedMenuIds
     * @return SysTreeModel
     * @author wanyong
     * @date 2017-12-19 14:22
     */
    private SysTreeModel convertTreeModel(SysMenuModel sysMenuModel, Object[] checkedMenuIds) {
        SysTreeModel sysTreeModel = new SysTreeModel();
        sysTreeModel.setId(sysMenuModel.getId());
        sysTreeModel.setName(sysMenuModel.getMenuName());
        sysTreeModel.setIcon(sysMenuModel.getIconcls());
        sysTreeModel.setSpread(sysMenuModel.getExpand() == 1);
        sysTreeModel.setHref(sysMenuModel.getRequest());
        sysTreeModel.setPermission(sysMenuModel.getPermission());
        sysTreeModel.setChecked(checkedMenuIds != null && ArrayUtil.contains(checkedMenuIds, sysMenuModel.getId()));
        sysTreeModel.setDisabled(false);
        return sysTreeModel;
    }
}
