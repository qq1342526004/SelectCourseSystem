<%--
  Created by IntelliJ IDEA.
  User: FJ
  Date: 2019/5/25
  Time: 20:59
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
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="${ctx}/layui/layui.js"></script>
    <link rel="stylesheet" href="${ctx}/layui/css/layui.css">
</head>
<body>
<table class="layui-table" lay-even lay-skin="row" lay-size="lg" style="text-align: center">
    <colgroup>
        <col width="150">
        <col width="200">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th>教学任务号</th>
        <th>课程号</th>
        <th>上课地点</th>
        <th>选课人数</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${allTeachingTask}" var="teachingTask">
        <tr>
            <th>${teachingTask.teachingTaskNum}</th>
            <th>${teachingTask.courseName}</th>
            <th>${teachingTask.location}</th>
            <th>${teachingTask.totalNum}</th>
            <th style="text-align: center">
                <a href="${ctx}/SelectCourseServlet?action=showStuInfoByTTNum&teachingTaskNum=${teachingTask.teachingTaskNum}"><span
                        class="layui-badge layui-bg-blue">查看选课信息</span></a>
            </th>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>