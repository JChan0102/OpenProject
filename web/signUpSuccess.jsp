<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.openproject.memberVO" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-06
  Time: 오후 2:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    //form에 저장된 값을 String 으로 변수 선언
    String id = request.getParameter("userId");
    String pwd = request.getParameter("userPwd");
    String name = request.getParameter("userName");
    String img = request.getParameter("userPhoto");
    // 키는 String형식과 값은 memberVO인 HashMap()생성
    // Map members = new HashMap<String, memberVO>();
    List members = new ArrayList<memberVO>();
    //만약 application에 저장된 members 라는 속성이 존재 한다면
    //members에 선언해줌
    if (application.getAttribute("members") != null) {

        //  members = (HashMap) application.getAttribute("members");
        members = (ArrayList) application.getAttribute("members");
    }
    //members에 키는 id로 값은 memberVO객체로 새로 만들어 put해줌
    //  members.put(id, new memberVO(id, pwd, name, img));
    members.add(new memberVO(id, pwd, name, img));

    //application에 members라는 속성의 값을 members값으로 엎어치기해줌
    application.setAttribute("members", members);
    //저장완료후 loginform으로 Redirect해줌.
    response.sendRedirect("/loginform.jsp");
%>
<html>
<head>

    <title>Title</title>
    <link rel="stylesheet" href="css/default.css">
</head>
<body>

</body>
</html>
