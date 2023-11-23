<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/14
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String selectedColor = request.getParameter("color");
    if (selectedColor != null) {
        // 设置背景颜色
        out.println("<body style='background-color: " + selectedColor + ";'>");
        // 保存选择的颜色到 Session 对象
        session.setAttribute("selectedColor", selectedColor);
    } else {
        // 如果已经选择过颜色，则从 Session 中获取
        String savedColor = (String) session.getAttribute("selectedColor");
        if (savedColor != null) {
            out.println("<body style='background-color: " + savedColor + ";'>");
        } else {
            out.println("<body>");
        }
    }
%>
<%
    // 检查用户是否已登录，否则重定向到登录页面
    if (session.getAttribute("loggedInUser") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<h1>Welcome!</h1>
<!-- 其他欢迎页面的内容 -->
</body>
</html>
