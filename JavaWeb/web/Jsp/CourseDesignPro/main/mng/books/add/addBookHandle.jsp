<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/30
  Time: 22:04
  To change this template use File | Settings | File Templates.
  借书功能的逻辑实现页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<body>
<%
    //==========判断是否已经登录==========//
    String account = (String) session.getAttribute("account");
    if (account == null || !account.equals("Admin")) {
        // 如果未登录，重定向回错误页面
        response.sendRedirect("../../../../jumpJsp/Error1.jsp");
        return;
    }

    //==========获取来自表单的数据==========//
    String bookID = request.getParameter("id");
    String bookName = request.getParameter("name");
    String bookAuthor = request.getParameter("author");
    String bookPrice = request.getParameter("price");

    //==========判断传入的数据是否为空==========//
    boolean ifR1 = bookID != null && !bookID.isEmpty();
    boolean ifR2 = bookName != null && !bookName.isEmpty();
    boolean ifR3 = bookAuthor != null && !bookAuthor.isEmpty();
    boolean ifR4 = bookPrice != null && !bookPrice.isEmpty();
    boolean ifAll = ifR1 && ifR2 && ifR3 && ifR4;

    //if数据不为空
    if (ifAll) {
        Dao dao = new Dao();//创建Dao对象}
        Connection con = dao.connection();//获得连接对象
        Statement stat = con.createStatement();
        Statement stat2 = con.createStatement();


        //判断新建的图书id是否重复
        String sql2 = "SELECT bookNum FROM books";
        ResultSet rs = stat2.executeQuery(sql2);
        while (rs.next()) {
            String d_bookNum = rs.getString("bookNum");
            if (bookID.equals(d_bookNum)) {
                response.sendRedirect("../../../../jumpJsp/Error6.jsp");
                return;
            }
        }


        //将传入的数据存入数据库
        String sql = "INSERT INTO books (bookNum, bookName, author, price) VALUES ('" + bookID + "', '" + bookName + "', '" + bookAuthor + "', '" + bookPrice + "')";
        int i = stat.executeUpdate(sql);

        //判断是否成功存入数据库
        if (i > 0) {
            //成功即跳转成功页面
            response.sendRedirect("../../../../jumpJsp/success5.jsp");
        } else {
            //否则跳转错误页面
            response.sendRedirect("../../../../jumpJsp/Error6.jsp");
        }
    } else {
        //数据存在空值
        response.sendRedirect("../../../../jumpJsp/Error7.jsp");
    }
%>
</body>
</html>
