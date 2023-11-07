<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Leivzy
  Date: 2023/11/7
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
购物车中内容为：
<hr>
<%
  //从购物车中取出books
  ArrayList books = (ArrayList) session.getAttribute("books");
  //遍历books
  for (int i = 0; i < books.size(); i++) {
    String book = (String) books.get(i);
    out.print(book + "<br>");
  }
%>

</body>
</html>
