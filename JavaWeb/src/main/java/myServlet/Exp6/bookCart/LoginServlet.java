package myServlet.Exp6.bookCart;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.Dao;

@WebServlet(value = "/books")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//解决post中文乱码

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        // 从前端获取模糊查询条件
        String bookName = request.getParameter("name");

        // 连接数据库并执行查询
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Dao dao = new Dao();
            conn = dao.connection();

            // 执行查询操作（T_BOOK 包含列 book_id, book_name, book_price）
            String sql = "SELECT * FROM BOOKS WHERE bookname LIKE ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + bookName + "%");
            rs = pstmt.executeQuery();


            // 在页面下方显示查询结果
            out.println("<div>");
            out.println("<h3>查询结果：</h3>");
            out.println("<table border='1'>");
            out.println("<tr><th>ID</th><th>图书名称</th><th>作者</th><th>价格</th<th></th></tr>");


            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("booknum") + "</td>");
                out.println("<td>" + rs.getString("bookname") + "</td>");
                out.println("<td>" + rs.getString("author") + "</td>");
                out.println("<td>" + rs.getDouble("price") + "</td>");
                out.println("<td><a href='/JavaWeb_Web_exploded/AddToCartServlet?bookId="+rs.getString("bookname")+"&price="+rs.getDouble("price")+"'>添加到购物车</a></td>");
                out.println("</tr>");
            }

            out.println("</table>");
            out.println("</div>");

            out.println("<a href='/JavaWeb_Web_exploded/Jsp/Exp6/bookCart/main.html'>返回查询</a>");

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
