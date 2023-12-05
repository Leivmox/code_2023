<%@ page import="beans.Student" %>
<%@ page import="beans.StudentDao" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/12/5
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    StudentDao studentDao = new StudentDao();
    ArrayList students = studentDao.queryAllStudents();

%>
<table border=2>
    <tr>
        <td>ID</td>
        <td>name</td>
    </tr>
    <%
        for (int i = 0; i < students.size(); i++) {
            Student student = (Student) students.get(i);
    %>
    <tr>
        <td><%=student.getStuno()%></td>
        <td><%=student.getStuname()%></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
