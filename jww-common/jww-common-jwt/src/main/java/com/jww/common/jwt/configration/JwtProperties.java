package com.jww.common.jwt.configration;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * jwt相关配置
 *
 * @author shadj
 * @date 2018/5/12 11:50
 */
@Data
@Configuration
@ConfigurationProperties(prefix = JwtProperties.JWT_PREFIX)
public class JwtProperties {

    public static final String JWT_PREFIX = "jwt";

    public static final String JWT_ISOPEN_CLOSE = "0";

    public String encryptAESKey;//AES密码加密私钥(Base64加密)

    public String encryptJWTKey;//JWT认证加密私钥(Base64加密)

    public Long accessTokenExpireTime;//AccessToken过期时间-5分钟-5*60(秒为单位)

    public Long refreshTokenExpireTime;// RefreshToken过期时间-30分钟-30*60(秒为单位)

    public Long shiroCacheExpireTime;//Shiro缓存过期时间-5分钟-5*60(秒为单位)(一般设置与AccessToken过期时间一致)
}
