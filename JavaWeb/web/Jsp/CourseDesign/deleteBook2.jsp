<%@ page import="java.sql.*" %>
<%@ page import="conn.Dao" %>

<%
    String bookID = request.getParameter("bookID");
    if (bookID != null && !bookID.isEmpty()) {
        // 建立数据库连接
        Dao dao = new Dao();
        Connection con = dao.connection();

        try {
            con.setAutoCommit(false); // 关闭自动提交事务

            // 删除books表中的记录
            String deleteBooksQuery = "DELETE FROM books WHERE bookNum=?";
            PreparedStatement deleteBooksStatement = con.prepareStatement(deleteBooksQuery);
            deleteBooksStatement.setInt(1, Integer.parseInt(bookID));
            deleteBooksStatement.executeUpdate();

            // 删除books表中的记录
            String borrowRecordsQuery = "SELECT userID FROM borrow WHERE bookID=?";
            PreparedStatement borrowRecordsStatement = con.prepareStatement(borrowRecordsQuery);
            borrowRecordsStatement.setInt(1, Integer.parseInt(bookID));
            ResultSet resultSet = borrowRecordsStatement.executeQuery();

            while (resultSet.next()) {
                String userID = resultSet.getString("userID");
                // 在user表中更新借阅数量count
                String updateUserQuery = "UPDATE user SET count = count - 1 WHERE id=?";
                PreparedStatement updateUserStatement = con.prepareStatement(updateUserQuery);
                updateUserStatement.setString(1, userID);
                updateUserStatement.executeUpdate();
            }

            // 删除借阅记录表中的bookID为该书的记录
            String deleteBorrowQuery = "DELETE FROM borrow WHERE bookID=?";
            PreparedStatement deleteBorrowStatement = con.prepareStatement(deleteBorrowQuery);
            deleteBorrowStatement.setInt(1, Integer.parseInt(bookID));
            deleteBorrowStatement.executeUpdate();

            con.commit(); // 提交事务
            con.setAutoCommit(true); // 恢复自动提交
            response.sendRedirect("success.jsp"); // 重定向到成功页面
        } catch (SQLException e) {
            e.printStackTrace();
            con.rollback(); // 发生异常时回滚事务
            con.setAutoCommit(true); // 恢复自动提交
            response.sendRedirect("error.jsp"); // 重定向到错误页面
        } finally {
            con.close(); // 关闭连接
        }
    } else {
        response.sendRedirect("error.jsp"); // 如果bookID为空，重定向到错误页面
    }
%>

