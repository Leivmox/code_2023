<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Leivzy
  Date: 2023/11/7
  Time: 19:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="sessionLost.jsp" method="post">
    请您输入书本：<input name="book" type="text">
    <input type="submit" value="添加到购物车">
</form>
<hr>
<%
    //向session中放入一个集合对象
    ArrayList books = new ArrayList();
    session.setAttribute("books", books);
    //获得书名
    String book = request.getParameter("book");
    if (book != null) {
        book = new String(book.getBytes("UTF-8"));
        //将book加进去
        books.add(book);
    }
%>
购物车中的内容是：<br>
<%
    //遍历books
    for (int i = 0; i < books.size(); i++) {
        out.print(books.get(i)+"<br>");
    }
%>

</body>
</html>
