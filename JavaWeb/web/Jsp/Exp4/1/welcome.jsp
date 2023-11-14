<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/14
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String selectedColor = request.getParameter("color");

// 检查用户是否选择了颜色，如果选择了则创建一个持久性 Cookie
    if (selectedColor != null && !selectedColor.isEmpty()) {
        Cookie colorCookie = new Cookie("selectedColor", selectedColor);
        colorCookie.setMaxAge(3600); // 设置 Cookie 存活时间为一小时（以秒为单位）
        response.addCookie(colorCookie); // 将 Cookie 添加到响应中
    }

// 检查是否存在名为 "selectedColor" 的 Cookie，如果存在则获取存储的颜色
    String savedColor = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("selectedColor")) {
                savedColor = cookie.getValue();
                break;
            }
        }
    }

// 如果存在存储的颜色，则将其用作背景色；否则使用默认颜色
    if (savedColor == null || savedColor.isEmpty()) {
        savedColor = selectedColor; // 默认颜色
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
<h1>欢迎!</h1>
<!-- 其他欢迎页面的内容 -->
</body>
</html>