package com.jww.customer.developcustomer.rpc.service.impl;

import com.jww.customer.developcustomer.model.DevelopCustomerModel;
import com.jww.customer.developcustomer.dao.mapper.DevelopCustomerMapper;
import com.jww.customer.developcustomer.rpc.api.DevelopCustomerService;
import com.jww.common.core.base.BaseServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 待开发客户表 服务实现类
 * </p>
 *
 * @author kevinWang
 * @since 2018-09-15
 */

@Slf4j
@Service("DevelopCustomerService")
public class DevelopCustomerServiceImpl extends BaseServiceImpl<DevelopCustomerMapper, DevelopCustomerModel> implements DevelopCustomerService {

}
