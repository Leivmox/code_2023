
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
