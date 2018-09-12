<%@ page import="com.openproject.memberVO" %><%--
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
</head>
<body>

    <%if(request.getParameter("removeid")!=null){
        members.remove(request.getParameter("removeid"));
        response.sendRedirect("memberList.jsp");
    }

    if(request.getParameter("modiid")!=null){

        request.setAttribute("member",(memberVO) members.get(request.getParameter("modiid")));

        %>

<form action="memberList.jsp?modi=${requestScope.member.userId}" method="post">
<table>
    <tr>
        <td>
         id
        </td>
        <td>
            <input type="text" readonly name="userId" value="${requestScope.member.userId}">
        </td>

    </tr>
    <tr>
        <td>
            pwd
        </td>
        <td>
            <input type="text" name="userPwd" value="${requestScope.member.userPwd}">
        </td>
    </tr>
    <tr>
        <td>
        name
        </td>
        <td>
            <input type="text" name="userName" value="${requestScope.member.userName}">
        </td>

    </tr>
    <tr>
        <td>
        photo
        </td>
        <td>
            <input type="file" name="userPhoto">
            <input type="hidden" name="preuserPhoto" value="${requestScope.member.userPhoto}" >

        </td>

    </tr>
    <tr>
        <td></td>
        <td>
            <input type="submit">
        </td>

    </tr>
</table>
</form>
<%}%>

</body>
</html>
