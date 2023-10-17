<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/10/16
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
//获得number
  String str = request.getParameter("number");
  int number = Integer.parseInt(str);
           %>
该数字的立方为：<%= number*number*number%>
<hr>

</body>
</html>
