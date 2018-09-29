<%@ page import="member.model.memberVO" %>
<%@ page import="member.dao.memberDAO" %>
<%@ page import="member.service.signInService" %>
<%--<%@ page import="service.ServiceException" %>--%>
<%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-06
  Time: 오후 3:02
  To change this template use File | Settings | File Templates.
--%>
<%request.setCharacterEncoding("utf-8");
//login form에서 sumit 받은 값 String 변수에 저장한다
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- useBean을 통해  sumit으로 받은 값을 setProperty를 이용해 값 저장 --%>
<jsp:useBean id="inputmember" class="member.model.memberVO"/>
<jsp:setProperty name="inputmember" property="*"/>
<% signInService service = signInService.getService();
        service.memSignIn(inputmember,request,response);
    %>
<html>
<head>
</head>
<body>
</body>
</html>
