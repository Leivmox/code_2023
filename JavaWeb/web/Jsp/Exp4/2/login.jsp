<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/14
  Time: 23:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
</head>
<body>
<%= "123"%>
<%
    // Java代码段:判断是否有存在的cookie，如果有则直接跳转到welcome.jsp
    Cookie[] cookies = request.getCookies();// 获取请求中的所有cookie
    if (cookies != null) {// 如果存在cookie
%>
<%= "123"%>
<%
        for (int i = 0; i < cookies.length; i++)
//            if (cookie.getName().equals("loggedInUser") && cookie.getValue().equals("true")) {
            if (cookies[i].getName().equals("loggedInUser")) {// 检查cookie的名称是否为 "loggedInUser"
                session.setAttribute("username", cookies[i].getValue());
                response.sendRedirect("welcome.jsp");// 重定向到welcome.jsp页面
                break;
            }
    }
%>
<form id="loginForm" action="loginValidation.jsp">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br><br>

    <label for="keepLoggedInUser">Keep me logged in:</label>
    <input type="checkbox" id="keepLoggedInUser" name="keepLoggedInUser"><br><br>

    <input type="submit" value="Login">
</form>
</body>
</html>

<%--<script>--%>
<%--    function login() {--%>
<%--        var username = document.getElementById('username').value;--%>
<%--        var password = document.getElementById('password').value;--%>
<%--        var keepLoggedIn = document.getElementById('keepLoggedIn').checked;--%>

<%--        // 进行账号密码验证，此处为示例，你需要根据实际情况验证账号密码的正确性--%>
<%--        if (username === "validUsername" && password === "validPassword" && username !== "" && password !== "") {--%>
<%--            <%--%>
<%--                // Java代码段--%>
<%--                session.setAttribute("username", "validUsername");--%>

<%--                if (keepLoggedIn) {--%>
<%--            %>--%>
<%--            // 创建一个Cookie来持久化登录状态--%>
<%--            document.cookie = "loggedIn=true; max-age=" + 7 * 24 * 60 * 60;--%>
<%--            <%--%>
<%--                }--%>
<%--            %>--%>
<%--            window.location.href = "WelcomePage.jsp";--%>
<%--        } else {--%>
<%--            alert("Invalid username or password.");--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>