layui.config({
    base: "../../../js/"
}).use(['base', 'form', 'layer', 'upload', 'jquery', "treecheck"], function () {
    var base = layui.base,
        form = layui.form,
        layer = parent.layer === undefined ? layui.layer : parent.layer,
        $ = layui.jquery,
        upload = layui.upload,
        submitUrl = "param/add";

    // 获取父页面的pageOperation，判断是查看、添加、修改
    if (parent.pageOperation === 1) { // 添加
    } else if (parent.pageOperation === 2) { // 修改
        submitUrl = "param/modify";
    } else { // 查看
        $(".layui-form input").prop("disabled", true);
        $('.layui-form button').hide();
    }

    if (parent.pageOperation === 2 || parent.pageOperation === 0) {
        var loadingLayer = layer.load(1, {
            shade: [0.5, '#000000']
        });
        $("#id").val(parent.checkedparamId);
        // 查询参数数据，初始化页面属性值
        $.ajax({
            type: 'POST',
            url: 'param/query',
            data: JSON.stringify(parent.checkedparamId),
            success: function (data) {
                layer.close(loadingLayer);
                if (data.code === 200) {
                    if (data.data !== null) {
                        $("#paramType").val(data.data.paramType);
                        $("#paramKey").val(data.data.paramKey);
                        $("#paramValue").val(data.data.paramValue);
                        $("#paramValueExtend").val(data.data.paramValueExtend);
                        $("#paramUrl").val(data.data.paramUrl);
                        $(':radio[name="enable"][value="' + data.data.enable + '"]').attr("checked", "checked");
                        form.render('radio');
                        $("#remark").val(data.data.remark);
                    }
                } else {
                    layer.msg(data.message, {icon: 2});
                }
            }
        });
    }
    // 监听submit
    if (parent.pageOperation === 1 || parent.pageOperation === 2) {
        form.on('submit(addFilter)', function (data) {
            var index = top.layer.msg('数据提交中，请稍候', {icon: 16, time: false, shade: 0.8});
            var form = new FormData(document.getElementById("paramForm"));
            $.post({
                type: 'POST',
                url: submitUrl,
                data: form,
                processData: false,
                contentType: false,
                success: function (data) {
                    if (data.code === 200) {
                        //弹出loading
                        setTimeout(function () {
                            top.layer.close(index);
                            top.layer.msg("操作成功！", {icon: 1});
                            layer.closeAll("iframe");
                            //刷新父页面
                            parent.location.reload();
                        }, 1000);
                    } else {
                        top.layer.close(index);
                        layer.msg(data.message, {icon: 2});
                    }
                }
            });

            // 阻止表单跳转。如果需要表单跳转，去掉这段即可。
            return false;
        });
    }

    //普通文件上传
    upload.render({
        elem: '#uploadFile'
        , accept: 'file'
        , auto: false
        , bindAction:
            '#uploadBtn'
    })
    ;
});

