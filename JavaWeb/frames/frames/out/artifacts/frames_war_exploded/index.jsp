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
  <frame src="frames/top.html" name = "top" height="20%"/>
  <frameset cols = "15%,*">
    <frame src="frames/left.html" name ="left" />
    <frameset rows="80%,*">
      <frame src="frames/main.html" name ="right"/>
  </frameset>
  </frameset>
</html></html>
