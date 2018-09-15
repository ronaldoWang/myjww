package com.jww.customer.developcustomer.controller;


import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import com.jww.common.web.BaseController;
import com.jww.common.core.model.PageModel;
import com.jww.common.core.Constants;
import com.jww.common.web.model.ResultModel;
import com.jww.common.web.util.ResultUtil;
import com.jww.customer.developcustomer.model.DevelopCustomerModel;
import com.jww.customer.developcustomer.rpc.api.DevelopCustomerService;
import cn.hutool.core.lang.Assert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import javax.validation.Valid;
import java.util.Date;
import java.util.Arrays;

/**
 * <p>
 * 待开发客户表前端控制器
 * </p>
 *
 * @author kevinWang
 * @since 2018-09-15
 */
@Controller
@RequestMapping("/developCustomer")
public class DevelopCustomerController extends BaseController {
    @Autowired
    private DevelopCustomerService service;

    /**
    * 根据待开发客户表ID查询
    *
    * @param id 待开发客户表ID
    * @return ResultModel
    * @author kevinWang
    * @date 2018-09-15
    */
    @GetMapping("/query/{id}")
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
    * @date 2018-09-15
    */
    @PostMapping("/queryListPage")
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
     * @date 2018-09-15
     */
    @PostMapping("/add")
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
     * @date 2018-09-15
     */
    @PostMapping("/modify")
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
     * @date 2018-09-15
     */
    @DeleteMapping("/delBatchByIds")
    public ResultModel delBatchByIds(@RequestBody Long[] ids) {
        Assert.notNull(ids);
        return ResultUtil.ok(service.deleteBatchIds(Arrays.asList(ids)));
    }
}

