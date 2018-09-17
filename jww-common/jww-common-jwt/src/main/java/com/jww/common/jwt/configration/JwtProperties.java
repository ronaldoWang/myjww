package com.jww.common.jwt.configration;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * jwt相关配置
 *
 * @author shadj
 * @date 2018/5/12 11:50
 */
@Configuration
@ConfigurationProperties(prefix = JwtProperties.JWT_PREFIX)
public class JwtProperties {

    public static final String JWT_PREFIX = "jwt";
    public static final String JWT_ISOPEN_CLOSE = "0";


    private String isOpen = "1";

    private String header = "Authorization";

    private String secret = "defaultSecret";

    private Long expiration = 604800L;

    private String authPath = "wx/login";

    private String md5Key = "randomKey";

    private String excludePaths;

    public String getExcludePaths() {
        return excludePaths;
    }

    public void setExcludePaths(String excludePaths) {
        this.excludePaths = excludePaths;
    }

    public String getIsOpen() {
        return isOpen;
    }

    public void setIsOpen(String isOpen) {
        this.isOpen = isOpen;
    }

    public static String getJwtPrefix() {
        return JWT_PREFIX;
    }

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    public String getSecret() {
        return secret;
    }

    public void setSecret(String secret) {
        this.secret = secret;
    }

    public Long getExpiration() {
        return expiration;
    }

    public void setExpiration(Long expiration) {
        this.expiration = expiration;
    }

    public String getAuthPath() {
        return authPath;
    }

    public void setAuthPath(String authPath) {
        this.authPath = authPath;
    }

    public String getMd5Key() {
        return md5Key;
    }

    public void setMd5Key(String md5Key) {
        this.md5Key = md5Key;
    }
}
