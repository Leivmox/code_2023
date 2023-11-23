<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/14
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Clear Color Selection</title>
</head>
<body>
<h1>Clear Color Selection</h1>

<%-- 清除保存的颜色选择 --%>
<% session.removeAttribute("selectedColor"); %>

<p>Color selection cleared successfully.</p>

<a href="welcome.jsp">Back to Welcome Page</a>
</body>
</html>