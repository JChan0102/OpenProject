<%@ page import="com.openproject.memberVO" %>
<%@ page import="com.openproject.memberDAO" %><%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-12
  Time: 오후 1:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="members" class="java.util.HashMap" scope="application"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/default.css">

    <style>
        h2, td {
            padding-bottom: 10px;
            padding-top: 10px;
        }

        td {
            text-align: center;
            border: 1px solid black;
            width: 100px;
        }


    </style>
</head>
<body>

    <%
        //sql문을 실행하기 위한 객체 생성
        memberDAO sql = memberDAO.getInstance();
        //만약 removeid란 값이 있다면 (삭제버튼을 눌렀다면)
        if(request.getParameter("removeid")!=null){
            //sqld의 delete문을 실행 후 리스트로 다시 페이지 이동
            sql.delmember(request.getParameter("removeid"));
        response.sendRedirect("memberList.jsp");
    }
      //만약 modiid란 값이 있다면 (수정버튼을 눌렀다면)
    if(request.getParameter("modiid")!=null){
        //select문을 실행해 userid에 해당하는 pwd,name,photo값 가져옴
        memberVO member = sql.selectMember(request.getParameter("modiid"));
        request.setAttribute("member",member);
        %>
<%--멤버리스트 페이지로 modi라는 키에 userId값을 get형식으로 보내줌--%>
<form action="memberList.jsp?modi=${requestScope.member.userId}" method="post">
    <%@include file="menu.jsp" %>
    <h2> 회원 수정</h2>
<table>
    <tr>
        <td class="tablehead">
         id
        </td>
        <td>
            <input type="text" readonly name="userId" value="${requestScope.member.userId}">
        </td>

    </tr>
    <tr>
        <td class="tablehead">
            pwd
        </td>
        <td>
            <input type="text" name="userPwd" value="${requestScope.member.userPwd}">
        </td>
    </tr>
    <tr>
        <td class="tablehead">
        name
        </td>
        <td>
            <input type="text" name="userName" value="${requestScope.member.userName}">
        </td>

    </tr>
    <tr>
        <td class="tablehead">
        photo
        </td>
        <td>
            <input type="file" name="userPhoto">
            <%--사진을 수정안할 수 있기 때문에 이전값으로 저장해서 보내줌 --%>
            <input type="hidden" name="preuserPhoto" value="${requestScope.member.userPhoto}" >

        </td>

    </tr>
    <tr>
        <td colspan="2" style="padding: 0; height: 70px">
            <input class="summm" type="submit" value="수 정">
        </td>

    </tr>
</table>
</form>
<%}%>
</body>
</html>
