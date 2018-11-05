package com.jww.api.sys;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.jww.common.core.Constants;
import com.jww.common.web.model.ResultModel;
import com.jww.common.web.util.ResultUtil;
import com.jww.ump.model.SysParamModel;
import com.jww.ump.rpc.api.SysParamService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/api")
@Api(value = "app更新", description = "APP更新api")
public class ApiAppUpdateController {
    @Autowired
    private SysParamService sysParamService;

    @ApiOperation(value = "检查自助机app最新版本", notes = "根据app版本号查询是否有更新版本")
    @ApiImplicitParam(name = "versionCode", value = "自助机app版本号", required = true, dataType = "Integer")
    @GetMapping("/updateSelf/{versionCode}")
    public ResultModel query(@PathVariable("versionCode") Integer versionCode) {
        SysParamModel sysParamModel = new SysParamModel();
        sysParamModel.setIsDel(0);
        sysParamModel.setParamType("app_update");
        sysParamModel.setParamKey("self");
        EntityWrapper<SysParamModel> entityWrapper = new EntityWrapper<>(sysParamModel);
        sysParamModel = sysParamService.selectOne(entityWrapper);
        if (null == sysParamModel) {
            log.error("自助机app更新失败：参数管理里未配置版本更新");
            return ResultUtil.fail(Constants.ResultCodeEnum.NOCONTENT, "已经是最新版");
        }
        Integer paramValue = Integer.valueOf(sysParamModel.getParamValue());
        if (versionCode >= paramValue) {
            return ResultUtil.fail(Constants.ResultCodeEnum.NOCONTENT, "已经是最新版");
        } else {
            log.info("自助机app触发最新:{}", sysParamModel.getParamUrl());
            return ResultUtil.ok(sysParamModel.getParamUrl(), sysParamModel.getRemark());
        }
    }
}
