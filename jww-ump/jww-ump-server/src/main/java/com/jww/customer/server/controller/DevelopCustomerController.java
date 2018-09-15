package com.jww.customer.server.controller;


import cn.hutool.core.lang.Assert;
import com.jww.common.core.Constants;
import com.jww.common.core.model.PageModel;
import com.jww.common.web.BaseController;
import com.jww.common.web.model.ResultModel;
import com.jww.common.web.util.ResultUtil;
import com.jww.customer.developcustomer.model.DevelopCustomerModel;
import com.jww.customer.developcustomer.rpc.api.DevelopCustomerService;
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
 * 待开发客户表前端控制器
 * </p>
 *
 * @author kevinWang
 * @since 2018-09-16
 */
@RestController
@RequestMapping("/developCustomer")
@Api(value = "待开发客户表", description = "待开发客户表")
public class DevelopCustomerController extends BaseController {
    @Autowired
    private DevelopCustomerService service;

    /**
    * 根据待开发客户表ID查询
    *
    * @param id 待开发客户表ID
    * @return ResultModel
    * @author kevinWang
    * @date 2018-09-16
    */
    @ApiOperation(value = "查询待开发客户表", notes = "根据主键ID查询待开发客户表")
    @ApiImplicitParam(name = "id", value = "待开发客户表ID", required = true, dataType = "Long")
    @GetMapping("/query/{id}")
    @RequiresPermissions("customer:developcustomer:read")
    public ResultModel query(@PathVariable Long id) {
        Assert.notNull(id);
        DevelopCustomerModel entity = service.selectById(id);
        return ResultUtil.ok(entity);
    }

    /**
    * 查询待开发客户表分页方法
    *
    * @param pageModel 分页实体
    * @return com.jww.common.web.model.ResultModel
    * @author kevinWang
    * @date 2018-09-16
    */
    @ApiOperation(value = "分页查询待开发客户表", notes = "根据主键ID查询待开发客户表")
    @PostMapping("/queryListPage")
    @RequiresPermissions("customer:developcustomer:read")
    public ResultModel queryListPage(@RequestBody PageModel<DevelopCustomerModel> pageModel) {
        pageModel = (PageModel<DevelopCustomerModel>) service.selectPage(pageModel);
        return ResultUtil.ok(pageModel);
    }

    /**
     * 新增待开发客户表方法
     *
     * @param entity 待开发客户表实体
     * @return com.jww.common.web.model.ResultModel
     * @author kevinWang
     * @date 2018-09-16
     */
    @ApiOperation(value = "新增待开发客户表", notes = "根据待开发客户表实体新增待开发客户表")
    @PostMapping("/add")
    @RequiresPermissions("customer:developcustomer:edit")
    @SysLogOpt(module = "待开发客户表管理", value = "待开发客户表新增", operationType = Constants.LogOptEnum.ADD)
    public ResultModel add(@Valid @RequestBody DevelopCustomerModel entity) {
        if (entity != null) {
        entity.setCreateBy(this.getCurrentUserId());
        entity.setUpdateBy(this.getCurrentUserId());
        }
        return ResultUtil.ok(service.add(entity));
    }

    /**
     * 修改待开发客户表方法
     *
     * @param entity 待开发客户表实体
     * @return com.jww.common.web.model.ResultModel
     * @author kevinWang
     * @date 2018-09-16
     */
    @ApiOperation(value = "修改待开发客户表", notes = "根据主键ID修改待开发客户表")
    @PostMapping("/modify")
    @RequiresPermissions("customer:developcustomer:edit")
    @SysLogOpt(module = "待开发客户表管理", value = "待开发客户表修改", operationType = Constants.LogOptEnum.MODIFY)
    public ResultModel modify(@RequestBody DevelopCustomerModel entity) {
        entity.setUpdateBy(this.getCurrentUserId());
        entity.setUpdateTime(new Date());
        service.modifyById(entity);
        return ResultUtil.ok();
    }

    /**
     * 批量删除待开发客户表方法
     *
     * @param ids 待开发客户表ID集合
     * @return com.jww.common.web.model.ResultModel
     * @author kevinWang
     * @date 2018-09-16
     */
    @ApiOperation(value = "批量删除待开发客户表", notes = "根据主键ID集合批量删除待开发客户表")
    @DeleteMapping("/delBatchByIds")
    @RequiresPermissions("customer:developcustomer:edit")
    @SysLogOpt(module = "待开发客户表管理", value = "待开发客户表批量删除", operationType = Constants.LogOptEnum.DELETE)
    public ResultModel delBatchByIds(@RequestBody Long[] ids) {
        Assert.notNull(ids);
        return ResultUtil.ok(service.deleteBatchIds(Arrays.asList(ids)));
    }
}

