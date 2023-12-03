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
    <title>借阅</title>
    <link rel="stylesheet" href="../../../css/styles5.css">
</head>
<body>
<%
    //==========判断是否已经登录==========//
    String account = (String) session.getAttribute("account");
    if (account == null) {
        // 如果未登录，重定向到错误页面
        response.sendRedirect("../../../jumpJsp/Error1.jsp");
        return;
    }
%>
<%--定义图书表格的开头--%>
<table border="1" class="custom-table">
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
    //获取session中的用户id
    String userID = (String) session.getAttribute("id");


    Dao dao = new Dao();//创建Dao对象
    Connection con = dao.connection();//获得连接对象

    Statement  stat= con.createStatement();
    Statement  stat2= con.createStatement();

    //定义sql语句：查询books表所有元素
    String sql = "SELECT * FROM books";
    //定义sql语句：查询borrow表中，userID为“userID”的所有元素
    String sql2 = "SELECT BOOKID FROM borrow WHERE userID='"+ userID +"'";

    ResultSet rs =stat.executeQuery(sql);//执行sql语句，并将获取到值放入rs集合


//==========通过循环，将rs集合中（数据库中）的值取出来并放到表格中==========//
  while (rs.next()) {
    String no = rs.getString("BOOKNUM");//获取数据库中本次循环得到的的图书编号
    String name = rs.getString("BOOKNAME");//获取数据库中本次循环得到的图书名称
    String author= rs.getString("AUTHOR");//获取数据库中本次循环得到的图书作者
    String price= rs.getString("PRICE");//获取数据库中本次循环得到的图书价格

    //==========实现显示“借阅状态”的功能==========//
    //声明一个status，初始化为“借阅状态”为“可借阅”
    String status = "可借阅○";
    ResultSet rs2 =stat2.executeQuery(sql2);//执行查询语句sql2，将查询到的bookID放入rs2
    while (rs2.next()){
        String bookID = rs2.getString("BOOKID");//判断该userID是否已经借阅该图书
        if (bookID.equals(no)){//no为52行获取到的BookNum
            status = "已借阅✓";//将“借阅状态”改为“已借阅”
        }
    }

%>
    <%--||循环表格||，该表格 仍包含在上面的jsp中的while循环中--%>
    <tr>
        <td><%=no%></td>
        <td>《<%=name%>》</td>
        <td><%=author%></td>
        <td><%=price%>￥</td>
        <td><%=status%></td>
        <%--创建链接，点击链接跳转到horrowHandle.jsp页，并发送no和name的值--%>
        <td class="special-td"> <a class="custom-button"
                                   href="borrowHandle.jsp?no=<%=no%>&name=<%=name%>">借阅</a>
        </td>
    </tr>
        <%
    }
%>
<%--//返回链接--%>
<%--    <a href="nomHome.jsp">返回</a>--%>
</table>
<div class="button-container">
<%--    <button class="custom-button" >按钮1</button>--%>
    <a class="custom-button" href="../nomHome.jsp">返回</a>
</div>
</body>
</body>
</html>
