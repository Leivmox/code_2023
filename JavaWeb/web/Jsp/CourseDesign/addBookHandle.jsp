<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/30
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
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


    String bookID = request.getParameter("id");
    String bookName = request.getParameter("name");
    String bookAuthor = request.getParameter("author");
    String bookPrice = request.getParameter("price");


    boolean ifR1 = bookID != null && !bookID.isEmpty();
    boolean ifR2 = bookName != null && !bookName.isEmpty();
    boolean ifR3 = bookAuthor != null && !bookAuthor.isEmpty();
    boolean ifR4 = bookPrice != null && !bookPrice.isEmpty();
    boolean ifAll = ifR1 && ifR2 && ifR3 && ifR4;

    if (ifAll) {
        Dao dao = new Dao();//创建Dao对象}
        Connection con = dao.connection();//获得连接对象

        Statement stat = con.createStatement();
//        String sql = "INSERT INTO books (bookNum,bookName, author, price) VALUES ("\'+ bookID + \', "\" + bookName + \"", "\" + bookAuthor + \"","\" + bookPrice + \"")";
//        String sql = "INSERT INTO books (bookNum, bookName, author, price) VALUES ( " +bookID +" , '" + bookName + "', '" + bookAuthor + "', '" + bookPrice + "')";
        String sql = "INSERT INTO books (bookNum, bookName, author, price) VALUES ('" + bookID + "', '" + bookName + "', '" + bookAuthor + "', '" + bookPrice + "')";
        int i = stat.executeUpdate(sql);

        if (i > 0) {
            response.sendRedirect("jumpJsp/success5.jsp");
        } else {
            response.sendRedirect("jumpJsp/Error6.jsp");
        }
    } else {
        response.sendRedirect("jumpJsp/Error7.jsp");
    }
%>
</body>
</html>
