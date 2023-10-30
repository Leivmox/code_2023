<%--
  Created by IntelliJ IDEA.
  User: Leivzy
  Date: 2023/10/30
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%

    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String age = request.getParameter("age");

    Dao dao = new Dao();//创建Dao对象
    Connection con = dao.connection();//获得连接对象
    String tableName = "test";//数据库中的一个表的表名

    String sql = "INSERT INTO test(id,name,age) VALUES(?,?,?)";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, id);
    ps.setString(2, name);
    ps.setString(3, age);
    int i = ps.executeUpdate();
    out.println("成功添加" + i + "行");
    ps.close();
    con.close();


//    Statement stat = con.createStatement();
//
//    request.setCharacterEncoding("utf-8");
//    String sql = "INSERT INTO test(id,name,age) VALUES('4','赵六','15')";
//    int i = stat.executeUpdate(sql);
//    out.println("成功添加" + i + "行");
//    stat.close();
//    con.close();
%>

</body>
</html>
