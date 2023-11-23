<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/14
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Color Selection</title>
</head>
<body>
<form action="welcome.jsp" method="post">
    <label for="colorSelect">Select a color:</label>
    <select name="color" id="colorSelect">
        <option value="red">Red</option>
        <option value="blue">Blue</option>
        <option value="green">Green</option>
    </select>
    <input type="submit" value="Submit">
</form>
</body>
</html>