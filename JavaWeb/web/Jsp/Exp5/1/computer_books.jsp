<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/15
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Computer Books</title>
</head>
<body>
<h1>计算机类图书</h1>
<a href="history_books.jsp">查看历史类图书</a>

<ul>
    <li>书名: 《JavaWeb程序设计》 | 价格:49￥  <a href="addToCart.jsp?book=《JavaWeb程序设计》&price=49">添加到购物车</a></li>
    <li>书名: 《算法与数据结构》 | 价格:37￥  <a href="addToCart.jsp?book=《算法与数据结构》&price=37">添加到购物车</a></li>
    <li>书名: 《计算机组成原理》 | 价格:35￥  <a href="addToCart.jsp?book=《计算机组成原理》&price=35">添加到购物车</a></li>
    <li>书名: 《算法导论》 | 价格:64￥  <a href="addToCart.jsp?book=《算法导论》&price=64">添加到购物车</a></li>
    <li>书名: 《Linux从入门到入土》 | 价格:56￥  <a href="addToCart.jsp?book=《Linux从入门到入土》&price=56">添加到购物车</a></li>
    <!-- 可以根据需要添加更多计算机图书 -->
</ul>

<a href="viewCart.jsp">查看购物车</a>
</body>
</html>
