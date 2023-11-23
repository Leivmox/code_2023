<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/14
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<form action="loginValidation.jsp" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username"><br><br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password"><br><br>

    <label for="keepLoggedIn">Keep me logged in:</label>
    <input type="checkbox" id="keepLoggedIn" name="keepLoggedIn" value="true"><br><br>

    <input type="submit" value="Login">
</form>
</body>
</html>