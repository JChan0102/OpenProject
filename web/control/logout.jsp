<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 로그아웃시 session 초기화.
    request.setCharacterEncoding("utf-8");
    request.getSession(false).invalidate();
    response.sendRedirect(request.getContextPath()+"/view/index.jsp");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
