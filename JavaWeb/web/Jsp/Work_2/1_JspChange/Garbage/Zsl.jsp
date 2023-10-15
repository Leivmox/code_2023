<%@ page import="java.util.Scanner" %><%--
  Created by IntelliJ IDEA.
  User: 86133
  Date: 2023/10/15
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<form method="post" action="Zsl.jsp">
    请输入你要换算的值：<input name="m" id="m" type="text"><br>
    <input type="submit" value="ok">
</form>
<%
    //    String amount=request.getParameter("m");
    String CC = request.getParameter("m");
    int amount = 0;
//  int amount=amount;
    if (CC != null && !CC.isEmpty()) {
        try {
            amount = Integer.parseInt(CC);
            int b = 0, c = 0, d = 0, e = 0, a = 0;
            if (amount % 100 <= 100) {
                a = amount / 100;
                amount = amount % 100;

                if (amount % 50 <= 50) {
                    b = amount / 50;
                    amount = amount % 50;

                    if (amount % 20 <= 20) {
                        c = amount / 20;
                        amount = amount % 20;

                        if (amount % 10 <= 10) {
                            d = amount / 10;
                            amount = amount % 10;

                            if (amount % 5 <= 5) {
                                e = amount / 5;
                                amount = amount % 5;

                            }
                        }
                    }


                }

            }
            out.println("50有" + b + " 张<br>");
            out.println("20有" + c + " 张<br>");
            out.println("10有" + d + "张<br>");
            out.println("5有" + e + " 张<br>");
            out.println("1有" + amount + " 张<br>");
        } catch (NumberFormatException e) {
            out.println("NaN");
        }
    }
%>
</body>
</html>