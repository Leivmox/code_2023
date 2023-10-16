<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>找零结果</title>
</head>
<body>
<%
    String amountStr = request.getParameter("amount");
    if (amountStr != null && !amountStr.isEmpty()) {
        try {
            int amount = Integer.parseInt(amountStr);
            int fifty = amount / 50;
            int twenty = (amount % 50) / 20;
            int ten = (amount % 50 % 20) / 10;
            int five = (amount % 50 % 20 % 10) / 5;
            int one = amount % 5;
%>
<h1><%= amount %>元找零方案：</h1>
<%--<table border="1" align="center">--%>
<table border="1">
    <tr>
        <td>50元数量：</td>
        <td><%= fifty %>张</td>
    </tr>
    <tr>
        <td>20元数量：</td>
        <td><%= twenty %>张</td>
    </tr>
    <tr>
        <td>10元数量：</td>
        <td><%= ten %>张</td>
    </tr>
    <tr>
        <td>5元数量：</td>
        <td><%= five %>张</td>
    </tr>
    <tr>
        <td>1元数量：</td>
        <td><%= one %>张</td>
    </tr>
</table>
<%
} catch (NumberFormatException e) {
%>
<p>输入无效，请输入一个有效的整数金额。</p>
<%
    }
} else {
%>
<p>请输入找零金额。</p>
<%
    }
%>
</body>
</html>
