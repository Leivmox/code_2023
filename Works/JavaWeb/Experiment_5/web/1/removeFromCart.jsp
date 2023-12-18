
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
%>
