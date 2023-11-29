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

    String account = request.getParameter("account");//获取表单的账号
    String password = request.getParameter("password");//获取表单的密码
//  Connection conn = getConnection();
    Statement stat = con.createStatement();
    String sql = "SELECT account,password,type,name,ID,count FROM user";
    ResultSet rs = stat.executeQuery(sql);
    while (rs.next()) {
        String d_account = rs.getString("account");
        String d_password = rs.getString("password");
        if (d_account.equals(account) && d_password.equals(password)) {
                response.sendRedirect("Home.jsp");
        }
    }
   String sql2 =  "SELECT account,password,type,name,ID,count FROM user WHERE account = '+account+'";
    ResultSet rs2 = stat.executeQuery(sql2);
    String d_password2 = rs.getString("password");
    if (d_password2.equals(password)) {
        response.sendRedirect("Home.jsp");
    }
%>
<script type="text/javascript">//不相等则弹出警告并跳转回main.html
window.alert("账号或者密码错误");
window.document.location.href = "main.html";
</script>
</body>
</html>