<%--
  Created by IntelliJ IDEA.
  User: Leivzy
  Date: 2023/11/3
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<body>
<%
    Dao dao = new Dao();//创建Dao对象
    Connection con = dao.connection();//获得连接对象

    //获取表单内容
    String account = request.getParameter("account");
    String password = request.getParameter("password");
    String name = request.getParameter("name");

    //判断是否有传入值，无传入值则跳转到错误页面
    if (account != null && !account.isEmpty()) {

        Statement stat = con.createStatement();
        String sql = "SELECT account FROM user";
        ResultSet rs = stat.executeQuery(sql);
        while (rs.next()) {
            String account2 = rs.getString("account");
            if (account2.equals(account)) {
//                response.sendRedirect("fail.jsp");
//                request.getRequestDispatcher("fail.jsp").forward(request, response);
%>
<script type="text/javascript">//不相等则弹出警告并跳转回main.html
window.alert("已存在该用户");
window.document.location.href = "main.html"
</script>
<%


        }
    }
    String countQuery = "SELECT COUNT(*) AS userCount FROM user";

    //获取数据库中用户数量
    ResultSet countResult = stat.executeQuery(countQuery);
    int userCount = 0;
    int newUserID = 0;
    if (countResult.next()) {
        userCount = countResult.getInt("userCount");
        newUserID = userCount + 1;//将新用户ID按顺序增加
    }
    String sql1 = "INSERT INTO user(ID, name, password, type, count, account) VALUES (" + newUserID + ", '" + name + "', '" + password + "', 'nom',0, '" + account + "')";
//
//
//        String sql1 = "INSERT INTO user(ID,name,password,type,count,account) VALUES("+newUserID+","+name+","+password+","+nom+","+account+")";
    int i = stat.executeUpdate(sql1);
    //跳转到成功页面
//        response.sendRedirect("succes.jsp");
//        request.getRequestDispatcher("succes.jsp").forward(request, response);
%>
< script
type = "text/javascript" >//不相等则弹出警告并跳转回main.html
    window.alert("成功");
window.document.location.href = "main.html";
</script
<%
    } else {

        //若未接收到表单的值（即未按照正确步骤打开此页面），跳转到回主页
        response.sendRedirect("main.html");
//        request.getRequestDispatcher("main.html").forward(request, response);

    }
%>
</body>