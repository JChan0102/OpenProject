<%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-05
  Time: 오후 4:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.openproject.memberVO" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8");%>
<h1 class="headtitle"><a class="navia" href="index.jsp">OpenProject</a></h1>
<ul id="gnd">
    <li><a  class="navia" href="index.jsp">HOME</a></li>

    <li><a  class="navia" href="memberRegform.jsp">회원가입</a></li>
    <% memberVO menumember = (memberVO) request.getSession(false).getAttribute("user");

    if(menumember ==null){
        %>
    <li><a  class="navia" href="loginform.jsp">회원로그인</a></li>
 <%   }else{
    %>  <li><a  class="navia" href="logout.jsp">로그아웃
</a></li>
  <%}%>
    <li><a  class="navia" href="myPage.jsp">마이페이지</a></li>
    <li><a  class="navia" href="memberList.jsp">회원리스트</a></li>

</ul>
