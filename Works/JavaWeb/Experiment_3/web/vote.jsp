
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String teacherno = request.getParameter("teacherno");

    Dao dao = new Dao();//创建Dao对象
    Connection con = dao.connection();//获得连接对象
    String tableName = "t_vote";//数据库中的一个表的表名

    Statement stat = con.createStatement();
    String sql = "UPDATE T_VOTE SET VOTE=VOTE+1 WHERE TEACHERNO=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1,teacherno);
    ps.executeUpdate();
    ps.close();
    con.close();
%>
<jsp:forward page="display.jsp"></jsp:forward>
</body>
</html>
