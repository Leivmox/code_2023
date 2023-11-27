<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/15
  Time: 18:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>loginValidationtitle</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");


    // 验证用户名和密码是否相等
    if (username.equals(password)) {
        // 将登录状态存储到 Session
        session.setAttribute("username",username);
        // 重定向到欢迎页面
        response.sendRedirect("welcome.jsp");
    } else {
        // 登录失败，重定向回登录页面
       response.sendRedirect("loginValidation.jsp");
    }


%>
</body>
</html>
