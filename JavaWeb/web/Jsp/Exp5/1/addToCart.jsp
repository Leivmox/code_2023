<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/15
  Time: 18:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // 获取要添加到购物车的图书名称和价格
    String book = request.getParameter("book");
    String price = request.getParameter("price");

    // 获取或创建购物车列表
    ArrayList cart = (ArrayList) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList();
    }

    // 添加图书到购物车
    String item = "书名: " + book + " | 价格: ￥" + price;
    cart.add(item);
    session.setAttribute("cart", cart);

    // 重定向回原始页面
    response.sendRedirect(request.getHeader("referer"));
%>
