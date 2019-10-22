package com.jww.ump.server.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.jww.common.web.BaseController;
import com.jww.common.web.model.ResultModel;
import com.jww.common.web.util.ResultUtil;
import com.jww.ump.model.SysDicModel;
import com.jww.ump.model.SysMenuModel;
import com.jww.ump.rpc.api.SysAuthorizeService;
import com.jww.ump.rpc.api.SysDicService;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 首页前端控制器
 *
 * @author haoxi.wang
 * @date 2017/12/31 21:13
 */
@RestController
@RequestMapping("/index")
public class IndexController extends BaseController {

    @Reference(check = false)
    private SysAuthorizeService sysAuthorizeService;

    @Reference(check = false)
    private SysDicService sysDicService;

    /**
     * 获取当前用户的权限集合
     *
     * @return ResultModel
     * @author haoxi.wang
     * @date 2017/12/31 21:10
     */
    @GetMapping("/permissions")
    @RequiresAuthentication
    public ResultModel<List<SysMenuModel>> queryMyPermissions() {
        return ResultUtil.ok(sysAuthorizeService.queryPermissionsByUserId(super.getCurrentUserId()));
    }


    @GetMapping("/dic")
    @RequiresAuthentication
    public ResultModel<String> queryDic() {
        EntityWrapper<SysDicModel> entityWrapper = new EntityWrapper<>();
        entityWrapper.eq("is_del", 0).eq("enable_", 1);
        List<SysDicModel> list = sysDicService.selectList(entityWrapper);
        Map<String, List<SysDicModel>> map = new HashMap<>();
        for (SysDicModel dicModel : list) {
            String dicType = dicModel.getType().toLowerCase();//小字母
            if (null == map.get(dicType)) {
                List<SysDicModel> dicList = new ArrayList<>();
                dicList.add(dicModel);
                map.put(dicType, dicList);
            } else {
                List<SysDicModel> dicList = map.get(dicType);
                dicList.add(dicModel);
                map.put(dicType, dicList);
            }
        }
        return ResultUtil.ok(JSONObject.toJSONString(map));
    }

}
