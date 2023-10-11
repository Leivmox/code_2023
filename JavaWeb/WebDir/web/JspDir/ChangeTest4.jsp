exchange.html:

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>
<form action="ChangeOut.jsp">
  <table border="1" align="center">
    <tr rowspan="2">
      <td>请输入找零数量：<br/><input name="many" type="text"></td>
      <td><input type="submit" value="提交"/></td>
    </tr>
  </table>
</form>
</body>
</html>

exchange.jsp:

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>找零</title>
</head>
<body>
<%
  String n= request.getParameter("many");
  int a = Integer.parseInt(n);
  int fifty=a/50;
  int twenty=a%50/20;
  int ten=a%50%20/10;
  int five=a%50%20%10/5;
  int one=a%50%20%10%5/1;
%>
<table border='1' align='center'cellpadding='5' width="480">
  <tr>
    <td colspan="2"><%=a%>元找零方案:</td>
  </tr>
  <tr>
    <td>50元数量：</td>
    <td><%=fifty%>张</td>
  </tr>
  <tr>
    <td>20元数量：</td>
    <td><%=twenty%>张</td>
  </tr>
  <tr>
    <td>10元数量:</td>
    <td><%=ten%>张</td>
  </tr>
  <tr>
    <td>5元数量:</td>
    <td><%=five%>张</td>
  </tr>
  <tr>
    <td>1元数量:</td>
    <td><%=one%>张</td>
  </tr>

</table>
</body>
</html>