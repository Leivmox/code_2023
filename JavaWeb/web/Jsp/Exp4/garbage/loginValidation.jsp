<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/14
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 模拟用户验证逻辑
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String keepLoggedIn = request.getParameter("keepLoggedIn");

// 这里可以进行实际的用户验证逻辑，这里使用简单的示例
    boolean isValidUser = "user123".equals(username) && "password123".equals(password);

    if (isValidUser) {
        if (keepLoggedIn != null && keepLoggedIn.equals("true")) {
            // 保持登录状态，将用户名保存到 Session 对象
            session.setAttribute("loggedInUser", username);
        }
        response.sendRedirect("welcome.jsp");
    } else {
        response.sendRedirect("loginValidation.jsp");
    }
%>