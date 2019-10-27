package com.jww.enterprise.server.shiro.realm;

import com.alibaba.fastjson.JSON;
import com.jww.common.jwt.JwtTokenHelper;
import com.jww.common.jwt.constant.JwtConstant;
import com.jww.common.redis.helper.RedisHelper;
import com.jww.enterprise.server.shiro.jwt.JwtToken;
import com.jww.ump.model.SysUserModel;
import com.jww.ump.rpc.api.SysAuthorizeService;
import com.jww.ump.rpc.api.SysUserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.common.utils.StringUtils;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class UserRealm extends AuthorizingRealm {
    @Reference(check = false)
    private SysUserService sysUserService;

    @Reference(check = false)
    private SysAuthorizeService sysAuthorizeService;

    @Autowired
    JwtTokenHelper jwtTokenHelper;

    @Autowired
    RedisHelper redisHelper;

    //UserRealm() {
    //    this.setCredentialsMatcher(hashedCredentialsMatcher());
    //    this.setAuthenticationCachingEnabled(true);
    //    this.setAuthorizationCachingEnabled(true);
    //}
    //
    //@Bean
    //public HashedCredentialsMatcher hashedCredentialsMatcher() {
    //    HashedCredentialsMatcher credentialsMatcher = new HashedCredentialsMatcher();
    //    credentialsMatcher.setHashAlgorithmName("MD5"); //加密方式
    //    credentialsMatcher.setHashIterations(2);//散列次数
    //    return credentialsMatcher;
    //}

    /**
     * 必须重写此方法，不然Shiro会报错
     */
    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof JwtToken;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        String account = jwtTokenHelper.getClaim(principals.toString(), JwtConstant.ACCOUNT);
        List<String> permissionList = sysAuthorizeService.queryPermissionsByUserId(1L);
        permissionList.stream().forEach(permission -> {
            simpleAuthorizationInfo.addStringPermission(permission);
        });
        log.info("userId:{},simpleAuthorizationInfo:{}", account, JSON.toJSONString(simpleAuthorizationInfo.getStringPermissions()));
        return simpleAuthorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken auth) throws AuthenticationException {
        String token = (String) auth.getCredentials();
        // 解密获得account，用于和数据库进行对比
        String account = jwtTokenHelper.getClaim(token, JwtConstant.ACCOUNT);
        // 帐号为空
        if (StringUtils.isBlank(account)) {
            throw new AuthenticationException("Token中帐号为空(The account in Token is empty.)");
        }

        SysUserModel sysUserModel = sysUserService.queryByAccount(account);
        if (null == sysUserModel) {
            throw new UnknownAccountException();
        }

        // 开始认证，要AccessToken认证通过，且Redis中存在RefreshToken，且两个Token时间戳一致
        if (jwtTokenHelper.verify(token) && redisHelper.hasKey(JwtConstant.PREFIX_SHIRO_REFRESH_TOKEN + account)) {
            // 获取RefreshToken的时间戳
            String currentTimeMillisRedis = redisHelper.get(JwtConstant.PREFIX_SHIRO_REFRESH_TOKEN + account).toString();
            // 获取AccessToken时间戳，与RefreshToken的时间戳对比
            if (jwtTokenHelper.getClaim(token, JwtConstant.CURRENT_TIME_MILLIS).equals(currentTimeMillisRedis)) {
                return new SimpleAuthenticationInfo(token, token, "userRealm");
            }
        }
        throw new AuthenticationException("Token已过期(Token expired or incorrect.)");
    }
}
