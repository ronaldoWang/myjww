package com.jww.ump.server.controller;


import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.jww.common.core.Constants;
import com.jww.common.core.model.PageModel;
import com.jww.common.log.annotation.SysLogOpt;
import com.jww.common.web.BaseController;
import com.jww.common.web.model.ResultModel;
import com.jww.common.web.util.ResultUtil;
import com.jww.quartz.model.SysScheduleJobLogModel;
import com.jww.quartz.rpc.api.SysScheduleJobLogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.Date;

/**
 * <p>
 * 定时任务日志前端控制器
 * </p>
 *
 * @author kevinWang
 * @since 2018-09-29
 */
@RestController
@RequestMapping("/sysScheduleJobLog")
@Api(value = "定时任务日志", description = "定时任务日志")
public class SysScheduleJobLogController extends BaseController {
    @Reference(check = false)
    private SysScheduleJobLogService service;

    /**
     * 根据定时任务日志ID查询
     *
     * @param id 定时任务日志ID
     * @return ResultModel
     * @author kevinWang
     * @date 2018-09-29
     */
    @ApiOperation(value = "查询定时任务日志", notes = "根据主键ID查询定时任务日志")
    @ApiImplicitParam(name = "id", value = "定时任务日志ID", required = true, dataType = "Long")
    @GetMapping("/query/{id}")
    @RequiresPermissions("ump:jobLog:read")
    public ResultModel query(@PathVariable Long id) {
        Assert.notNull(id);
        SysScheduleJobLogModel entity = service.selectById(id);
        return ResultUtil.ok(entity);
    }

    /**
     * 查询定时任务日志分页方法
     *
     * @param pageModel 分页实体
     * @return com.jww.common.web.model.ResultModel
     * @author kevinWang
     * @date 2018-09-29
     */
    @ApiOperation(value = "分页查询定时任务日志", notes = "根据主键ID查询定时任务日志")
    @PostMapping("/queryListPage")
    @RequiresPermissions("ump:jobLog:read")
    public ResultModel queryListPage(@RequestBody PageModel<SysScheduleJobLogModel> pageModel, SysScheduleJobLogModel sysScheduleJobLogModel) {
        EntityWrapper<SysScheduleJobLogModel> wrapper = new EntityWrapper<>(sysScheduleJobLogModel);
        pageModel = (PageModel<SysScheduleJobLogModel>) service.selectPage(pageModel, wrapper);
        return ResultUtil.ok(pageModel);
    }

    /**
     * 新增定时任务日志方法
     *
     * @param entity 定时任务日志实体
     * @return com.jww.common.web.model.ResultModel
     * @author kevinWang
     * @date 2018-09-29
     */
    @ApiOperation(value = "新增定时任务日志", notes = "根据定时任务日志实体新增定时任务日志")
    @PostMapping("/add")
    @RequiresPermissions("ump:jobLog:edit")
    @SysLogOpt(module = "定时任务日志管理", value = "定时任务日志新增", operationType = Constants.LogOptEnum.ADD)
    public ResultModel add(@Valid @RequestBody SysScheduleJobLogModel entity) {
        if (entity != null) {
            entity.setCreateBy(this.getCurrentUserId());
            entity.setUpdateBy(this.getCurrentUserId());
        }
        return ResultUtil.ok(service.add(entity));
    }

    /**
     * 修改定时任务日志方法
     *
     * @param entity 定时任务日志实体
     * @return com.jww.common.web.model.ResultModel
     * @author kevinWang
     * @date 2018-09-29
     */
    @ApiOperation(value = "修改定时任务日志", notes = "根据主键ID修改定时任务日志")
    @PostMapping("/modify")
    @RequiresPermissions("ump:jobLog:edit")
    @SysLogOpt(module = "定时任务日志管理", value = "定时任务日志修改", operationType = Constants.LogOptEnum.MODIFY)
    public ResultModel modify(@RequestBody SysScheduleJobLogModel entity) {
        entity.setUpdateBy(this.getCurrentUserId());
        entity.setUpdateTime(new Date());
        service.modifyById(entity);
        return ResultUtil.ok();
    }

    /**
     * 批量删除定时任务日志方法
     *
     * @param ids 定时任务日志ID集合
     * @return com.jww.common.web.model.ResultModel
     * @author kevinWang
     * @date 2018-09-29
     */
    @ApiOperation(value = "批量删除定时任务日志", notes = "根据主键ID集合批量删除定时任务日志")
    @DeleteMapping("/delBatchByIds")
    @RequiresPermissions("ump:jobLog:edit")
    @SysLogOpt(module = "定时任务日志管理", value = "定时任务日志批量删除", operationType = Constants.LogOptEnum.DELETE)
    public ResultModel delBatchByIds(@RequestBody Long[] ids) {
        Assert.notNull(ids);
        return ResultUtil.ok(service.deleteBatchIds(Arrays.asList(ids)));
    }
}

