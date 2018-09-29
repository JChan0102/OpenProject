<%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-22
  Time: 오후 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="../css/default.css">
</head>
<%request.setCharacterEncoding("utf-8");%>
<%@include file="menu.jsp" %>
<body>
<form action="../control/writeVisitorMessage.jsp" method="post">
<table style="border: 1px solid gray">
    <tr>
        <td>name</td>
        <td><input name="userName" value=" ${sessionScope.get('user').getUserName()}" readonly >
            <input name="userId" type="hidden" value=" ${sessionScope.get('user').getUserId()}" readonly ></td>
    </tr>
    <tr>
        <td>내용</td>
        <td><textarea name="message" cols="22" row="4" <c:if test="${!(sessionScope.containsKey('user'))}"> placeholder="로그인후 이용가능합니다." readonly </c:if> ></textarea></td>

    </tr>
    <tr>
        <td colspan="2" style="text-align: center"><input type="submit"></td>
    </tr>
</table>
</form>
</body>
</html>
