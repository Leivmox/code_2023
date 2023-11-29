<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/29
  Time: 22:32
  To change this template use File | Settings | File Templates.
  还书的实现页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    //==========判断是否已经登录==========//
    String account = (String) session.getAttribute("account");
    if (account == null) {
        // 如果未登录，重定向回错误页面
        response.sendRedirect("jumpJsp/Error1.jsp");
    }


    //获取用户id、bookID、用户account
    String userID = (String) session.getAttribute("id");
    String  bookID = request.getParameter("bookID");

    Dao dao = new Dao();//创建Dao对象
    Connection con = dao.connection();//获得连接对象


    //==========将user表中本用户的count（借阅数）-1 ==========//
    Statement stat = con.createStatement();
    String countSql = "UPDATE user SET count=count-1 WHERE ID='" + userID + "'";
    int i = stat.executeUpdate(countSql);

    //==========删除本borrow表中含有 本用户 和 对应bookID 的记录==========//
    Statement stat2 = con.createStatement();
    String deleteSql = "DELETE FROM borrow WHERE bookID = '" + bookID + "' AND userID = '" + userID + "'";
    int ii = stat2.executeUpdate(deleteSql);

%>
<%--//==========最后跳转回mybooks==========//--%>
<script type="text/javascript">
    window.document.location.href = "mybooks.jsp";
</script>


</body>
</html>
