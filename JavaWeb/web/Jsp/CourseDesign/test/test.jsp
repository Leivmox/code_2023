<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/30
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/styles2.css">
</head>
<body>
<form action="../manageUser.jsp" method="post">
    <div class="button-container">
        <a class="button" href="../books.jsp">借阅图书</a>
        <a class="button" href="../mybooks.jsp">我的图书</a>
    </div>
</form>



<%
    String userName = "Tom";
session.setAttribute("name",userName);

    String xxx = (String)session.getAttribute("name");


%>
</body>
</html>
