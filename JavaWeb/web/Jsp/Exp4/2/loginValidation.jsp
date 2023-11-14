<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/14
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String keepLoggedInUser = request.getParameter("keepLoggedInUser");

    if (keepLoggedInUser != null && keepLoggedInUser.equals("on")) {

        // 如果勾选了“保持登录状态”，则将用户名保存到 cookie
        Cookie cookie = new Cookie("loggedInUser", username);
        cookie.setMaxAge(60 * 60); // 设置Cookie的有效期为1h
        response.addCookie(cookie);
    }
    session.setAttribute("username", username);
    response.sendRedirect("welcome.jsp");
%>


