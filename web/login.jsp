<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.openproject.memberVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-06
  Time: 오후 3:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
//login form에서 sumit 받은 값 String 변수에 저장한다.

    String id = request.getParameter("userId");
    String pwd = request.getParameter("userPwd");
    String ck = request.getParameter("idck");


    // Map 선언

    Map members = new HashMap();
    //ArrayList 선언
   // List members = new ArrayList<memberVO>();
    //만약 application에 저장된 members 라는 속성이 존재 한다면
    //members에 선언해줌
    if (application.getAttribute("members") != null) {

        members = (HashMap) application.getAttribute("members");
       // members=(ArrayList) application.getAttribute("members");
        //System.out.println(application.getAttribute("members").toString());
    }
%>
<html>
<head>
    <script src="https://code.jquery.com/jquery-1.10.0.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
    <title>Title</title>
    <link rel="stylesheet" href="css/default.css">
    <style>
        h2, td {
            padding-bottom: 10px;
            padding-top: 10px;
        }

    </style>
</head>
<body>

<%@include file="menu.jsp" %>
<div class="content">
    <h2>Login</h2>
    <hr>
    <h1>아이디 또는 비번이 틀려요 </h1>
    <h1><a href="loginform.jsp">다시 로그인 해보세요</a></h1>
        <%
        //id와 pwd가 null이 아니면
        if(id!=null&&pwd!=null){



//List시 get(index)에 null이 아니고 input으로 입력 받은 id와 pwd값이 일치하면 redirect
 //   for(int i=0;i<members.size();i++){
   //     if(members.get(i)!=null){
//        memberVO memberCK = (memberVO) members.get(i);
 //           if(memberCK.getUserId().equals(id)&&memberCK.getUserPwd().equals(pwd)){
//세션에 저장함 세션에 저장할떄는 pwd값은 ""로 입력
    //새로 생성안하고 map에 있는 객체를 사용하게되면 객체의 비밀번호를 setUserPwd("")하면 map에있는 원래 객체값의 pwd도 ""이 되므로 다음에 로그인을 할수가 없다.
             // memberCK.setUserPwd("");
             // request.getSession(false).setAttribute("user",memberCK);
//               request.getSession(false).setAttribute("user", new memberVO(memberCK.getUserId(),"",memberCK.getUserName(),memberCK.getUserPhoto()));
//                response.sendRedirect("myPage.jsp");
//            }
//        }
//    }
//        }
    // members에 id라는 key가 존재한다면
   if(members.containsKey(id)){
//아이디 값에 해당하는 memberVO값 받아오기
    memberVO memberCk = (memberVO) members.get(id);
//해당 아이디와 pwd와 일치하면
if(id.equals(memberCk.getUserId())&&pwd.equals(memberCk.getUserPwd())){

    if(ck!=null){
    Cookie cookie = new Cookie("preId",memberCk.getUserId());
   response.addCookie(cookie);
    }else {
      Cookie cookie = new Cookie("preId","");
      cookie.setMaxAge(0);
      response.addCookie(cookie);
    }
    //세션에 저장함 세션에 저장할떄는 pwd값은 ""로 입력
    //새로 생성안하고 map에 있는 객체를 사용하게되면 객체의 비밀번호를 setUserPwd("")하면 map에있는 원래 객체값의 pwd도 ""이 되므로 다음에 로그인을 할수가 없다.
    request.getSession(false).setAttribute("user", new memberVO(memberCk.getUserId(),"",memberCk.getUserName(),memberCk.getUserPhoto()));
        response.sendRedirect("myPage.jsp");
        }
    }

}
%>

</body>
</html>
