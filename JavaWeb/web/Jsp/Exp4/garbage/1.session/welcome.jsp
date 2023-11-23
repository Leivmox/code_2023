<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/14
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 获取用户选择的颜色
    String selectedColor = request.getParameter("color");

// 检查用户是否选择了颜色，如果选择了则存储到Session中
    if(selectedColor != null && !selectedColor.isEmpty()) {
        session.setAttribute("selectedColor", selectedColor);
    }

// 获取存储在Session中的颜色，如果没有则使用默认颜色
    String savedColor = (String) session.getAttribute("selectedColor");
    if(savedColor == null || savedColor.isEmpty()) {
        savedColor = "white"; // 默认颜色
    }
%>
<html>
<head>
    <title>Welcome</title>
    <style>
        body {
            background-color: <%= savedColor %>;
        }
    </style>
</head>
<body>
<h1>Welcome!</h1>
<!-- 其他欢迎页面的内容 -->
</body>
</html>