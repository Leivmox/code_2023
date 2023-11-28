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
    String sql =
            "SELECT account,password,type,name,ID,count FROM user";
    ResultSet rs = stat.executeQuery(sql);
    while (rs.next()) {
        String d_account = rs.getString("account");//获取数据库的账号
        String d_password = rs.getString("password");//获取数据库中的密码
        String d_type = rs.getString("type");//获取数据库中的用户类型
        String d_id= rs.getString("ID");//获取数据库中的
        String d_name = rs.getString("name");//获取数据库中的
        int d_count = rs.getInt("count");//获取数据库中的
        if (d_account.equals(account) && d_password.equals(password)) {//判断表单和数据库中的账号密码是否相等

            //储存用户数据
            session.setAttribute("account", d_account);
            session.setAttribute("password",d_password);
            session.setAttribute("type",d_type);
            session.setAttribute("id",d_id);
            session.setAttribute("name",d_name);
            session.setAttribute("count",d_count);
            //判断是否为管理员用户
            if (d_type.equals("nom")) {
                response.sendRedirect("nomHome.jsp");
            }
            if (d_type.equals("mng")) {
                response.sendRedirect("mngHome.jsp");
            }
        }
    }
%>
<script type="text/javascript">//不相等则弹出警告并跳转回main.html
window.alert("账号或者密码错误");
window.document.location.href = "main.html";
</script>
</body>
</html>