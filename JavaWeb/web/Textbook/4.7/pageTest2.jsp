<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/10/16
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="pageTest2_error.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  //此页面会向pageTest2_error抛出异常，让其来处理
  int num1 = 10;
  int num2 = 0;
  int num3 = num1 / num2;
%>
</body>
</html>
