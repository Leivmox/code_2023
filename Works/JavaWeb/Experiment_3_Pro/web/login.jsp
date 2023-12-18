
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
//  Connection conn = getConnection();
  session.setAttribute("account",text);
  Statement stat = con.createStatement();
  String sql =
          "SELECT text,password FROM T_LOGIN";
  ResultSet rs = stat.executeQuery(sql);
  while(rs.next()){
    String text1 = rs.getString("text");
    String password1 = rs.getString("password");
    if(text1.equals(text)&&password1.equals(password))
    {
%>
<jsp:forward page="display.jsp"></jsp:forward>
<%
    }
  }
%>
<script type="text/javascript" >
  window.alert("账号或者密码错误");
  window.document.location.href="main.html";
</script>
</body>
</html>
