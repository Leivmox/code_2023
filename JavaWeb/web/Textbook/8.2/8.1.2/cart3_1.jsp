<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Leivzy
  Date: 2023/11/7
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    ArrayList books = new ArrayList();
    //向books中添加
    books.add("三国演义");
    books.add("西游记");
    books.add("水浒传");
    //将books放入session
    session.setAttribute("books", books);

%>

<a href="cart3_2.jsp">查看购物车</a>
</body>
</html>
