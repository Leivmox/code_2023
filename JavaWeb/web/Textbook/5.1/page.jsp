<%--
  Created by IntelliJ IDEA.
  User: Leivzy
  Date: 2023/10/16
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
  String str = request.getParameter("account");
  out.println(str);
%>
</body>
</html>
