package com.jww.common.jwt.exception;

public class JwtTokenException extends RuntimeException {

    private static final long serialVersionUID = -6736944294947154413L;

    public JwtTokenException(String msg) {
        super(msg);
    }
}
