<%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-06
  Time: 오후 3:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String id = (String) request.getSession(false).getAttribute("userId");
    String name = (String) request.getSession(false).getAttribute("userName");
    if (id == null) {
%>
<script>
    alert("로그인 후 사용가능합니다!");
    location.href = "loginform.jsp";
</script>
<%}%>
<html>
<head>
    <title>Title</title>

    <style>
        h2, td {
            padding-bottom: 10px;
            padding-top: 10px;
        }

        #memberPhoto {
            background-image: url("images/none.png");
            background-size: contain;
            width: 150px;
            height: 150px;
            border: 1px solid gray;
            border-radius: 50%;
        }
    </style>
    <link rel="stylesheet" href="css/default.css">
</head>
<body>
<%@include file="menu.jsp" %>
<div class="content">
    <h2>회원정보</h2>

    <div id="memberPhoto"></div>
    <hr>
    <table>

        <table>
            <tr>
                <td>id : <%=id%>
                </td>
                <td>이름 : <%=name%>
                </td>
            </tr>
        </table>


    </table>

</div>
</body>
</html>
