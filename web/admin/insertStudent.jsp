<%--
  Created by IntelliJ IDEA.
  User: FJ
  Date: 2019/5/26
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String ctx = request.getContextPath();
    pageContext.setAttribute("ctx", ctx);
%>
<html>
<head>
    <title>Title</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="${ctx}/layui/layui.js"></script>

    <link rel="stylesheet" href="${ctx}/layui/css/layui.css">
</head>
<body>
<form class="layui-form" action="${ctx}/StudentServlet?action=insertStudent" method="post">
    <div>
        <h1 style="color: red;text-align: center">${error}</h1>
    </div>
    <div class="layui-form-item" style="text-align: center">
        <div class="layui-input-block">
            <img src="${ctx}/res/image/headphoto/man.png">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">ID</label>
        <div class="layui-input-block">
            <input type="text" name="id" class="layui-input" required lay-verify="required" placeholder="请输入用户名"
                   autocomplete="off"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="password" name="password" class="layui-input" required lay-verify="required"
                   placeholder="请输入密码"
                   autocomplete="off"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input type="text" name="name" class="layui-input" required lay-verify="required" placeholder="请输入姓名"
                   autocomplete="off"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="男" title="男" required lay-verify="required">
            <input type="radio" name="sex" value="女" title="女" required lay-verify="required">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">年龄</label>
        <div class="layui-input-block">
            <input type="number" name="age" class="layui-input" required lay-verify="required" placeholder="请输入年龄"
                   autocomplete="off"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">院系</label>
        <div class="layui-input-block">
            <select id="department" name="department" required lay-verify="required" lay-filter="department">
                <option value="">请选择</option>
                <c:forEach items="${allDepartment}" var="department">
                    <option value="${department.name}">${department.name}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">班级</label>
        <div class="layui-input-block">
            <select id="sClass" name="sclass" lay-verify="required">
                <option value=""></option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-block">
            <input type="number" name="phone" class="layui-input" placeholder="请输入手机号"
                   autocomplete="off"/>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block login-btn">
            <button class="layui-btn layui-btn-lg" lay-submit lay-filter="loginForm">确定</button>
        </div>
    </div>
</form>

<script>
    layui.use(['layer', 'jquery', 'element', 'form'], function () {
        var layer = layui.layer
            , $ = layui.jquery
            , element = layui.element
            , form = layui.form;
        //监听提交
        form.on('select(department)', function (data) {
            var department = $('#department').val();
            $.ajax({
                url: "<%=request.getContextPath()%>/SClassServlet?department=" + department,//请求地址
                type: "POST",//请求方式
                dataType: "json",//返回数据类型
                contentType: "application/json",
                async: false,//同步
                success: function (result) {
                    var data = result;
                    var proHtml = '';
                    for (var o in data) {
                        proHtml += '<option value="' + data[o] + '">' + data[o] + '</option>';
                    }
                    $("#sClass").html(proHtml);
                },
                error: function () {
                    alert("fail");
                }
            });
            form.render('select');
        });
    });

</script>
</body>
</html>
