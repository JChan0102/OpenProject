<%@ page import="java.util.*" %>
<%@ page import="com.openproject.memberDAO" %>
<%@ page import="com.openproject.memberVO" %>
<% request.setCharacterEncoding("utf-8");%>
<%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-08
  Time: 오전 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    // DB와 연동하기 위한 객체 생성
    memberDAO sql = memberDAO.getInstance();
    //request에 modi라는 값이 있으면 실행
    if(request.getParameter("modi")!=null){
%>
<%--수정창에서 sumit으로 받아온값  member 객체에 setProperty 해줌 --%>
<jsp:useBean id="member" class="com.openproject.memberVO" scope="request"/>
<jsp:setProperty name="member" property="*"/>
<%  //만약 photo를 새로 저장하지 않으면 저장해논 이전값으로 되돌림 Null->이전사진명
      if(member.getUserPhoto()==null)
      {
          member.setUserPhoto(request.getParameter("preuserPhoto"));
      }

      // member객체를 이용해 update메서드를 수행
      sql.updatemember(member);
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
            width: 100px;
        }
        table{
            border-collapse: collapse;
        }
        tr{
            border-bottom: 1px solid #666666;
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
            수정 / 삭제
        </td>
    </tr>
    <%
        //memberInfo에 저장된 모든 컬럼을 가져오는 select문을 list에 저장.
        List<memberVO> memberlist = sql.selectMemberAll();
        //el을 사용하기 위해 setAtrribute 해줌

         request.setAttribute("members",memberlist);

    %>
    <%-- List의 값 하나씩 출력.--%>
<c:choose>
    <c:when test="${members.size()!=0}">
  <c:forEach items="${members}" var="member">
      <tr>
          <td>
              ${member.userId}
          </td>
          <td>${member.userPwd}
          </td>
          <td>${member.userName}
          </td>
          <td>${member.userPhoto}
          </td>
          <%--수정 버튼 클릭시 modiid라는 키에 userID값을 get형식으로 보내줌
              삭제 버튼 클릭시 removeid라는 키에 userID값을 get형식으로 보내줌--%>
          <td><a href="remove.jsp?modiid=${member.userId}"><button>수정</button></a> / <a href="remove.jsp?removeid=${member.userId}"><button>삭제</button></a></td>
      </tr>

  </c:forEach>
    </c:when>
    <c:otherwise>
        <tr>
            <td colspan="5">등록된 회원 정보가 없습니다.</td>
        </tr>
    </c:otherwise>
</c:choose>
</table>


</body>
</html>
