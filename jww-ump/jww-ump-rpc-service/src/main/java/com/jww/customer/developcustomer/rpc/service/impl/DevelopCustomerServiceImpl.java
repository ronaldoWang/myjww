package com.jww.customer.developcustomer.rpc.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.jww.common.core.base.BaseServiceImpl;
import com.jww.customer.developcustomer.dao.mapper.DevelopCustomerMapper;
import com.jww.customer.developcustomer.model.DevelopCustomerModel;
import com.jww.customer.developcustomer.rpc.api.DevelopCustomerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 待开发客户表 服务实现类
 * </p>
 *
 * @author kevinWang
 * @since 2018-09-16
 */

@Slf4j
@Service("developCustomerService")  public class DevelopCustomerServiceImpl extends BaseServiceImpl<DevelopCustomerMapper, DevelopCustomerModel> implements DevelopCustomerService {
        @Override
        public Page<DevelopCustomerModel> selectPage(Page<DevelopCustomerModel> page) {
            DevelopCustomerModel developCustomerModel = new DevelopCustomerModel();
            developCustomerModel.setIsDel(0);
            EntityWrapper<DevelopCustomerModel> entityWrapper = new EntityWrapper<>(developCustomerModel);
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

        public boolean deleteBatchIds(List<? extends Serializable> idList) {
            List<DevelopCustomerModel> developCustomerModelList = new ArrayList<DevelopCustomerModel>();
            idList.forEach(id -> {
                DevelopCustomerModel entity = new DevelopCustomerModel();
                entity.setId((Long) id);
                entity.setIsDel(1);
                entity.setUpdateTime(new Date());
                developCustomerModelList.add(entity);
            });
            return super.updateBatchById(developCustomerModelList);
        }
}
