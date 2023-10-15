<%@ page language="java" contentType="text/html; charset=gb2312" %>
<html>
<body>
<%
  String stuname = request.getParameter("stuname");
  out.println("输入的查询关键字为：" + stuname);
%>
</body>
</html>
