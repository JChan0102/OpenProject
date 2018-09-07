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
        h2, td{
            padding-bottom: 10px;
            padding-top: 10px;
        }
        td{
            text-align: center;
            border: 1px solid black;
            width: 100px;
        }

    </style>
</head>
<body>

<%@include file="menu.jsp"%>
<h2>회원리스트</h2>
<table>
    <tr>
    <td>
       Id
    </td>
    <td>
        name
    </td>
    </tr>
    <%
    if(application.getAttribute("members")!=null){
        Map members = (HashMap)application.getAttribute("members");

        Iterator membersKey= members.keySet().iterator();
        while (membersKey.hasNext()){
            memberVO member = (memberVO) members.get(membersKey.next());
            %>
            <tr>
                <td>
                    <%=member.getUserId()%></td>
        <td><%=member.getUserName()%></td>
    </tr>

    <%


        }

    }

    %>


</table>




</body>
</html>
