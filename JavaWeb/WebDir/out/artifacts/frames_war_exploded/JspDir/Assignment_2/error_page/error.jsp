<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>错误页面</title>
</head>
<body>
<h1>操作异常</h1>
<p>发生了一个操作异常，请联系管理员以获得支持。</p>
<p>异常信息：<%= exception.getMessage() %></p>
</body>
</html>
