<%@ page import="member.service.memListViewService" %>
<%@ page import="member.model.memberVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="JSON/aplication;charset=UTF-8" language="java" %>
<%      memListViewService listViewService = memListViewService.getService();
    String jsonMemberList= listViewService.jsonMemberList();
    request.setAttribute("members",jsonMemberList);%>
${requestScope.members}