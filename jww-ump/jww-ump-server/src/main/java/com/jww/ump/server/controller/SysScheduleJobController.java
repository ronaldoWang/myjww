package com.jww.ump.server.controller;


import cn.hutool.core.lang.Assert;
import com.jww.common.core.Constants;
import com.jww.common.core.model.PageModel;
import com.jww.common.web.BaseController;
import com.jww.common.web.model.ResultModel;
import com.jww.common.web.util.ResultUtil;
import com.jww.ump.model.SysScheduleJobModel;
import com.jww.ump.rpc.api.SysScheduleJobService;
import com.jww.ump.server.annotation.SysLogOpt;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.Date;

/**
 * <p>
 * 定时任务前端控制器
 * </p>
 *
 * @author kevinWang
 * @since 2018-09-18
 */
@RestController
@RequestMapping("/sysScheduleJob")
@Api(value = "定时任务", description = "定时任务")
public class SysScheduleJobController extends BaseController {
    @Autowired
    private SysScheduleJobService service;

    /**
     * 根据定时任务ID查询
     *
     * @param id 定时任务ID
     * @return ResultModel
     * @author kevinWang
     * @date 2018-09-18
     */
    @ApiOperation(value = "查询定时任务", notes = "根据主键ID查询定时任务")
    @ApiImplicitParam(name = "id", value = "定时任务ID", required = true, dataType = "Long")
    @GetMapping("/query/{id}")
    @RequiresPermissions("ump:job:read")
    public ResultModel query(@PathVariable Long id) {
        Assert.notNull(id);
        SysScheduleJobModel entity = service.selectById(id);
        return ResultUtil.ok(entity);
    }

    /**
     * 查询定时任务分页方法
     *
     * @param pageModel 分页实体
     * @return com.jww.common.web.model.ResultModel
     * @author kevinWang
     * @date 2018-09-18
     */
    @ApiOperation(value = "分页查询定时任务", notes = "根据主键ID查询定时任务")
    @PostMapping("/queryListPage")
    @RequiresPermissions("ump:job:read")
    public ResultModel queryListPage(@RequestBody PageModel<SysScheduleJobModel> pageModel) {
        pageModel = (PageModel<SysScheduleJobModel>) service.selectPage(pageModel);
        return ResultUtil.ok(pageModel);
    }

    /**
     * 新增定时任务方法
     *
     * @param entity 定时任务实体
     * @return com.jww.common.web.model.ResultModel
     * @author kevinWang
     * @date 2018-09-18
     */
    @ApiOperation(value = "新增定时任务", notes = "根据定时任务实体新增定时任务")
    @PostMapping("/add")
    @RequiresPermissions("ump:job:edit")
    @SysLogOpt(module = "定时任务管理", value = "定时任务新增", operationType = Constants.LogOptEnum.ADD)
    public ResultModel add(@Valid @RequestBody SysScheduleJobModel entity) {
        if (entity != null) {
            entity.setCreateBy(this.getCurrentUserId());
            entity.setUpdateBy(this.getCurrentUserId());
        }
        return ResultUtil.ok(service.add(entity));
    }

    /**
     * 修改定时任务方法
     *
     * @param entity 定时任务实体
     * @return com.jww.common.web.model.ResultModel
     * @author kevinWang
     * @date 2018-09-18
     */
    @ApiOperation(value = "修改定时任务", notes = "根据主键ID修改定时任务")
    @PostMapping("/modify")
    @RequiresPermissions("ump:job:edit")
    @SysLogOpt(module = "定时任务管理", value = "定时任务修改", operationType = Constants.LogOptEnum.MODIFY)
    public ResultModel modify(@RequestBody SysScheduleJobModel entity) {
        entity.setUpdateBy(this.getCurrentUserId());
        entity.setUpdateTime(new Date());
        service.modifyById(entity);
        return ResultUtil.ok();
    }

    /**
     * 批量删除定时任务方法
     *
     * @param ids 定时任务ID集合
     * @return com.jww.common.web.model.ResultModel
     * @author kevinWang
     * @date 2018-09-18
     */
    @ApiOperation(value = "批量删除定时任务", notes = "根据主键ID集合批量删除定时任务")
    @DeleteMapping("/delBatchByIds")
    @RequiresPermissions("ump:job:edit")
    @SysLogOpt(module = "定时任务管理", value = "定时任务批量删除", operationType = Constants.LogOptEnum.DELETE)
    public ResultModel delBatchByIds(@RequestBody Long[] ids) {
        Assert.notNull(ids);
        return ResultUtil.ok(service.deleteBatchIds(Arrays.asList(ids)));
    }

    /**
     * 立即执行任务
     */
    @RequestMapping("/run")
    @RequiresPermissions("ump:job:edit")
    public ResultModel run(@RequestBody Long[] jobIds) {
        service.run(jobIds);
        return ResultUtil.ok();
    }

    /**
     * 暂停定时任务
     */
    @RequestMapping("/pause")
    @RequiresPermissions("ump:job:edit")
    public ResultModel pause(@RequestBody Long[] jobIds) {
        service.pause(jobIds);
        return ResultUtil.ok();
    }

    /**
     * 恢复定时任务
     */
    @RequestMapping("/resume")
    @RequiresPermissions("sys:schedule:resume")
    public ResultModel resume(@RequestBody Long[] jobIds) {
        service.resume(jobIds);
        return ResultUtil.ok();
    }
}

