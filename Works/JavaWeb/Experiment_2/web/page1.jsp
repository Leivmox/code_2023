
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String acc = request.getParameter("account");
%>

<form name="form2" action="page2.jsp" method="post">
    <input type="hidden" name="acc" value=<%= acc %>>
    请输入姓名: <input name="name" type="text"><br>
    <input type="submit" value="提交">
</form>
</body>
</html>
