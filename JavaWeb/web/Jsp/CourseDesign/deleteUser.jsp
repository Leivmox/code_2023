<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/30
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<html>
<head>
    <title>删除用户</title>
</head>
<body>
<%
    //==========判断是否已经登录==========//
    String account = (String) session.getAttribute("account");
    if (account == null || !account.equals("Admin")) {
        // 如果未登录，重定向回错误页面
        response.sendRedirect("jumpJsp/Error1.jsp");
    }

    //获取用户id
    String userID = request.getParameter("nomID");

    Dao dao = new Dao();//创建Dao对象
    Connection con = dao.connection();//获得连接对象

    Statement stat = con.createStatement();
    String sql ="DELETE FROM user WHERE id = '"+userID+"'";

    int i =stat.executeUpdate(sql);
    if (i >= 1) {
        response.sendRedirect("jumpJsp/success3.jsp");
    }
%>
<script type="text/javascript">
    window.alert("删除失败！")
    window.document.location.href = "manageUser.jsp";
</script>
</body>
</html>
