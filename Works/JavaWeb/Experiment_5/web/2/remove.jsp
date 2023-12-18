
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.removeAttribute("username");
    response.sendRedirect("loginValidation.jsp");
%>