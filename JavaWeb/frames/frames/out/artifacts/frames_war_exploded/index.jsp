<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/9/17
  Time: 8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<frameset rows="20%,80%" frameborder="yes">
  <frame src="top.html"name = "top" height="20%"/>
  <frameset cols = "15%,*">
    <frame src="left.html" name ="left" />
    <frameset rows="80%,*">
      <frame src="main.html" name ="right"/>
    </frameset>
  </frameset>
</html></html>
