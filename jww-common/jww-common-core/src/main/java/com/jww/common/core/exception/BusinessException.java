package com.jww.common.core.exception;

import com.jww.common.core.Constants.ResultCodeEnum;

/**
 * 业务异常类
 *
 * @author haoxi.wang
 * @date 2017/11/10 11:24
 */
public class BusinessException extends BaseException {
    private ResultCodeEnum errorCode;

    public BusinessException() {
        super();
    }

    public BusinessException(Throwable ex) {
        super(ex);
    }

    public BusinessException(String message) {
        super(message);
    }

    public BusinessException(String message, Throwable ex) {
        super(message, ex);
    }

    public BusinessException(ResultCodeEnum errorCode) {
        this.errorCode = errorCode;
    }

    @Override
    public ResultCodeEnum getCode() {
        return errorCode == null ? ResultCodeEnum.INTERNAL_SERVER_ERROR : errorCode;
    }
}
