<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/14
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String keepLoggedIn = request.getParameter("keepLoggedIn");

// 假设用户认证逻辑
    boolean isValidUser = "123".equals(username) && "123".equals(password);

//    if (isValidUser) {
        if (keepLoggedIn != null && keepLoggedIn.equals("true")) {
            // 如果勾选了“保持登录状态”，则将用户名保存到 Session 对象
            session.setAttribute("loggedInUser", username);
        }
    session.setAttribute("loggedInUser1", username);
        response.sendRedirect("welcome.jsp");
//    } else {
//        response.sendRedirect("loginValidation.jsp");
//    }
%>