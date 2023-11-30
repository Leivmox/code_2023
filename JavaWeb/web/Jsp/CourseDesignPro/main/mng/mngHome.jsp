<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/28
  Time: 10:40
  To change this template use File | Settings | File Templates.
  管理员用户的主界面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../css/home.css">
</head>
<body>
<%
    //==========判断是否已经登录==========//
    String account = (String) session.getAttribute("account");
    if (account == null || !account.equals("Admin")) {
        // 如果未登录，重定向回错误页面
        response.sendRedirect("../../../jumpJsp/Error1.jsp");
        return;
    }

%>
<h1>管理系统</h1>
<form class="button-form" action="#">
    <div class="button-container">
        <a class="button" href="books/manageBooks.jsp">管理图书</a>
        <a class="button" href="user/manageUser.jsp">管理用户</a>
        <a class="button" href="../main.html">退出登录</a>
    </div>
</form>
</body>
</html>
