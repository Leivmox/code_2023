<%--
  Created by IntelliJ IDEA.
  User: Leivzy
  Date: 2023/10/26
  Time: 20:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Dao dao = new Dao();//创建Dao对象
    Connection con = dao.connection();//获得连接对象
    String tableName = "test";//数据库中的一个表的表名

    Statement stat = con.createStatement();
    String sql = "SELECT id,name FROM test WHERE age='13'";
    ResultSet rs = stat.executeQuery(sql);
    while (rs.next()) {
        String id = rs.getString("id");
        String name = rs.getString("name");
        out.println(id + " " + name + "<br>");
    }
    stat.close();
    con.close();
%>
</body>
</html>
