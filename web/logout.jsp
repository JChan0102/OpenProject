<%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-06
  Time: 오후 6:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 로그아웃시 session 초기화.
    request.setCharacterEncoding("utf-8");
    request.getSession(false).invalidate();
    response.sendRedirect("index.jsp");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
