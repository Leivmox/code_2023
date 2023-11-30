<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/30
  Time: 19:54
  To change this template use File | Settings | File Templates.
  管理员 管理图书页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>图书管理</title>
    <link rel="stylesheet" href="../../../css/styles5.css">
</head>
<body>
<%
    //==========判断是否已经登录==========//
    String account = (String) session.getAttribute("account");
    if (account == null || !account.equals("Admin")) {
// 如果未登录，重定向回错误页面
        response.sendRedirect("../../../jumpJsp/Error1.jsp");
        return;
    }

%>

<%--定义用户表格的开头--%>
<table border="1" class="custom-table">
    <caption>图书管理</caption>
    <tr>
        <td>图书编号</td>
        <td>图书名称</td>
        <td>作者</td>
        <td>价格</td>
        <td>&nbsp;</td>
    </tr>
    <%
        Dao dao = new Dao();//创建Dao对象
        Connection con = dao.connection();//获得连接对象

        Statement stat = con.createStatement();


        //定义sql语句：查询books表所有元素
        String sql = "SELECT * FROM books ORDER BY bookNum ASC";


        ResultSet rs = stat.executeQuery(sql);//执行sql语句，并将获取到值放入rs集合


//==========通过循环，将rs集合中（数据库中）的值取出来并放到表格中==========//
        while (rs.next()) {
            String no = rs.getString("BOOKNUM");//获取数据库中本次循环得到的的图书编号
            String name = rs.getString("BOOKNAME");//获取数据库中本次循环得到的图书名称
            String author = rs.getString("AUTHOR");//获取数据库中本次循环得到的图书作者
            String price = rs.getString("PRICE");//获取数据库中本次循环得到的图书价格
    %>
    <tr>
        <td><%=no%>
        </td>
        <td>《<%=name%>》
        </td>
        <td><%=author%>
        </td>
        <td><%=price%>￥
        </td>
        <%--创建链接，点击链接跳转到horrowHandle.jsp页，并发送no和name的值--%>
        <td><a href="delete/deleteBook.jsp?no=<%=no%>">删除</a></td>
    </tr>
    <%
        }
    %>
</table>
<%--//返回链接--%>
<%--    <a href="mngHome.jsp">返回</a>--%>
<div class="button-container">
    <%--    <button class="custom-button" >按钮1</button>--%>
    <a class="custom-button" href="../mngHome.jsp">返回</a>
    <a class="custom-button" href="add/addBook.jsp">新增</a>
</div>
</body>
</html>
