<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="errorpage.jsp"%>
<html>
<head>
  <title>fuwu</title>
</head>
<body>
<%
  String c1=request.getParameter("c1");
  String c2=request.getParameter("c2");
  double num1=Double.parseDouble(c1);
  double num2=Double.parseDouble(c2);
  if(num2==0||c1==null||c2==null){
    throw new RuntimeException("Error condition!!!");
  }else{
    out.println(num1/num2);
  }
%>
</body>
</html>
