package com.jww.common.jwt;

import cn.hutool.core.codec.Base64;
import cn.hutool.core.date.DateUtil;
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.exceptions.SignatureGenerationException;
import com.auth0.jwt.exceptions.SignatureVerificationException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.jww.common.jwt.configration.JwtProperties;
import com.jww.common.jwt.constant.JwtConstant;
import com.jww.common.jwt.exception.JwtTokenException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * <p>jwt token工具类</p>
 * <pre>
 *     jwt的claim里一般包含以下几种数据:
 *         1. iss -- token的发行者
 *         2. sub -- 该JWT所面向的用户
 *         3. aud -- 接收该JWT的一方
 *         4. exp -- token的失效时间
 *         5. nbf -- 在此时间段之前,不会被处理
 *         6. iat -- jwt发布时间
 *         7. jti -- jwt唯一标识,防止重复使用
 * </pre>
 *
 * @author shadj
 * @date 2018/5/12 11:50
 */
@Slf4j
@Component
public class JwtTokenHelper {

    @Autowired
    JwtProperties jwtProperties;

    /**
     * 校验token是否正确
     *
     * @param token Token
     * @return boolean 是否正确
     * @author Wang926454
     * @date 2018/8/31 9:05
     */
    public boolean verify(String token) {
        // 帐号加JWT私钥解密
        String secret = getClaim(token, JwtConstant.ACCOUNT) + Base64.decodeStr(jwtProperties.getEncryptJWTKey());
        Algorithm algorithm = Algorithm.HMAC256(secret);
        try {
            JWTVerifier verifier = JWT.require(algorithm).build();
            verifier.verify(token);
            return true;
        } catch (TokenExpiredException e) {
            log.error("JWTToken过期异常:" + e.getMessage());
            throw new TokenExpiredException("JWTToken过期");
        } catch (Exception e) {
            log.error("JWTToken认证解密出现UnsupportedEncodingException异常:" + e.getMessage());
            throw new SignatureVerificationException(algorithm);
        }
    }

    /**
     * 获得Token中的信息无需secret解密也能获得
     *
     * @param token
     * @param claim
     * @return java.lang.String
     * @author Wang926454
     * @date 2018/9/7 16:54
     */
    public static String getClaim(String token, String claim) {
        try {
            DecodedJWT jwt = JWT.decode(token);
            // 只能输出String类型，如果是其他类型返回null
            return jwt.getClaim(claim).asString();
        } catch (JWTDecodeException e) {
            log.error("解密Token中的公共信息出现JWTDecodeException异常:" + e.getMessage());
            throw new JwtTokenException("解密Token中的公共信息出现JWTDecodeException异常:" + e.getMessage());
        }
    }

    /**
     * 生成签名
     *
     * @param account 帐号
     * @return java.lang.String 返回加密的Token
     * @author Wang926454
     * @date 2018/8/31 9:07
     */
    public String sign(String account, String currentTimeMillis) {
        // 帐号加JWT私钥加密
        String secret = account + Base64.decodeStr(jwtProperties.getEncryptJWTKey());
        Algorithm algorithm = Algorithm.HMAC256(secret);
        try {
            Date date = DateUtil.date(System.currentTimeMillis() + jwtProperties.getAccessTokenExpireTime() * 1000);
            // 附带account帐号信息
            return JWT.create().withClaim(JwtConstant.ACCOUNT, account).withClaim(JwtConstant.CURRENT_TIME_MILLIS, currentTimeMillis)
                    .withExpiresAt(date).sign(algorithm);
        } catch (Exception e) {
            log.error("JWTToken加密出现UnsupportedEncodingException异常:" + e.getMessage());
            throw new SignatureGenerationException(algorithm, e);
        }
    }
}