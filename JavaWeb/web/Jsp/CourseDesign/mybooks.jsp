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
<table border="1" cellpadding="0">
<caption>已借阅图书</caption>
<tr>
    <td>编号</td>
    <td>书名</td>
    <td>借阅时间</td>
    <td>&nbsp;</td>
</tr>
<%
    String userID = (String) session.getAttribute("id");
    String account = (String) session.getAttribute("account");

    if (account == null) {
        // 如果未登录，重定向回错误页面
        response.sendRedirect("jumpJsp/Error1.jsp");
    }

    Dao dao = new Dao();//创建Dao对象
    Connection con = dao.connection();//获得连接对象
    Statement stat = con.createStatement();
    String sql = "SELECT * FROM borrow WHERE userID = '" + userID + "'";
    ResultSet rs = stat.executeQuery(sql);
    while (rs.next()) {
        String bookID = rs.getString("bookID");
        String bookName = rs.getString("bookName");
        java.sql.Date dateValue = rs.getDate("beginDate");
%>
<tr>
    <td><%=bookID%></td>
    <td><%=bookName%></td>
    <td><%=dateValue%></td>
    <td><a href="returningBooks.jsp?bookID=<%=bookID%>">还书</a></td>
</tr>
<%
    }
%>
    <a href="nomHome.jsp">返回</a>
</body>
</html>
