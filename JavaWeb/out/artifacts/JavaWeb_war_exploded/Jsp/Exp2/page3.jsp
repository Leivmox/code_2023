<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/10/18
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  String acc = request.getParameter("acc");
  String name = request.getParameter("name");
  out.print(acc + " " + name);
%>
</body>
</html>
