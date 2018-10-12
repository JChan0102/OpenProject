<%@ page import="visitorMessage.service.WriteVisitorMessageService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="message" class="visitorMessage.model.VisitorMessageVO"/>
<jsp:setProperty name="message" property="*"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% WriteVisitorMessageService service = WriteVisitorMessageService.getService();
  service.write(message);
  response.sendRedirect(request.getContextPath()+"/view/visitorMessage.jsp");
%>
</body>
</html>
