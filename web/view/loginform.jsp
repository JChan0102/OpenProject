<%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-05
  Time: 오후 4:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%request.setCharacterEncoding("utf-8");%>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">
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
    <h2>Login</h2>
    <hr>
    <%--로그인 실패시 저장한 msg값 출력--%>
    <p style="color: red">${msg}</p>
    <form action="${pageContext.request.contextPath}/control/login.jsp" method="post">
        <table>
            <tr>
                <td>아이디(이메일)</td>

                <%--cookie에 저장된 이전 아이디값 출력, 혹은 없으면 빈 문자열 출력--%>
                <td><input type="text" required name="userId" value="${cookie.preId.value}">
                    <input type="checkbox"
                    <%--cookie가 있으면 체크를 했던것이기 때문에 checked 설정--%>
                    <c:if test="${cookie.containsKey('preId')}">
                           checked
                    </c:if>
                           name="idck">
                </td>
            </tr>

            <tr>
                <td>비밀번호</td>
                <td><input type="password" required name="userPwd"></td>
            </tr>

            <tr>
                <td colspan="2" style="text-align: center"><input type="submit" value="로그인"></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
