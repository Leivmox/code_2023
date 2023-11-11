<%@ page language="java" import="java.sql.*" pageEncoding="gb2312" %>
<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<html>
<body>
<%
    String name = (String) session.getAttribute("user");
    String si = "0";
    String teacherno = request.getParameter("teacherno");

    Dao dao = new Dao();//创建Dao对象
    Connection con = dao.connection();//获得连接对象
    String tableName = "t_vote";//数据库中的一个表的表名
    Statement stat = con.createStatement();
    String sql1 =
            "SELECT sign FROM t_login where text= " + name + " ";
    ResultSet rs = stat.executeQuery(sql1);
    while (rs.next()) {
        String sign = rs.getString("sign");
        if (sign.equals(si)) {
            String sql =
                    "UPDATE T_VOTE SET VOTE=VOTE+1 WHERE TEACHERNO=? ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, teacherno);
            ps.executeUpdate();
            ps.close();
            String sql2 =
                    "UPDATE t_login SET sign=sign+1 WHERE text= " + name + " ";
            PreparedStatement ps1 = con.prepareStatement(sql2);
            ps1.executeUpdate();
            ps1.close();
            con.close();
%>
<jsp:forward page="display.jsp"></jsp:forward>
<%
} else {
%>
<jsp:forward page="voteno.html"></jsp:forward>
<%
        }
    }
%>

</body>
</html>
