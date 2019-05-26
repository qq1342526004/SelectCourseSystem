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
<form class="layui-form" action="${ctx}/StudentServlet?action=updateStudent" method="post">
    <div class="layui-form-item" style="text-align: center">
        <div class="layui-input-block">
            <img src="${ctx}/res/image/headphoto/man.png">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">ID</label>
        <div class="layui-input-block">
            <input type="text" name="id" class="layui-input" required lay-verify="required"
                   autocomplete="off" value="${stu.id}" readonly/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="password" name="password" class="layui-input" required lay-verify="required"
                   placeholder="请输入用户名"
                   autocomplete="off" value="${stu.password}"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input type="text" name="name" class="layui-input" required lay-verify="required" placeholder="请输入姓名"
                   autocomplete="off" value="${stu.name}"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="男" title="男" ${stu.sex=="男" ? "checked='checked'" : ""} >
            <input type="radio" name="sex" value="女" title="女" ${stu.sex=="女" ? "checked='checked'" : ""}>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">年龄</label>
        <div class="layui-input-block">
            <input type="number" name="age" class="layui-input" required lay-verify="required" placeholder="请输入年龄"
                   autocomplete="off" value="${stu.age}"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">院系</label>
        <div class="layui-input-block">
            <input type="text" name="department" class="layui-input" required lay-verify="required" placeholder="请输入院系"
                   autocomplete="off" value="${stu.department}"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">班级</label>
        <div class="layui-input-block">
            <input type="text" name="sClass" class="layui-input" required lay-verify="required" placeholder="请输入班级"
                   autocomplete="off" value="${stu.sClass}"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-block">
            <input type="number" name="phone" class="layui-input" required lay-verify="required" placeholder="请输入手机号"
                   autocomplete="off" value="${stu.phone}"/>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block login-btn">
            <button class="layui-btn layui-btn-lg" lay-submit lay-filter="loginForm">确定</button>
        </div>
    </div>
</form>

<script>
    layui.use('form', function () {
        var form = layui.form;
        //监听提交
        form.on('submit(loginForm)', function (data) {
            return true;
        });
    });
</script>
</body>
</html>