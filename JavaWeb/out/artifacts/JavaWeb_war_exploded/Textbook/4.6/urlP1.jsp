<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/10/16
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  //定义一个变量
  String str = "12";
  int number = Integer.parseInt(str);
%>
该数字的平方为：<%= number*number%><hr>
<a href="urlP2.jsp?number=<%= number %>" >到达p2</a>
</body>
</html>
