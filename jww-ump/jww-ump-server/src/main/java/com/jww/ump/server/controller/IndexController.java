package com.jww.ump.server.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.jww.common.web.BaseController;
import com.jww.common.web.model.ResultModel;
import com.jww.common.web.util.ResultUtil;
import com.jww.ump.model.SysDicModel;
import com.jww.ump.model.SysMenuModel;
import com.jww.ump.rpc.api.SysAuthorizeService;
import com.jww.ump.rpc.api.SysDicService;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 首页前端控制器
 *
 * @author shadj
 * @date 2017/12/31 21:13
 */
@RestController
@RequestMapping("/index")
public class IndexController extends BaseController {

    @Autowired
    private SysAuthorizeService sysAuthorizeService;

    @Autowired
    private SysDicService sysDicService;

    /**
     * 获取当前用户的权限集合
     *
     * @return ResultModel
     * @author shadj
     * @date 2017/12/31 21:10
     */
    @GetMapping("/permissions")
    @RequiresAuthentication
    public ResultModel<List<SysMenuModel>> queryMyPermissions() {
        return ResultUtil.ok(sysAuthorizeService.queryPermissionsByUserId(super.getCurrentUserId()));
    }


    @GetMapping("/dic")
    @RequiresAuthentication
    public ResultModel<List<SysDicModel>> queryDic() {
        EntityWrapper<SysDicModel> entityWrapper = new EntityWrapper<>();
        entityWrapper.eq("is_del", 0).eq("enable_", 1);
        return ResultUtil.ok(sysDicService.selectList(entityWrapper));
    }

}
