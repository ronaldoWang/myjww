layui.config({
    base: "../../../js/"
}).use(['base', 'form', 'layer', 'jquery', "treecheck"], function () {
    var base = layui.base,
        form = layui.form,
        layer = parent.layer === undefined ? layui.layer : parent.layer,
        $ = layui.jquery,
        submitUrl = "sysScheduleJob/add";

    // 获取父页面的pageOperation，判断是查看、添加、修改
    if (parent.pageOperation === 1) { // 添加
    } else if (parent.pageOperation === 2) { // 修改
        submitUrl = "sysScheduleJob/modify";
    } else { // 查看
        $(".layui-form input").prop("disabled", true);
        $('.layui-form button').hide();
    }

    if (parent.pageOperation === 2 || parent.pageOperation === 0) {
        $("#id").val(parent.checkedId);
        $.ajax({
            type: 'GET',
            url: 'sysScheduleJob/query/'+parent.checkedId,
            success: function (data) {
                if (data.code === 200) {
                    if (data.data !== null) {
                        $("#taskName").val(data.data.taskName);
                        $("#beanName").val(data.data.beanName);
                        $("#methodName").val(data.data.methodName);
                        $("#params").val(data.data.params);
                        $("#cronExpression").val(data.data.cronExpression);
                        $("#status").val(data.data.status);
                        form.render('select');
                    }
                } else {
                    layer.msg(data.message, {icon: 2});
                }
            }
        });
    }

    // 监听submit
    form.on('submit(addFilter)', function (data) {
        var loadingIndex = base.loading(layer);
        $.ajax({
            type: 'POST',
            url: submitUrl,
            data: JSON.stringify(data.field),
            success: function (data) {
                layer.close(loadingIndex);
                if (data.code === 200) {
                    if (parent.pageOperation === 1) {
                        // 重置表单
                        // $("#dicForm")[0].reset();
                        top.layer.msg('添加成功', {icon: 1});
                    } else {
                        top.layer.msg('修改成功', {icon: 1});
                    }
                    layer.closeAll("iframe");
                    // 刷新父页面
                    parent.location.reload();
                } else {
                    layer.msg(data.message, {icon: 2});
                }
            }
        });

        // 阻止表单跳转。如果需要表单跳转，去掉这段即可。
        return false;
    });
});

