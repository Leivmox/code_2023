<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Leivzy
  Date: 2023/11/7
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="handleSessionLost.jsp" method="post">
  请您输人书本：<input name="book" type="text">
  <input type="submit" value="添加到购物车">
</form>
<hr>
<%
  //从 session 获取 books ，如果为空则实例化
  ArrayList books = (ArrayList) session.getAttribute("books");
  if (books == null) {
    books = new ArrayList();
    session.setAttribute("books", books);
  }
  //获得书名
  String book = request.getParameter("book");
  if (book != null) {
    book = new String(book.getBytes("UTF-8"));
    //将 book 加进去
    books.add(book);
  }
%>
购物车中的内容是:<br>
<%
  //遍历 books
  for (int i = 0; i < books.size(); i++) {
    out.print(books.get(i) + "<br>");

  }
%>

</body>
</html>
