<%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-29
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
<%@ page import="java.util.*" %>
<%@ page import="member.model.memberVO" %>
<%@ page import="member.service.memListViewService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
        memListViewService listViewService = memListViewService.getService();
        //memberInfo에 저장된 모든 컬럼을 가져오는 select문을 list에 저장.
        List<memberVO> memberlist = listViewService.getmemberList();
        //el을 사용하기 위해 setAtrribute 해줌
        request.setAttribute("members",memberlist);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/memberListView.jsp");
        dispatcher.forward(request,response);
    %>
