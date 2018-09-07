<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.openproject.memberVO" %><%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-06
  Time: 오후 2:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8");
String id=request.getParameter("userId");
String pwd=request.getParameter("userPwd");
String name=request.getParameter("userName");
String img=request.getParameter("userPhoto");
Map members = new HashMap<String,memberVO>();
if(application.getAttribute("members")!=null){
    members = (HashMap) application.getAttribute("members");
}

    members.put(id,new memberVO(id,pwd,name,img));

application.setAttribute("members",members);

    response.sendRedirect("/loginform.jsp");
%>
<html>
<head>

    <title>Title</title>
    <link rel="stylesheet" href="css/default.css">
</head>
<body>

</body>
</html>
