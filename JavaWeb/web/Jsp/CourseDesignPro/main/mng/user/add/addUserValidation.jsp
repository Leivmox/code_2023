<%--
  Created by IntelliJ IDEA.
  User: Leivzy
  Date: 2023/11/3
  Time: 15:44
  To change this template use File | Settings | File Templates.
  注册的逻辑实现页面
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="conn.Dao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<body>
<%
    Dao dao = new Dao();//创建Dao对象
    Connection con = dao.connection();//获得连接对象

    //获取注册表单传入的内容
    String account = request.getParameter("account");
    String password = request.getParameter("password");
    String name = request.getParameter("name");



    if (account == null) {//判断是否已经登录
        // 如果未登录，重定向到错误页面
        response.sendRedirect("../../../../jumpJsp/Error1.jsp");
        return;
    } else if (account.isEmpty()) {//判断是否是空值
        //如果是是空值，跳转到提示页面
        response.sendRedirect("../../../../jumpJsp/Error9.jsp");
        return;
    }else {


        //==========查询数据库中是否存在相同的account==========//
        Statement stat = con.createStatement();
        String sql = "SELECT account FROM user WHERE account='" + account + "'";
        ResultSet rs = stat.executeQuery(sql);

        //如果存在相同账户，则跳转警告页面并跳转回主页面
        if (rs.next()) {
            response.sendRedirect("../../../../jumpJsp/Error10.jsp");
        } else {

            //==========执行注册==========//
            //获取数据库中用户最大ID
            String countQuery = "SELECT MAX(ID) AS maxID FROM user";
            ResultSet maxIDResult = stat.executeQuery(countQuery);
            int newUserID = 0;

            if (maxIDResult.next()) {
                int maxID = maxIDResult.getInt("maxID");
                newUserID = maxID + 1;//将最大ID+1 并赋给newUserID
            }
            //定义sql语句并执行
            String sql1 = "INSERT INTO user(ID, name, password, type, count, account) VALUES (" + newUserID + ", '" + name + "', '" + password + "', 'nom',0, '" + account + "')";
            int i = stat.executeUpdate(sql1);

            //跳转成功页面并跳转回main页面
            response.sendRedirect("../../../../jumpJsp/success6.jsp");
        }
    }
%>
</body>