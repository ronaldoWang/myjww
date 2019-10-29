package com.jww.common.core.base;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.jww.common.core.Constants;
import com.jww.common.core.exception.BusinessException;

import java.util.Date;

/**
 * 业务处理基类实现
 *
 * @author haoxi.wang
 * @date 2017/11/19 20:36
 */
public class BaseServiceImpl<M extends BaseMapper<T>, T extends BaseModel>
        extends ServiceImpl<BaseMapper<T>, T> implements BaseService<T> {

    @Override
    public T modifyById(T entity) {
        T resultEntity = null;
        entity.setUpdateTime(new Date());
        if (super.updateById(entity)) {
            resultEntity = entity;
        }
        return resultEntity;
    }

    @Override
    public T queryById(Long id) {
        return super.selectById(id);
    }

    @Override
    public T add(T entity) {
        entity.setCreateTime(new Date());
        entity.setUpdateTime(new Date());
        try {
            if (super.insert(entity)) {
                return entity;
            }
        } catch (Exception exception) {
            String duplicateKey = "DuplicateKeyException";
            if (exception.toString().contains(duplicateKey)) {
                throw new BusinessException(Constants.ResultCodeEnum.DATA_DUPLICATE_KEY.getMessage());
            }
            throw exception;
        }
        return null;
    }

}
