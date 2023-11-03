<%--
  Created by IntelliJ IDEA.
  User: Leivzy
  Date: 2023/11/3
  Time: 15:44
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
<%
    Dao dao = new Dao();//创建Dao对象
    Connection con = dao.connection();//获得连接对象

    String text=request.getParameter("account");
    String password=request.getParameter("password");

    Statement stat = con.createStatement();
    String sql=
            "SELECT text FROM T_LOGIN";
    ResultSet rs = stat.executeQuery(sql);
    while(rs.next()){
        String text1 = rs.getString("text");
        out.println(text1);
        if(text1.equals(text))
        {
%>
<jsp:forward page="fail.html"></jsp:forward>
<%
        }
    }

    String sql1 = "INSERT INTO t_login(text,password,sign) VALUES("+text+","+password+",0)";
    int i=stat.executeUpdate(sql1);
%>
<jsp:forward page="succes.html"></jsp:forward>

</body>
</html>
