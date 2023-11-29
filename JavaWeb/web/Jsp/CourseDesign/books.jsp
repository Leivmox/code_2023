<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/27
  Time: 10:49
  To change this template use File | Settings | File Templates.
  借书的展示页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>Books</title>
</head>
<body>
<%--定义图书表格的开头--%>
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
    //获取session中的用户account和id
    String account = (String) session.getAttribute("account");
    String userID = (String) session.getAttribute("id");
    //判断是否已经登录
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

    ResultSet rs =stat.executeQuery(sql);//执行sql询语句，并将获取到值放入rs集合

  while (rs.next()) {//循环rs集合
    String no = rs.getString("BOOKNUM");//获取数据库中的图书编号
    String name = rs.getString("BOOKNAME");//获取数据库中的图书名称
    String author= rs.getString("AUTHOR");//获取数据库中的图书作者
    String price= rs.getString("PRICE");//获取数据库中的图书价格
    //声明一个status，初始化为“可借阅”
    String status = "可借阅";

    ResultSet rs2 =stat2.executeQuery(sql2);//执行查询语句sql2，将查询到的bookID放入rs2
    while (rs2.next()){
        String bookID = rs2.getString("BOOKID");//判断该userID是否已经借阅该图书
        if (bookID.equals(no)){//no为52行获取到的BookNum
            status = "已借阅";
        }
    }

%>
<%--    这是一个循环表格，次表格仍包含在上面的jsp中的while循环中--%>
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
<%--        创建链接，点击链接跳转到horrowHandle.jsp页，并发送no和name的值--%>
        <td><a href="borrowHandle.jsp?no=<%=no%>&name=<%=name%>">借阅</a></td>
    </tr>
        <%
    }
%>

</body>
</html>
