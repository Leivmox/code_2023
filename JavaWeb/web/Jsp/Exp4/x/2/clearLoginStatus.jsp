<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/14
  Time: 23:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Clear Login Status</title>
</head>
<body>
<h1>Clear Login Status</h1>

<%-- 删除名为 "loggedInUser" 的 Session 属性 --%>
<%
    session.removeAttribute("loggedInUser");
%>

<p>Login status cleared successfully.</p>

<a href="login.jsp">Back to Login Page</a>
</body>
</html>