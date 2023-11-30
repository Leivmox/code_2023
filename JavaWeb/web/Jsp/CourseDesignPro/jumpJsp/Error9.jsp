<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/29
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
</head>
<body>
<%
    String from = (String) session.getAttribute("from");
%>
<script type="text/javascript">
    window.alert("账号密码不能为空！");
    window.document.location.href = "../main/mng/user/manageUser.jsp"
</script>
</body>
</html>
