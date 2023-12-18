
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//     检查用户是否已经登录，如果没有则重定向到登录页面
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
<h1>欢迎！用户: <%= session.getAttribute("username") %>!</h1>
<!-- 其他欢迎页面的内容 -->
</body>
</html>