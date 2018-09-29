<%@ page import="member.model.memberVO" %><%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-06
  Time: 오후 3:13
  To change this template use File | Settings | File Templates.
--%>


<% request.setCharacterEncoding("utf-8");%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--session에 user라는 값이 없으면 로그인을 한게 아니므로 알림 후 로그인창으로 이동--%>
<%--
<c:if test="${!(sessionScope.containsKey('user'))}">
    <script>
        alert("로그인 후 사용가능합니다!");
        location.href = "loginform.jsp";
    </script>
</c:if>
--%>

<html>
<head>
    <title>Title</title>

    <style>
        h2, td {
            padding-bottom: 10px;
            padding-top: 10px;
        }

        #memberPhoto>img {
            width: 150px;
            height: 150px;
            border: 1px solid gray;
            border-radius: 50%;
        }

    </style>
    <link rel="stylesheet" href="../css/default.css">
</head>
<body>

<%@include file="/view/menu.jsp" %>
<div class="content">
    <h2>회원정보</h2>
    <div id="memberPhoto"><img alt="회원사진" src="<%=request.getContextPath()%>/uploadImg/${user.userPhoto}">  </div>
    <hr>
    <table>

        <table>
            <tr>
                <%--session에 저장된 member객체 user를 통해 id값, name값 가져옴--%>
                <td>id : ${user.userId}
                </td>
            </tr><tr>
                <td>이름 : ${user.userName}
                </td>
            </tr>
        </table>


    </table>

</div>
</body>
</html>
