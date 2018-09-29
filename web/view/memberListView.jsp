<%@ page import="java.util.*" %>
<%@ page import="member.dao.memberDAO" %>
<%@ page import="member.model.memberVO" %>
<%@ page import="member.service.memListViewService" %>
<%@ page import="member.service.memModifyService" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.io.File" %>
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


<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/default.css">
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
          <td><a href="../control/remove.jsp?modiid=${member.userId}"><button>수정</button></a> / <a href="../control/remove.jsp?removeid=${member.userId}"><button>삭제</button></a></td>
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
