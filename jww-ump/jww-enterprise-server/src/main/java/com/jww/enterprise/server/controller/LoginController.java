package com.jww.enterprise.server.controller;

import com.jww.common.core.Constants;
import com.jww.common.core.exception.LoginException;
import com.jww.common.core.model.LoginModel;
import com.jww.common.jwt.JwtTokenHelper;
import com.jww.common.jwt.constant.JwtConstant;
import com.jww.common.redis.helper.RedisHelper;
import com.jww.common.web.BaseController;
import com.jww.common.web.model.ResultModel;
import com.jww.common.web.util.ResultUtil;
import com.jww.enterprise.server.annotation.SysLogOpt;
import com.jww.ump.model.SysUserModel;
import com.jww.ump.rpc.api.SysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.common.utils.StringUtils;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * 登陆控制器
 *
 * @author haoxi.wang
 * @date 2017-11-30
 **/
@Slf4j
@RestController
@Api(value = "登录接口", description = "登录接口")
public class LoginController extends BaseController {

    @Reference(check = false)
    private SysUserService sysUserService;

    @Autowired
    JwtTokenHelper jwtTokenHelper;

    @Autowired
    RedisHelper redisHelper;

    /**
     * 登陆
     *
     * @param loginModel 登录对象
     * @return ResultModel
     * @author haoxi.wang
     * @date 2017-11-30 16:14
     */
    @ApiOperation(value = "用户登录")
    @PostMapping("/login")
    @SysLogOpt(module = "登录接口", value = "用户登录", operationType = Constants.LogOptEnum.LOGIN)
    public ResultModel login(@Valid @RequestBody LoginModel loginModel) {
        SysUserModel currentUser = sysUserService.queryByAccount(loginModel.getAccount());
        if (!currentUser.getPassword().equals(new String(loginModel.getPassword()))) {
            throw new LoginException(Constants.ResultCodeEnum.LOGIN_FAIL_ACCOUNT_LOCKED.getMessage());
        }
        // 清除可能存在的shiro权限信息缓存
        if (redisHelper.hasKey(Constants.CacheNamespaceEnum.SHIRO.value() + loginModel.getAccount())) {
            redisHelper.del(Constants.CacheNamespaceEnum.SHIRO.value() + loginModel.getAccount());
        }
        String currentTimeMillis = String.valueOf(System.currentTimeMillis());
        String token = jwtTokenHelper.sign(loginModel.getAccount(), currentTimeMillis);
        // 验证通过，返回前端所需的用户信息
        SysUserModel sysUserModel = new SysUserModel();
        sysUserModel.setId(currentUser.getId());
        sysUserModel.setAccount(currentUser.getAccount());
        sysUserModel.setUserName(currentUser.getUserName());
        sysUserModel.setAvatar(currentUser.getAvatar());
        sysUserModel.setToken(token);
        return ResultUtil.ok(sysUserModel);
    }

    /**
     * 登出
     *
     * @return ResultModel
     * @author haoxi.wang
     * @date 2018-01-04 11:36
     */
    @ApiOperation(value = "用户登出")
    @PostMapping("/logout")
    @SysLogOpt(module = "登录接口", value = "用户登出", operationType = Constants.LogOptEnum.LOGIN)
    public ResultModel logout() {
        Subject subject = SecurityUtils.getSubject();
        String token = (String) subject.getPrincipal();
        if (StringUtils.isNotEmpty(token)) {
            String account = jwtTokenHelper.getClaim(token, JwtConstant.ACCOUNT);
            redisHelper.del(JwtConstant.PREFIX_SHIRO_REFRESH_TOKEN + account);
            subject.logout();
        }
        return ResultUtil.ok();
    }

    /**
     * 未登陆
     *
     * @return ResultModel
     * @author haoxi.wang
     * @date 2017-11-30 16:03
     */
    @RequestMapping(value = "/unlogin", method = {RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT})
    public ResultModel unlogin() {
        return ResultUtil.fail(Constants.ResultCodeEnum.UNLOGIN);
    }

    /**
     * 未授权
     *
     * @return ResultModel
     * @author haoxi.wang
     * @date 2017-11-30 16:03
     */
    @RequestMapping(value = "/unauthorized", method = {RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT})
    public ResultModel unauthorized() {
        return ResultUtil.fail(Constants.ResultCodeEnum.UNAUTHORIZED);
    }
}
