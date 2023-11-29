<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/28
  Time: 11:09
  To change this template use File | Settings | File Templates.
  管理我的借阅
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>管理借阅</title>
</head>
<body>
<%
    String userID = (String) session.getAttribute("id");
    String account = (String) session.getAttribute("account");

    if (account == null) {
        // 如果未登录，重定向回错误页面
        response.sendRedirect("jumpJsp/Error1.jsp");
    }



%>
</body>
</html>
