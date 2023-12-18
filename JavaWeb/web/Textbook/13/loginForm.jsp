<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/12/12
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>loginForm</title>
</head>

<body>
Welcome!<br>
<form action="" method="post">
    account:<input type="text" name="account"><br>
    password:<input type="password" name="password"><br>
   验证码：<input type="text" name="code" size="10">
    <img border=0 src="validate.jsp"/>
    <input type="submit" value="ok">
</form>

</body>
</html>
