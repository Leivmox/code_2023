<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/30
  Time: 21:53
  To change this template use File | Settings | File Templates.
  管理员 新增图书功能逻辑的实现
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Book</title>
    <link rel="stylesheet" href="../../../../css/main.css">
</head>
<body>
<%
    //==========判断是否已经登录==========//
    String account = (String) session.getAttribute("account");
    if (account == null || !account.equals("Admin")) {
        // 如果未登录，重定向回错误页面
        response.sendRedirect("../../../../jumpJsp/Error1.jsp");
        return;
    }
%>
<h1>添加图书</h1>
<form action="addBookHandle.jsp">
    ID:<input name="id" type="text"><BR>
    书名:<input name="name" type="text"><BR>
    作者:<input name="author" type="text"><BR>
    价格:<input name="price" type="text"><BR>
    <input type="submit" value="新增">
    <input type="reset" value="清空">
    <a class="custom-button" href="../manageBooks.jsp">返回</a>
</form>
</body>
</html>
