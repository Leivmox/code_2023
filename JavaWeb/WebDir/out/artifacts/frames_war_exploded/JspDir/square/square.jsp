<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>平方结果</title>
</head>
<body>
<h1>平方计算结果</h1>
<%
  String numStr = request.getParameter("num");
  int num = Integer.parseInt(numStr);
  int square = num * num;
%>
<p>你选择的数字是：<%= num %></p>
<p>它的平方是：<%= square %></p>
<a href="index2.jsp">返回</a>
</body>
</html>
