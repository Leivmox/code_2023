
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String acc = request.getParameter("acc");
    String name = request.getParameter("name");
%>
<%= "账号：" + acc + "<br>"%>
<%= "姓名：" + name + "<br>"%>
</body>
</html>
