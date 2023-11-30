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
    String bookNum = request.getParameter("no");

    //判断是否正常登录
    if (account == null) {
        // 如果未登录，重定向到错误页面
        response.sendRedirect("../../../jumpJsp/Error1.jsp");
        return;
    } else {
        //连接数据库
        Dao dao = new Dao();//创建Dao对象
        Connection con = dao.connection();//获得连接对象
        Statement stat = con.createStatement();
        Statement stat2 = con.createStatement();
        Statement stat3 = con.createStatement();


        //==========判断借阅数量是否上限==========//
        //定义sql语句，查询user表中，userID为“userID”的的count的数量（借阅数量）
        String countSql = "SELECT count FROM user WHERE ID='" + userID + "'";
        ResultSet rs3 = stat3.executeQuery(countSql);
        if (rs3.next()) { // 移动到查询结果的第一行
            int countValue = rs3.getInt("count"); // 获取列名为 count 的值
            //判断订阅数量是否大于8
            if (countValue >= 8) {
                //大于8则跳转到报错页面
            response.sendRedirect("../../../jumpJsp/failAdd2.jsp");
                return;
            }
        }


        //==========判断是否重复借阅==========//
        //定义sql语句，查询borrow表中，userID为“userID”的所有元组 中的bookID
        String borrowSql = "SELECT bookID FROM borrow WHERE userID='" + userID + "'";

        //执行sql语句，并将获取到的所有bookID放入rs2中
        ResultSet rs2 = stat2.executeQuery(borrowSql);
        while (rs2.next()) {//循环rs2
            String d_bookID = rs2.getString("bookID");//获取数据库中的bookID

            //判断选择的是否是已经订阅的书籍
            Boolean hasDuplicate = false;//定义一个布尔类型hasDuplicate（是否有重复）
            if (d_bookID.equals(bookNum)) {//若存在重复，即已选择了已订阅书籍
                hasDuplicate = true;//将hasDuplicate设为true
            }
            if (hasDuplicate) {//若存在重复，即选择了已经订阅的书籍

                response.sendRedirect("../../../jumpJsp/failAdd.jsp");//跳转到错误页面，弹出错误提示并跳转回books，不继续执行借书操作
                return;//不继续执行操作
            }
        }


        //==========执行借书操作==========//
        LocalDateTime time = LocalDateTime.now();//获取当前时间

        //定义sql语句：插入一条新的元组（借书记录）到borrow表
        String insertSql = "INSERT INTO borrow(userID,userName,bookID,bookName,beginDate) VALUES(" + userID + ",'" + username + "'," + bookNum + ",'" + bookName + "','" + time + "')";
        stat.executeUpdate(insertSql);//执行sql语句


        String CountSql = "UPDATE user SET count=count+1 WHERE ID='" + userID + "'";
        stat.executeUpdate(CountSql);

        response.sendRedirect("books.jsp");//跳转回到books，此时该书将变成“已借阅”状态
    }
%>

</body>
</html>
