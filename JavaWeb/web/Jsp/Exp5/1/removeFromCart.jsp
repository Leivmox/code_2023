<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/15
  Time: 19:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%

    // 获取要删除的索引位置
    String indexToRemoveStr = request.getParameter("item");
    if (indexToRemoveStr != null && !indexToRemoveStr.isEmpty()) {
            int indexToRemove = Integer.parseInt(indexToRemoveStr);

            // 获取购物车内容并移除指定图书
        ArrayList cart = (ArrayList) session.getAttribute("cart");
                cart.remove(indexToRemove);
                session.setAttribute("cart", cart);
    }

    // 重定向回购物车页面
    response.sendRedirect("viewCart.jsp");
//    // 获取要从购物车中移除的图书信息
////    String itemToRemove = request.getParameter("item");
////    String item = URLDecoder.decode(itemToRemove, "UTF-8");
//    String i = request.getParameter("item");
//
//    // 获取购物车内容并移除指定图书
//    List<String> cart = (List<String>) session.getAttribute("cart");
//    if (cart != null) {
//        cart.remove(i);
//        session.setAttribute("cart", cart);
//    }
//
//    // 重定向回购物车页面
//    response.sendRedirect("viewCart.jsp");
%>
