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

    //获取上一个页面的地址
    String from = (String) session.getAttribute("from");

    //从session中传入用户ID（）
    String nomID = request.getParameter("nomID");
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");

    out.println(userName+"   "+password+"   "+nomID);
    if (userName != null && !userName.isEmpty() && password != null && !password.isEmpty()) {
        Dao dao = new Dao(); // 创建 Dao 对象
        Connection con = dao.connection(); // 获得连接对象

        Statement stat = con.createStatement();
        String sql = "UPDATE user SET name = '" + userName + "', password = '" + password + "' WHERE id = '" + nomID + "'";
        int rowsAffected = stat.executeUpdate(sql);

        //判断是否更新成功
        if (rowsAffected > 0) {

            //判断是否是普通用户，若为普通用户，则修改保存的session
            String userType = (String) session.getAttribute("type");
            if (userType.equals("nom")) {
                session.setAttribute("name", userName);
                session.setAttribute("password", password);
            }

//            response.sendRedirect("jumpJsp/success2.jsp");
            response.sendRedirect((String) session.getAttribute("from"));
            return;
        }else {
            //更新失败
            response.sendRedirect("jumpJsp/Error3.jsp");
            return;
        }
    }
%>
<script type="text/javascript">
    window.alert("账号密码不能为空！");
    window.document.location.href = "<%=from%>"
</script>




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
