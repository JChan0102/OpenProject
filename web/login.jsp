<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.openproject.memberVO" %><%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-06
  Time: 오후 3:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("utf-8");
 String id = request.getParameter("userId");
 String pwd = request.getParameter("userPwd");
Map members = new HashMap();

    if(application.getAttribute("members")!=null){
        members = (HashMap) application.getAttribute("members");
        System.out.println(application.getAttribute("members").toString());
    }


%>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/default.css">
 <style>
    h2, td{
        padding-bottom: 10px;
        padding-top: 10px;
    }

</style>
</head>
<body>

<%@include file="menu.jsp"%>
<div class="content">
    <h2>Login</h2>
    <hr>
    <h1>아이디 또는 비번이 틀려요 </h1>
    <h1><a href="loginform.jsp">다시 로그인 해보세요</a> </h1>
<% if(id!=null&&pwd!=null){

    if(members.containsKey(id)){

    memberVO memberCk = (memberVO) members.get(id);

if(id.equals(memberCk.getUserId())&&pwd.equals(memberCk.getUserPwd())){


        request.getSession(false).setAttribute("user", new memberVO(memberCk.getUserId(),"",memberCk.getUserName(),memberCk.getUserPhoto()));
        response.sendRedirect("myPage.jsp");
    }


    }







}%>

</body>
</html>
