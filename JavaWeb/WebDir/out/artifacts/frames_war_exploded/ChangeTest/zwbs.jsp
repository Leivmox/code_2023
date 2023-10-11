<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>$Title$</title>
</head>
<body>
<script type="text/javascript">
  function fun(){
    a=document.form.text1.value;
    b=a/50;
    c=(a%50)/20;
    d=((a%50)%20)/10;
    e=(((a%50)%20)%10)/5;
    f=(((a%50)%20)%10)%5;

    document.form.text2.value=b;
    document.form.text3.value=c;
    document.form.text4.value=d;
    document.form.text5.value=e;
    document.form.text6.value=f;
  }
</script>
<form name="form">
  Enter your amount:<input name="text1" type="text"><br>
  <input type="button" onclick="fun()" value="Sure"><br>
  GIVE CHANGE<br>
  50<input name="text2" type="text">张<br>
  20<input name="text3" type="text">张<br>
  10<input name="text4" type="text">张<br>
  5 <input name="text5" type="text">张<br>
  1 <input name="text6" type="text">张<br>
</form>
</body>
</html>