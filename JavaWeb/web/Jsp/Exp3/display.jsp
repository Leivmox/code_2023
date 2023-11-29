<%--
  Created by IntelliJ IDEA.
  User: Leivzy
  Date: 2023/11/3
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table align="center">
  <caption>欢迎给教师投票</caption>
  <tr bgcolor="yellow">
  <td>编号</td>
  <td>姓名</td>
  <td>得票数</td>
  <td>投票</td>
  </tr>
<%

  Dao dao = new Dao();//创建Dao对象
  Connection con = dao.connection();//获得连接对象
//  String tableName = "t_vote";//数据库中的一个表的表名

  Statement stat = con.createStatement();

  String sql = "SELECT TEACHERNO,TEACHERNAME,VOTE FROM T_VOTE";
  ResultSet rs = stat.executeQuery(sql);
  while (rs.next()) {
    String teacherno = rs.getString("TEACHERNO");
    String teachername = rs.getString("TEACHERNAME");
    int vote = rs.getInt("VOTE");
%>
  <tr bgcolor="pink">
    <td><%= teacherno%></td>
    <td><%= teachername%></td>
    <td><img src="img/bar.jpg" width="<%= vote%>" height="10"><%= vote%></td>
    <td><a href = "vote.jsp?teacherno=<%=teacherno%>">投票</a></td>
  </tr>
  <%
    }
  stat.close();
    con.close();
  %>

</table>
</body>
</html>
