<%--
  Created by IntelliJ IDEA.
  User: Leivzy
  Date: 2023/11/3
  Time: 15:44
  To change this template use File | Settings | File Templates.
  注册的实现页面
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

    //获取注册表单传入的内容
    String account = request.getParameter("account");
    String password = request.getParameter("password");
    String name = request.getParameter("name");

    //判断是否有传入值，无传入值则跳转到错误页面（跳转在最底下）
    if (account != null && !account.isEmpty()) {

        //查询数据库中是否存在相同的account
        Statement stat = con.createStatement();
        String sql = "SELECT account FROM user WHERE account='" + account + "'";
        ResultSet rs = stat.executeQuery(sql);

        if (rs.next()) {//如果存在，则弹出警告窗口并跳转回主页面
%>
<script type="text/javascript">
    window.alert("已存在该用户");
    window.document.location.href = "main.html"
</script>
<%
} else {//执行注册

    //获取数据库中用户数量 userCount
    String countQuery = "SELECT COUNT(*) AS userCount FROM user";
    ResultSet countResult = stat.executeQuery(countQuery);
    int userCount = 0;
    int newUserID = 0;
    if (countResult.next()) {
        userCount = countResult.getInt("userCount");
        //将新用户ID按顺序增加
        newUserID = userCount + 1;
    }
    String sql1 = "INSERT INTO user(ID, name, password, type, count, account) VALUES (" + newUserID + ", '" + name + "', '" + password + "', 'nom',0, '" + account + "')";
    int i = stat.executeUpdate(sql1);
    //弹出成功提示并跳转回main页面
%>
<script>
    type = "text/javascript" >
        window.alert("成功");
    window.document.location.href = "main.html";
</script>
<%
        }
    } else {
        //（if判断在最开始）若未接收到注册表单的值（即未按照正确步骤打开此页面），跳转到回主页
        response.sendRedirect("main.html");
    }
%>
</body>