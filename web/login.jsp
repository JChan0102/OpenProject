<%@ page import="com.openproject.memberVO" %>
<%@ page import="com.openproject.memberDAO" %><%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-06
  Time: 오후 3:02
  To change this template use File | Settings | File Templates.
--%>
<%
    request.setCharacterEncoding("utf-8");
//login form에서 sumit 받은 값 String 변수에 저장한다.
    String ck = request.getParameter("idck");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- useBean을 통해  sumit으로 받은 값을 setProperty를 이용해 값 저장 --%>
<jsp:useBean id="inputmember" class="com.openproject.memberVO"/>
<jsp:setProperty name="inputmember" property="*"/>

<html>
<head>
    <script src="https://code.jquery.com/jquery-1.10.0.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
    <title>Title</title>
    <link rel="stylesheet" href="css/default.css">
    <style>
        h2, td {
            padding-bottom: 10px;
            padding-top: 10px;
        }


    </style>
</head>
<body>


<%@include file="menu.jsp" %>
<div class="content">
        <%
         //sql 메서드를 사용할 객체 생성
          memberDAO sql = memberDAO.getInstance();
        // sumit으로 받아온 아이디를 WHERE절 조건으로 하는 select문 실행
         memberVO memberCk = sql.selectMember(inputmember.getUserId());

         if(memberCk.getUserId()!=null){
    //해당 아이디와 pwd와 일치하면
    if(inputmember.getUserId().equals(memberCk.getUserId())&&inputmember.getUserPwd().equals(memberCk.getUserPwd())){
        //쿠키 생성
        Cookie cookie = new Cookie("preId",memberCk.getUserId());
        if(ck!=null){
          response.addCookie(cookie);
        }else {
          cookie.setMaxAge(0);
          response.addCookie(cookie);
        }
        //세션에 저장함 세션에 저장할떄는 pwd값은 ""로 입력
        //새로 생성안하고 map에 있는 객체를 사용하게되면 객체의 비밀번호를 setUserPwd("")하면 map에있는 원래 객체값의 pwd도 ""이 되므로 다음에 로그인을 할수가 없다.
        request.getSession(false).setAttribute("user", new memberVO(memberCk.getUserId(),"",memberCk.getUserName(),memberCk.getUserPhoto()));
            response.sendRedirect("myPage.jsp");
            } else {
                request.setAttribute("msg","비번이 틀렸습니다.");
    %>
    <jsp:forward page="loginform.jsp"/>
        <%
    }
        } else {
                request.setAttribute("msg","아이디가 존재하지 않습니다.");
    %>
    <jsp:forward page="loginform.jsp"/>
        <%
    }
    %>
</body>
</html>
