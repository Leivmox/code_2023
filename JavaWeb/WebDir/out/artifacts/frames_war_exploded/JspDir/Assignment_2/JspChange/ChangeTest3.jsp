<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>纸币找零</title>
</head>
<body>
<form method="post" action="change.jsp">
  输入金额：<input type="text" name="amount">
  <input type="submit" value="计算找零">
</form>

<%
  void calculateChange(int amount) {
  int[] denominations = {50, 20, 10, 5, 1};
  int[] changeCounts = new int[denominations.length];

  // 创建一个集合来存储纸币面额和对应的数量
  ArrayList<String> changeResult = new ArrayList<String>();

  out.print(amount + " 元应该找的纸币数量：<br>");

  for (int i = 0; i < denominations.length; i++) {
  changeCounts[i] = amount / denominations[i];
  amount = amount % denominations[i];
  if (changeCounts[i] > 0) {
  changeResult.add(denominations[i] + " 元" + changeCounts[i] + "张");
  }
  }

  // 输出找零结果
  for (String result : changeResult) {
  out.print(result + " ");
  }
  }

  String amountStr = request.getParameter("amount");

  if (amountStr != null && !amountStr.isEmpty()) {
  int amount = Integer.parseInt(amountStr);

  if (amount >= 1 && amount <= 100) {
  calculateChange(amount);
  } else {
  out.print("请输入1到100之间的有效金额。");
  }
  }
%>
</body>
</html>
