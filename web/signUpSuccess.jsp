<%@ page import="com.openproject.memberDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-06
  Time: 오후 2:48
  To change this template use File | Settings | File Templates.
--%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--사용자로부터 입력받은 회워가입 form 값은 UseBean을 통해 setProperty해줌--%>
<jsp:useBean id="member" class="com.openproject.memberVO" scope="request"/>
<jsp:setProperty name="member" property="*"/>
<%
    //sql 메서드를 사용할 객체 생성
    memberDAO sql = memberDAO.getInstance();
    // member값을 insert메서드를 통해 db에 저장해줌
    int cnt = sql.insertMember(member.getUserId(),member.getUserPwd(),member.getUserName(),member.getUserPhoto());
    String loca = "loginform.jsp";
    if(cnt!=1){
        request.setAttribute("msg","이미 가입하신 이메일입니다!");
        loca = "memberRegform.jsp";

    }
        %><jsp:forward page="<%=loca%>"/>
<%--가입 후 loginform에 입력--%>


<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/default.css">
</head>
<body>

</body>
</html>
