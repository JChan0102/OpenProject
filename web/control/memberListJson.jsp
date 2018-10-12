<%@ page import="member.service.MemListViewService" %>
<%@ page contentType="JSON/aplication;charset=UTF-8" language="java" %>
<%      MemListViewService listViewService = MemListViewService.getService();
    //memberList를 JSON형대로 저장하는 서비스 생성.
    String jsonMemberList= listViewService.jsonMemberList();
    //el을 사용하기위해 속성저장.
    request.setAttribute("members",jsonMemberList);
%>
${requestScope.members}