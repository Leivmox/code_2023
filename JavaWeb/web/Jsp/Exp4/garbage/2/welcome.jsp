<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/14
  Time: 23:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 检查用户是否已经登录，如果没有则重定向到登录页面
    if (session.getAttribute("loggedInUser") == null) {
        response.sendRedirect("loginValidation.jsp");
    }
%>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
<h1>Welcome, <%= session.getAttribute("loggedInUser") %>!</h1>
<!-- 其他欢迎页面的内容 -->
</body>
</html>