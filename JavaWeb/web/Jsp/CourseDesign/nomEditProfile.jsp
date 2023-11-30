<%--
  Created by IntelliJ IDEA.
  User: wujun
  Date: 2023/11/28
  Time: 11:07
  To change this template use File | Settings | File Templates.
  修改用户资料的前端
  普通用户和管理员 共用页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<%
    //==========判断是否已经登录==========//
    String account = (String) session.getAttribute("account");
    if (account == null) {
        // 如果未登录，重定向回错误页面
        response.sendRedirect("jumpJsp/Error1.jsp");
    }

    //将上一个页面的地址存入session中（用于判断是管理员还是普通用户，方便返回上一页面）
    session.setAttribute("from", request.getHeader("referer"));

    //接受nomID、userName和password，由nomHome或 管理员管理页面 传入
    String nomName = request.getParameter("nomName");
    String nomPassword = request.getParameter("nomPassword");
    String nomID = request.getParameter("nomID");
    String nomAccount = request.getParameter("nomAccount");

%>
<form action="editHandle.jsp" method="post">
账户:<%=nomAccount%><br>
    <input type="hidden" name="nomID" value="<%=nomID%>">
    名称:<input type="text" name="userName" value="<%=nomName%>"><br>
    密码:<input type="password" name="password" value="<%=nomPassword%>"><br>
    <button onclick=window.location.href="<%=(String) session.getAttribute("from")%>">返回</button>
    <input type="reset" value="恢复">
    <input type="submit" value="修改">

</form>


</body>
</html>
