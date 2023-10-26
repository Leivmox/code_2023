<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>用户信息</title>
</head>
<body>
<h2>用户信息</h2>
<%
  String username = request.getParameter("username");
  String name = request.getParameter("name");
%>
<p>账号: <%= username %></p >
<p>姓名: <%= name %></p >
</body>
</html>