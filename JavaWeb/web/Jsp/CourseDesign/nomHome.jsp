<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/28
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>Title</title>
</head>
<%

    String account = (String) session.getAttribute("account");
    String name = (String) session.getAttribute("name");

    if (account == null) {
        // 如果未登录，重定向回登录页面
        response.sendRedirect("main.html");
    }

%>
<body>
<h1>欢迎登录图书管理系统</h1>
当前用户：<%=name%> <br>
<a href="books.jsp">借阅图书</a><br>
<a href="mybooks.jsp">我的图书</a><br>
<a href="nomEditProfile.jsp">修改资料</a><br>
<a href="main.html">退出登录</a><br>

</body>
</html>
