<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/15
  Time: 18:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Cart</title>
</head>
<body>
<h1>购物车</h1>

<ul>
    <%
        // 获取购物车内容并显示
        ArrayList cart = (ArrayList) session.getAttribute("cart");
        if (cart != null && !cart.isEmpty()) {
            for (int i = 0;i < cart.size();i++) {
    %>
    <li><%= i+1 +""+ cart.get(i)+" "%> <a href="removeFromCart.jsp?item=<%= i%>">删除</a></li>
    <%
        }
    } else {
    %>
    <li>购物车是空的</li>
    <%
        }
    %>
</ul>

<a href="history_books.jsp">回到历史类书籍</a>
<a href="computer_books.jsp">回到计算机类书籍</a>
</body>
</html>
