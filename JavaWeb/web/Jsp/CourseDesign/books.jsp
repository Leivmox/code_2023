<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/27
  Time: 10:49
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
<body>
<table border="1" cellpadding="0">
    <caption>图书管理系统</caption>
    <tr>
        <td>编号</td>
        <td>书名</td>
        <td>作者</td>
        <td>价格</td>
    </tr>
<%
    Dao dao = new Dao();//创建Dao对象
    Connection con = dao.connection();//获得连接对象

    Statement  stat= con.createStatement();
    String sql = "SELECT * FROM books";//定义一个查询语句
    ResultSet rs =stat.executeQuery(sql);//执行查询语句
  while (rs.next()) {
    String no = rs.getString("BOOKNUM");
    String name = rs.getString("BOOKNAME");
    String author= rs.getString("AUTHOR");
    String price= rs.getString("PRICE");
%>
    <tr>
        <td><%=no%></td>
        <td><%=name%></td>
        <td><%=author%></td>
        <td><%=price%></td>
    </tr>
        <%
    }

%>

</body>
</html>
