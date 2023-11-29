<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/29
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.time.LocalDateTime" %>
<html>
<body>
<%
    String account = (String) session.getAttribute("account");
    String username = (String) session.getAttribute("name");
    String userID = (String) session.getAttribute("id");
    String bookName = request.getParameter("name");
    String bookNO = request.getParameter("no");
    if (account == null) {
// 如果未登录，重定向回登录页面
        response.sendRedirect("main.html");
    } else {
//    out.println(account+bookName+bookNO);
        Dao dao = new Dao();//创建Dao对象
        Connection con = dao.connection();//获得连接对象
        Statement stat = con.createStatement();
        Statement stat2 = con.createStatement();
        String sql2 = "SELECT bookID FROM borrow WHERE userID='" + userID + "'";
        ResultSet rs2 = stat2.executeQuery(sql2);
        while (rs2.next()) {
            String d_bookID = rs2.getString("bookID");
            Boolean hasDuplicate = false;
            if (d_bookID.equals(bookNO)) {
                hasDuplicate = true;

            }
            if (hasDuplicate) {
               response.sendRedirect("books.jsp");
               return;
            }
        }
        LocalDateTime time = LocalDateTime.now();//获取当前时间
        out.println(userID + " " + username + " " + bookNO + " " + bookNO + " " + time);
        String sql = "INSERT INTO borrow(userID,userName,bookID,bookName,beginDate) VALUES(" + userID + ",'" + username + "'," + bookNO + ",'" + bookName + "','" + time + "')";
        stat.executeUpdate(sql);
        response.sendRedirect("books.jsp");
    }
%>

</body>
</html>
