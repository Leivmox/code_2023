<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/15
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page language="java" import="javax.servlet.http.*, javax.servlet.*" %>
<%
    //添加缓存控制的头部信息，确保浏览器不会缓存这个页面
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<html>
<head>
    <title>weclome</title>
</head>
<body>
<%
    // 检查 Session 中是否存在登录状态
    String str = (String) session.getAttribute("username");
    if (str == null) {
        // 如果未登录，重定向回登录页面
        response.sendRedirect("loginValidation.jsp");
    }
%>

<h1>欢迎！</h1>
您已登录！

<form action="remove.jsp">
    <input type="submit" value="退出">
</form>

</body>
</html>
