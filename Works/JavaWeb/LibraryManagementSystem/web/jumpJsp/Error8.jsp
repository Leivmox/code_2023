
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
    window.alert("错误！");
    window.document.location.href = "../main/mng/books/manageBooks.jsp"
</script>
</body>
</html>
