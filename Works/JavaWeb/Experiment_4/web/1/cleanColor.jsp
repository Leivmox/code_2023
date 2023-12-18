<%--
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
    <title>Clear Color Selection</title>
</head>
<body>
<h1>Clear Color Selection</h1>

<%-- 删除名为 "selectedColor" 的 Cookie --%>
<%
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("selectedColor")) {
                cookie.setMaxAge(0); // 将 Cookie 过期时间设为 0，即立即删除
                response.addCookie(cookie); // 将更新后的 Cookie 添加到响应中
                break;
            }
        }
    }
%>

<p>Color selection cleared successfully.</p>

<a href="welcome.jsp">Back to Welcome Page</a>
</body>
</html>