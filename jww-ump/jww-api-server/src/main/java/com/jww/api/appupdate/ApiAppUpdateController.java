package com.jww.api.appupdate;

import com.jww.common.core.Constants;
import com.jww.common.web.model.ResultModel;
import com.jww.common.web.util.ResultUtil;
import com.jww.ump.model.SysParamModel;
import com.jww.ump.rpc.api.SysParamService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/api/appUpdate")
@Api(value = "app更新", description = "APP更新api")
public class ApiAppUpdateController {
    @Reference(check = false)
    private SysParamService sysParamService;

    @ApiOperation(value = "检查自助机app最新版本", notes = "根据自助机app版本号查询是否有更新版本")
    @ApiImplicitParam(name = "versionCode", value = "自助机app版本号", required = true, dataType = "Integer")
    @GetMapping("/self/{versionCode}")
    public ResultModel self(@PathVariable("versionCode") Integer versionCode) {
        SysParamModel sysParamModel = sysParamService.getUnique("app_update", "self");
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

    @ApiOperation(value = "检查回收员app最新版本", notes = "根据回收员app版本号查询是否有更新版本")
    @ApiImplicitParam(name = "versionCode", value = "回收员app版本号", required = true, dataType = "Integer")
    @GetMapping("/hsy/{versionCode}")
    public ResultModel updateHsy(@PathVariable("versionCode") Integer versionCode) {
        SysParamModel sysParamModel = sysParamService.getUnique("app_update", "hsy");
        if (null == sysParamModel) {
            log.error("回收员app更新失败：参数管理里未配置版本更新");
            return ResultUtil.fail(Constants.ResultCodeEnum.NOCONTENT, "已经是最新版");
        }
        Integer paramValue = Integer.valueOf(sysParamModel.getParamValue());
        if (versionCode >= paramValue) {
            return ResultUtil.fail(Constants.ResultCodeEnum.NOCONTENT, "已经是最新版");
        } else {
            log.info("回收员app触发最新:{}", sysParamModel.getParamUrl());
            return ResultUtil.ok(sysParamModel.getParamUrl(), sysParamModel.getRemark());
        }
    }
}
