<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-08
  Time: 오전 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        .tablehead{
            background-color: gray;
        }

    </style>
</head>
<body>

<%@include file="menu.jsp" %>
<h2>회원리스트</h2>
<table>
    <tr class="tablehead">
        <td>
            Id
        </td>
        <td>
            name
        </td>
    </tr>
    <%
        //만약 application에 저장된 members 라는 속성이 존재 한다면
        //members에 선언해줌
        if (application.getAttribute("members") != null) {
            Map members = (HashMap) application.getAttribute("members");
//Iterator로 key값 정렬
            Iterator membersKey = members.keySet().iterator();
            //membersKey 다음 값이 존재하면
            while (membersKey.hasNext()) {
                //member 변수에 해당 키의 밸류값 저장
                memberVO member = (memberVO) members.get(membersKey.next());
    //id와 name 을 출력하는 tr,td작성
    %>
    <tr>
        <td>
            <%=member.getUserId()%>
        </td>
        <td><%=member.getUserName()%>
        </td>
    </tr>

    <%


            }

        }

    %>


</table>


</body>
</html>
