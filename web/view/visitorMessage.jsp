<%@ page import="visitorMessage.service.GetVisitorMessageListService" %>
<%@ page import="visitorMessage.model.VisitorMessageListView" %>
<%@ page import="visitorMessage.model.VisitorMessageVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="../css/default.css">
</head>
<body>
<div style="width: 750px; margin: auto">
    <%@include file="menu.jsp" %>
<form action="../control/writeVisitorMessage.jsp" method="post">
    <table style="border: 1px solid gray">
    <tr>
        <td>name </td>
        <td><input name="userName" value=" ${sessionScope.get('user').getUserName()}" readonly >
            <input name="userId" type="hidden" value=" ${sessionScope.get('user').getUserId()}" readonly ></td>
    </tr>
    <tr>
        <td>내용</td>
        <td><textarea name="message" cols="22" row="4" <c:if test="${!(sessionScope.containsKey('user'))}"> placeholder="로그인후 이용가능합니다." readonly </c:if> ></textarea></td>

    </tr>
    <tr>
        <td colspan="2" style="text-align: center"><input type="submit"></td>
    </tr>
</table>
</form>

<% String pageNumberStr=request.getParameter("page");
int pageNumber=1;
if(pageNumberStr!=null) {
    pageNumber = Integer.parseInt(pageNumberStr);
}
    GetVisitorMessageListService listService = GetVisitorMessageListService.getService();

VisitorMessageListView listView = listService.getVisitorMessageList(pageNumber);
if(listView.isEmpty()){
    %>
등록된 메세지가 없습니다.
<%
}else{%>
<table border="1">
    <%for(VisitorMessageVO message : listView.getMessageList()){%>
    <tr>
        <td>
            메세지 번호 : <%=message.getId()%>
            이름 : <%=message.getUserName()%>
            메세지 : <%=message.getMessage()%>
            <%--<a href="confirmDeletion.jsp?messageId=<%= message.getId() %>">
                [삭제하기]</a>--%>
        </td>
    </tr>
<%}%>
</table>
<%for(int i = 1; i<=listView.getPageTotalCount(); i++){%>
<a href="visitorMessage.jsp?page=<%=i%>">[<%=i%>]</a>

<%
}
}
%>


</div>
</body>
</html>
