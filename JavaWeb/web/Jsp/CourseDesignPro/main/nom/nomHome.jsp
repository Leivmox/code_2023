<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/28
  Time: 10:40
  To change this template use File | Settings | File Templates.
  普通用户的主页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>主页</title>
    <link rel="stylesheet" href="../../css/home.css">
</head>
<%
    //==========判断是否已经登录==========//
    String account = (String) session.getAttribute("account");
    if (account == null) {
        // 如果未登录，重定向回错误页面
        response.sendRedirect("../../jumpJsp/Error1.jsp");
        return;
    }


    //从session中获取用户id、name、password
    String id = (String) session.getAttribute("id");
    String name = (String) session.getAttribute("name");
    String password = (String) session.getAttribute("password");

%>
<body>
<h1>欢迎登录图书管理系统</h1>
<form class="button-form" action="#">
    <p>当前用户：<%=name%></p>
    <div class="button-container">
        <a class="button" href="books/books.jsp">借阅图书</a>
        <a class="button" href="books/mybooks.jsp">我的图书</a>
        <a class="button" href="../share/editProfile.jsp?nomID=<%=id%>&nomName=<%=name%>&nomPassword=<%=password%>&nomAccount=<%=account%>">修改资料</a>
        <a class="button" href="../main.html">退出登录</a>
    </div>
</form>
</body>
</html>
