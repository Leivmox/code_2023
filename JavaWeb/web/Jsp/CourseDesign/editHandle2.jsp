<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/30
  Time: 11:07
  To change this template use File | Settings | File Templates.
  修改用户资料的逻辑实现
  普通用户和管理员 共用页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
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

    String referer = request.getHeader("referer");

    //从session中传入用户ID（）
    String nomID = (String) session.getAttribute("nomID");
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");

    if (userName != null && !userName.isEmpty() && password != null && !password.isEmpty()) {
        Dao dao = new Dao(); // 创建 Dao 对象
        Connection con = dao.connection(); // 获得连接对象

        Statement stat = con.createStatement();
        String sql = "UPDATE user SET name = '" + userName + "', password = '" + password + "' WHERE id = '" + nomID + "'";
        int rowsAffected = stat.executeUpdate(sql);

        if (rowsAffected > 0) {
            session.setAttribute("name", userName);
            session.setAttribute("password", password);
        } else {
%>
<script type="text/javascript">
    window.alert("更新失败");
</script>
<%
    }
} else {
%>
<script type="text/javascript">
    window.alert("用户名和密码不能为空");
</script>
<%
    }

    if ("mng".equals(session.getAttribute("type"))) {
        response.sendRedirect("mngHome.jsp");
    } else {
        response.sendRedirect("nomHome.jsp");
    }
%>


<%--    String nomID = (String) session.getAttribute("nomID");--%>
<%--    String userName = request.getParameter("userName");--%>
<%--    String password = request.getParameter("password");--%>


<%--    if (userName != null && password != null) {--%>

<%--        Dao dao = new Dao();//创建Dao对象--%>
<%--        Connection con = dao.connection();//获得连接对象--%>

<%--        Statement stat = con.createStatement();--%>
<%--        String sql = "UPDATE user SET name = '" + userName + "', password = '" + password + "' WHERE id = '" + nomID + "'"; // 假设user_id是用于识别特定用户的字段，userId是你要修改的用户的ID--%>

<%--        stat.executeUpdate(sql);--%>

<%--        session.setAttribute("name", userName);--%>
<%--        session.setAttribute("password", password);--%>

<%--    } else {--%>
<%--%>--%>
<%--<script type="text/javascript">--%>
<%--    window.alert("账号密码不能为空！");--%>
<%--    history.back(); // 返回上一个页面--%>
<%--</script>--%>
<%--<%--%>
<%--    }--%>
<%--%>--%>
<%--<script type="text/javascript">--%>
<%--    window.alert("修改成功！");--%>
<%--    history.back(); // 返回上一个页面--%>
<%--</script>--%>
</body>
</html>
