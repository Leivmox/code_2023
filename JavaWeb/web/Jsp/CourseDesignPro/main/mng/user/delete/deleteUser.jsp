<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/30
  Time: 19:16
  To change this template use File | Settings | File Templates.
  管理员 删除用户功能逻辑的实现
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<html>
<head>
    <title>删除用户</title>
</head>
<body>
<%
    //==========判断是否已经登录==========//
    String account = (String) session.getAttribute("account");
    if (account == null || !account.equals("Admin")) {
        // 如果未登录，重定向回错误页面
        response.sendRedirect("../../../../jumpJsp/Error1.jsp");
        return;
    }

    //获取用户id
    String userID = request.getParameter("nomID");

    Dao dao = new Dao();//创建Dao对象
    Connection con = dao.connection();//获得连接对象
    con.setAutoCommit(false); // 关闭自动提交
    Statement stat = con.createStatement();
    Statement stat2 = con.createStatement();

    //==========删除user表中，id 为userID 的记录==========//
    String sql ="DELETE FROM user WHERE id = '"+userID+"'";
    int i =stat.executeUpdate(sql);

    //==========删除borrow表中，userID为userID的记录==========//
    String sql2 = "DELETE FROM borrow WHERE userID = '" + userID + "'";
    int ii = stat2.executeUpdate(sql2);

    //==========只有当所有操作成功，提交事务==========//
    if (i > 0) {
        con.commit(); // 提交事务
        // 所有操作成功，提交事务
        response.sendRedirect("../../../../jumpJsp/success3.jsp");
        return;
    }else {
        con.rollback(); // 回滚事务
        // 至少一条操作失败，回滚事务
//        System.out.println("cw");
    }
%>
<script type="text/javascript">
    window.alert("删除失败！")
    window.document.location.href = "../manageUser.jsp";
</script>
</body>
</html>
