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
    //==========判断是否已经登录==========//
    String account = (String) session.getAttribute("account");
    if (account == null) {
        // 如果未登录，重定向到错误页面
        response.sendRedirect("jumpJsp/Error1.jsp");
    }
    //获取用户ID
    String userID = (String) session.getAttribute("id");

    Dao dao = new Dao();//创建Dao对象
    Connection con = dao.connection();//获得连接对象
    Statement stat = con.createStatement();
    Statement stat2 = con.createStatement();

    //定义sql语句：查询borrow表中，userID为“userID”的记录有多少条，将结果赋值到record_count中
    String sql2 = "SELECT COUNT(*) AS record_count FROM borrow WHERE userID = '"+userID+"'";
    ResultSet rs2 = stat2.executeQuery(sql2);
    //取出record_count
    int recordCount = 0;
    if (rs2.next()) {
        recordCount = rs2.getInt("record_count");
    }
%>
<table border="1" cellpadding="0">
<%--将record_count的值放入jsp表达式 ↓--%>
<caption>已借阅图书:<%=recordCount%>本</caption>
<tr>
    <td>编号</td>
    <td>书名</td>
    <td>借阅时间</td>
    <td>&nbsp;</td>
</tr>
<%
    //定义sql语句：查询userID表中，userID为“userID”的所有元素
    String sql = "SELECT * FROM borrow WHERE userID = '" + userID + "'";
    //执行sql语句，并将值赋给rs集合
    ResultSet rs = stat.executeQuery(sql);
    //通过循环，将rs集合中（数据库中）的值取出来并放到表格中
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
