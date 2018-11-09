package com.jww.api.test;

import com.jww.common.jwt.JwtTokenHelper;
import com.jww.common.web.BaseController;
import com.jww.common.web.model.ResultModel;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 登陆控制器
 *
 * @author wanyong
 * @date 2017-11-30
 **/
@Slf4j
@RestController
@Api(value = "测试jwt接口", description = "测试jwt接口")
public class WxTestController extends BaseController {

    @Autowired
    private JwtTokenHelper jwtTokenHelper;

    @PostMapping("/wx/login")
    public ResultModel login(String userName, String pwd) {
        final String randomKey = jwtTokenHelper.getRandomKey();
        final String token = jwtTokenHelper.generateToken(userName, randomKey);
        System.out.println("===========" + token);
        return null;
    }

    @PostMapping("/wx/index")
    public ResultModel index() {
        System.out.println("===========");
        return null;
    }
}
