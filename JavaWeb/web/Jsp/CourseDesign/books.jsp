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
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
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
        <td>状态</td>
        <td>&nbsp;</td>
    </tr>
        <%
    String account = (String) session.getAttribute("account");
    String userID = (String) session.getAttribute("id");
    if (account == null) {
        // 如果未登录，重定向回登录页面
        response.sendRedirect("main.html");
    }

    Dao dao = new Dao();//创建Dao对象
    Connection con = dao.connection();//获得连接对象

    Statement  stat= con.createStatement();
    Statement  stat2= con.createStatement();
    String sql = "SELECT * FROM books";//定义一个查询语句
    String sql2 = "SELECT BOOKID FROM borrow WHERE userID='"+ userID +"'";//定义一个查询语句

    ResultSet rs =stat.executeQuery(sql);//执行查询语句

//    Set<String> borrowedBooks = new HashSet<>(); // 存储已借阅的书籍ID
//    while (rs2.next()) {
//    borrowedBooks.add(rs2.getString("BOOKID"));
//}
  while (rs.next()) {
    String no = rs.getString("BOOKNUM");
    String name = rs.getString("BOOKNAME");
    String author= rs.getString("AUTHOR");
    String price= rs.getString("PRICE");
    String status = "可借阅";
//    String status = borrowedBooks.contains(no) ? "已借阅" : "可借阅";
    ResultSet rs2 =stat2.executeQuery(sql2);//执行查询语句
    while (rs2.next()){
        String bookID = rs2.getString("BOOKID");
        if (bookID.equals(no)){
            status = "已借阅";
        }
    }

%>
    <tr>
        <td><%=no%>
        </td>
        <td><%=name%>
        </td>
        <td><%=author%>
        </td>
        <td><%=price%>
        </td>
        <td><%=status%>
        </td>
        <td><a href="borrowHandle.jsp?no=<%=no%>&name=<%=name%>">借阅</a></td>
    </tr>
        <%
    }
%>

</body>
</html>
