<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/30
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String from = (String) session.getAttribute("from");
%>
<script type="text/javascript">
    window.alert("图书信息不能为空！");
    window.document.location.href = "../manageBooks.jsp"
</script>
</body>
</html>
