<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/12/11
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="beans.Student" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Student stu = new Student();
    stu.setSex("man");
    session.setAttribute("stu", stu);

%>
${sessionScope.stu.sex}
</body>
</html>
