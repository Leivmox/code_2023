<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/27
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>login</title>
</head>
<body>
<%
    Dao dao = new Dao();//创建Dao对象
    Connection con = dao.connection();//获得连接对象

    String text = request.getParameter("account");//获取表单的账号
    String password = request.getParameter("password");//获取表单的密码
//  Connection conn = getConnection();
    session.setAttribute("user", text);
    Statement stat = con.createStatement();
    String sql =
            "SELECT account,password FROM user";
    ResultSet rs = stat.executeQuery(sql);
    while (rs.next()) {
        String text1 = rs.getString("account");//获取数据库的账号
        String password1 = rs.getString("password");//获取数据库中的密码
        if (text1.equals(text) && password1.equals(password)) {//判断表单和数据库中的账号密码是否相等
            response.sendRedirect("books.jsp");//相等则跳转到books.jsp
        }
    }
%>
<script type="text/javascript">//不相等则弹出警告并跳转回main.html
    window.alert("账号或者密码错误");
    window.document.location.href = "main.html";
</script>
</body>
</html>