<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
    <title>Price</title>
</head>
<html>
<head>
    <title>Project02</title>
</head>

<body>
<form action="Project02.jsp" method="get">
    请输入金额：<input type="text" name="jin_e" width="50" size="2">元<br>
</form>
<%
    if (request.getParameter("jin_e") == null) {
        out.println();
    } else {

        try {
            int i = Integer.parseInt(request.getParameter("jin_e"));
            if (i > 0 && i <= 100) {
                out.print(i + "元应为");
                int n1 = 0, n2 = 0, n3 = 0, n4 = 0, n5 = 0;
                for (; i >= 50; i = i - 50) {
                    n1 = ++n1;
                }
                for (; i >= 20; i = i - 20) {
                    n2 = ++n2;
                }
                for (; i >= 10; i = i - 10) {
                    n3 = ++n3;
                }
                for (; i >= 5; i = i - 5) {
                    n4 = ++n4;
                }
                for (; i >= 1; i = i - 1) {
                    n5 = ++n5;
                }
                if (n1 > 0) {
                    out.print("50元" + n1 + "张");
                    if (n2 < 1 && n3 < 1 && n4 < 1 && n5 < 1) {
                        out.print("。");
                    } else {
                        out.print("，");
                    }
                } else {
                    out.print("");
                }
                if (n2 > 0) {
                    out.print("20元" + n2 + "张");
                    if (n3 < 1 && n4 < 1 && n5 < 1) {
                        out.print("。");
                    } else {
                        out.print("，");
                    }
                } else {
                    out.print("");
                }
                if (n3 > 0) {
                    out.print("10元" + n3 + "张");
                    if (n4 < 1 && n5 < 1) {
                        out.print("。");
                    } else {
                        out.print("，");
                    }
                } else {
                    out.print("");
                }
                if (n4 > 0) {
                    out.print("5元" + n4 + "张");
                    if (n5 < 1) {
                        out.print("。");
                    } else {
                        out.print("，");
                    }
                } else {
                    out.print("");
                }
                if (n5 > 0) {
                    out.println("1元" + n5 + "张。");
                } else {
                    out.print("");
                }
            } else {
                out.println("输入金额" + i + "不在1~100之内！");
            }
        } catch (NumberFormatException e) {
            out.println("输入的“ " + request.getParameter("jin_e") + "  ”不是一个整数，请重新输入！");
        }
    }
%>
</body>
</html>
