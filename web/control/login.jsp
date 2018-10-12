<%@ page import="member.service.SignInService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- useBean을 통해  sumit으로 받은 값을 setProperty를 이용해 값 저장 --%>
<jsp:useBean id="inputmember" class="member.model.MemberVO"/>
<jsp:setProperty name="inputmember" property="*"/>
<% SignInService service = SignInService.getService();
 service.memSignIn(inputmember,request,response);
    %>
<html>
<head>
</head>
<body>
</body>
</html>
