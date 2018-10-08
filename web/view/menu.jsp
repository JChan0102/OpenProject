<%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-05
  Time: 오후 4:47
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8");%>
<h1 class="headtitle"><a class="navia" href="${pageContext.request.contextPath}/view/index.jsp">OpenProject</a></h1>
<ul id="gnd">
    <li><a class="navia" href="${pageContext.request.contextPath}/view/index.jsp">HOME</a></li>
    <li><a class="navia" href="${pageContext.request.contextPath}/view/memberRegform.jsp">회원가입</a></li>
    <c:choose>
        <c:when test="${sessionScope.containsKey('user')}">
            <li><a class="navia" href="${pageContext.request.contextPath}/control/logout.jsp">로그아웃</a></li>
        </c:when>
        <c:otherwise>
            <li><a class="navia" href="${pageContext.request.contextPath}/view/loginform.jsp">회원로그인</a></li>

        </c:otherwise>

    </c:choose>


    <li><a class="navia" href="${pageContext.request.contextPath}/myPage/myPage.jsp">마이페이지</a></li>
    <li><a class="navia" href="${pageContext.request.contextPath}/control/memberList.jsp">회원리스트</a></li>
    <li><a class="navia" href="${pageContext.request.contextPath}/view/memberListJsonXMLView.jsp">회원리스트(json, XML)</a></li>
    <li><a class="navia" href="${pageContext.request.contextPath}/view/visitorMessage.jsp">방명록</a></li>

</ul>
