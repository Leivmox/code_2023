<%--
<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/10/15
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>第一个web</title> <!-- 标题 -->
</head>
<body>
<h1>这是我第一个web与数据库的连接</h1>

<%--  下面嵌入Java代码--%>
<%
  Dao dao = new Dao();//创建Dao对象
  Connection con = dao.connection();//获得连接对象
  String tableName = "test";//数据库中的一个表的表名
  if (con != null)
    System.out.println("数据库连接成功！");
  else
    System.out.println("数据库连接失败");
  try {
    Statement statement = con.createStatement();
    String sql = "SELECT * FROM test";//定义一个查询语句

    ResultSet rs = statement.executeQuery(sql);//执行查询语句
%>


<table border="1">
  <tr><th>ID</th><th>姓名</th><th>年龄</th></tr>

  <%
    while (rs.next()){%>
  <tr>
    <td><%=rs.getString("id")%></td><!--获取字段-->
    <td><%=rs.getString("name")%></td>
    <td><%=rs.getString("age")%></td>
  </tr>
  <% }
  }catch (Exception e){
    System.out.print("异常："+e);
  }
  %>
</table>
</body>
</html>


