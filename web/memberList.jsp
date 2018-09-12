<%@ page import="java.util.*" %><%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-08
  Time: 오전 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="members" class="java.util.HashMap" scope="application"/>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%if(request.getParameter("modi")!=null){
%>
<jsp:useBean id="member" class="com.openproject.memberVO" scope="request"/>
<jsp:setProperty name="member" property="*"/>
<%
      if(member.getUserPhoto()==null)
      {
          member.setUserPhoto(request.getParameter("preuserPhoto"));
      }

  members.put(request.getParameter("modi"),member);
}
%>
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
            pwd
        </td>
        <td>
            name
        </td>
        <td>
            photo
        </td>
        <td>
            수정/삭제
        </td>
    </tr>
<%--    <%
        //만약 application에 저장된 members 라는 속성이 존재 한다면
        //members에 선언해줌
        if (application.getAttribute("members") != null) {

          Map members = (HashMap) application.getAttribute("members");
          //  List members = (ArrayList) application.getAttribute("members");
         //Iterator로 key값 정렬
            Iterator membersKey = members.keySet().iterator();
        //    membersKey 다음 값이 존재하면
            while (membersKey.hasNext()) {


            //list for문 돌림
  // for (int i = 0; i<members.size();i++){

                //member 변수에 해당 키의 밸류값 저장
                memberVO member = (memberVO) members.get(membersKey.next());
             //   memberVO member = (memberVO) members.get(i);
    //id와 name 을 출력하는 tr,td작성
    %>
    <%
            }
        }
    %>--%>
  <c:forEach items="${members}" var="member">
      <tr>
          <td>
              ${member.value.userId}
          </td>
          <td>${member.value.userPwd}
          </td>
          <td>${member.value.userName}
          </td>
          <td>${member.value.userPhoto}
          </td>
          <td><a href="remove.jsp?modiid=${member.value.userId}"><button>수정</button></a>/<a href="remove.jsp?removeid=${member.value.userId}"><button>삭제</button></a></td>
      </tr>

  </c:forEach>

</table>


</body>
</html>
