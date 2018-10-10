<%@ page import="member.model.memberVO" %>
<%@ page import="member.service.memModifyService" %>
<%@ page import="member.service.memRemoveService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="members" class="java.util.HashMap" scope="application"/>
    <%
        //sql문을 실행하기 위한 객체 생성
        memRemoveService removeService = memRemoveService.getService();
        //만약 removeid란 값이 있다면 (삭제버튼을 눌렀다면)
        if(request.getParameter("removeid")!=null){
            //sqld의 delete문을 실행 후 리스트로 다시 페이지 이동
            removeService.removeMember(request.getParameter("removeid"));
        response.sendRedirect("/control/memberList.jsp");
    }
      //만약 modiid란 값이 있다면 (수정버튼을 눌렀다면)
    if(request.getParameter("modiid")!=null){
        //select문을 실행해 userid에 해당하는 pwd,name,photo값 가져옴
        memModifyService modifyService = memModifyService.getService();

        memberVO member =  modifyService.selectMember(request.getParameter("modiid"));
        request.setAttribute("member",member);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/memberModiForm.jsp");
        dispatcher.forward(request,response);
    }%>
</body>
</html>
