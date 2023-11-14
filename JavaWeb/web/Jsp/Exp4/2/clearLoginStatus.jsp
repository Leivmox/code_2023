<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/14
  Time: 23:09
  To change this template use File | Settings | File Templates.
  这个是用来清除cookie的页面，非实验要求
  这个是用来清除cookie的页面，非实验要求
  这个是用来清除cookie的页面，非实验要求
  这个是用来清除cookie的页面，非实验要求
  这个是用来清除cookie的页面，非实验要求
  这个是用来清除cookie的页面，非实验要求
  这个是用来清除cookie的页面，非实验要求
  这个是用来清除cookie的页面，非实验要求
  这个是用来清除cookie的页面，非实验要求
  这个是用来清除cookie的页面，非实验要求
  这个是用来清除cookie的页面，非实验要求
  这个是用来清除cookie的页面，非实验要求
  这个是用来清除cookie的页面，非实验要求
  这个是用来清除cookie的页面，非实验要求
  这个是用来清除cookie的页面，非实验要求
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Clear Login Status</title>
</head>
<body>
<h1>Clear Login Status</h1>

<%-- 删除名为 "loggedInUser" 的 Session 属性 --%>
<%
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("loggedInUser")) {
                cookie.setMaxAge(0); // 将 Cookie 过期时间设为 0，即立即删除
                response.addCookie(cookie); // 将更新后的 Cookie 添加到响应中
                break;
            }
        }
    }
%>

<p>Login status cleared successfully.</p>

<a href="login.jsp">Back to Login Page</a>
</body>
</html>