<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/12/4
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>useBean</title>
</head>
<jsp:useBean id="student" class="beans.Student"></jsp:useBean>

<body>
<jsp:setProperty name="student" property="stuname" param="studentName" value="张华"/>



</body>
</html>
