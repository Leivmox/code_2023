<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>欢迎页面</title>
</head>
<body>
<h2>登录成功</h2>
<%--<% if (request.getAttribute("isMember") != null) { %>--%>
<% if (request.getParameter("isMember") != null) { %>
<p>欢迎您注册为会员</p>
<% } %>

<form action="userinfo.jsp" method="post">
  <label for="name">姓名:</label>
  <input type="text" id="name" name="name" required><br><br>

<%--  <input type="hidden" name="username" value="<%= request.getAttribute("username") %>">--%>
  <input type="hidden" name="username" value="<%= request.getParameter("username") %>">
  <input type="submit" value="提交">
</form>
</body>
</html>