<%@ page import="member.service.signInService" %>
<%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-06
  Time: 오후 3:02
  To change this template use File | Settings | File Templates.
--%>
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
