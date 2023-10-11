<%@ page errorPage="error.jsp" %>

<%
  try {
    // 执行可能会抛出异常的代码
  } catch (Exception e) {
    // 捕获异常并将其抛出到错误页面
    throw new RuntimeException(e);
  }
%>
