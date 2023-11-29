<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/29
  Time: 14:58
  To change this template use File | Settings | File Templates.
  借书的实现页面
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
    //获取session中的用户account、用户name和用户id
    String account = (String) session.getAttribute("account");
    String username = (String) session.getAttribute("name");
    String userID = (String) session.getAttribute("id");
    //获取上个页面发送到no和name
    String bookName = request.getParameter("name");
    String bookNO = request.getParameter("no");

    //判断是否正常登录
    if (account == null) {
    // 如果未登录，重定向回登录页面
        response.sendRedirect("main.html");
    } else {
        //连接数据库
        Dao dao = new Dao();//创建Dao对象
        Connection con = dao.connection();//获得连接对象
        Statement stat = con.createStatement();
        Statement stat2 = con.createStatement();

        //定义sql语句，查询borrow表中，userID为“userID”的所有元组 中的bookID
        String sql2 = "SELECT bookID FROM borrow WHERE userID='" + userID + "'";

        //执行sql语句，并将获取到的所有bookID放入rs2中
        ResultSet rs2 = stat2.executeQuery(sql2);
        while (rs2.next()) {//循环rs2
            String d_bookID = rs2.getString("bookID");//获取数据库中的bookID

            //判断是否点击了已经订阅的书籍
            Boolean hasDuplicate = false;//定义一个布尔类型hasDuplicate（是否有重复）
            if (d_bookID.equals(bookNO)) {//若存在重复，即已点击了已订阅书籍
                hasDuplicate = true;//将hasDuplicate设为true
            }
            if (hasDuplicate) {//若存在重复，即点击了已经订阅的书籍
               response.sendRedirect("books.jsp");//跳转回到books页面，不继续执行借书操作
               return;//不继续执行操作
            }
        }

        //执行借书操作
        LocalDateTime time = LocalDateTime.now();//获取当前时间

        //定义sql语句：插入一条新的元组
        String sql = "INSERT INTO borrow(userID,userName,bookID,bookName,beginDate) VALUES(" + userID + ",'" + username + "'," + bookNO + ",'" + bookName + "','" + time + "')";
        stat.executeUpdate(sql);//执行sql语句
        response.sendRedirect("books.jsp");//跳转回到books，此时该书将变成“已借阅”状态
        
    }
%>

</body>
</html>
