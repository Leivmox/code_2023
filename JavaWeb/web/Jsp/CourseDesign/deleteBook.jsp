<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/30
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<html>
<body>


<%
        //==========判断是否已经登录==========//
        String account = (String) session.getAttribute("account");
        if (account == null || !account.equals("Admin")) {
            // 如果未登录，重定向回错误页面
            response.sendRedirect("jumpJsp/Error1.jsp");
            return;
        }


    //获取bookNum
    String bookNum = request.getParameter("no");

    if (bookNum != null && !bookNum.isEmpty()) {

        Dao dao = new Dao();//创建Dao对象
        Connection con = dao.connection();//获得连接对象

        try {
            con.setAutoCommit(false); // 关闭自动提交事务

            // 删除books表中的记录
            Statement stat = con.createStatement();
            String sql = "DELETE FROM books WHERE bookNum = '" + bookNum + "'";
            int i1 = stat.executeUpdate(sql);

            //更新每个借阅用户的借阅数量 （count - 1 ）
            Statement stat2 = con.createStatement();
            String borrowRecordsQuery = "SELECT userID FROM borrow WHERE bookID='"+bookNum+"'";
            ResultSet rs = stat2.executeQuery(borrowRecordsQuery);

            Statement stat3 = con.createStatement();
            while (rs.next()) {
                String userID = rs.getString("userID");
                // 在user表中更新借阅数量count
                String updateUserQuery = "UPDATE user SET count = count - 1 WHERE id='" + userID + "'";
                stat3.executeUpdate(updateUserQuery);
            }


            // 删除借阅记录表borrow中的bookID为该书的记录
            Statement stat4 = con.createStatement();
            String deleteBorrowQuery = "DELETE FROM borrow WHERE bookID='"+bookNum+"'";
            int i2 = stat4.executeUpdate(deleteBorrowQuery);

            con.commit(); // 提交事务
            con.setAutoCommit(true); // 恢复自动提交
            response.sendRedirect("jumpJsp/success5.jsp"); // 重定向到成功页面
        }catch (SQLException e) {
            e.printStackTrace();
            con.rollback(); // 发生异常时回滚事务
            con.setAutoCommit(true); // 恢复自动提交
            response.sendRedirect("jumpJsp/Error8.jsp"); // 重定向到错误页面
        } finally {
            con.close(); // 关闭连接
        }
    }else {
        response.sendRedirect("jumpJsp/Error8.jsp"); // 如果bookID为空，重定向到错误页面
    }
%>
<%--<script type="text/javascript">--%>
<%--    window.alert("删除失败！")--%>
<%--    window.document.location.href = "manageBooks.jsp";--%>
<%--</script>--%>



</body>
</html>
