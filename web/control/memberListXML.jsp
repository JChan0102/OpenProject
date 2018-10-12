<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="member.service.MemListViewService" %>
<%@ page import="member.model.MemberVO" %>
<%@ page import="java.util.List" %>
<%
    MemListViewService listViewService = MemListViewService.getService();
    //memberInfo에 저장된 모든 컬럼을 가져오는 select문을 list에 저장.
    List<MemberVO> memberlist = listViewService.getmemberList();
    //el을 사용하기 위해 setAtrribute 해줌
    request.setAttribute("members",memberlist);
    //XML형식의 파일 생성
%>
<members>
    <c:forEach items="${members}" var="member">
        <member>
            <userId>
                    ${member.userId}
            </userId>
            <userPwd>
                    ${member.userPwd}
            </userPwd>
            <userName>
                    ${member.userName}
            </userName>
            <userPhoto>
                    ${member.userPhoto}
            </userPhoto>
        </member>
    </c:forEach>
</members>