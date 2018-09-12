<%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-05
  Time: 오후 4:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%request.setCharacterEncoding("utf-8");
//Cookie[] cookies = request.getCookies();
//String idcked="";
//String idval="";
//if(cookies!=null&&cookies.length>0){
//
//    for(int i=0;i<cookies.length;i++ ){
//        if(cookies[i].getName().equals("preId")){
//            idval = cookies[i].getValue();
//            idcked="checked";
//        }
//
//    }
//
//}
%>


<%--<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>--%>
<html>
<head>
  <%--  <script>
        $(document).ready(function () {
        if($.cookie("idck")!=null){
            $("input[name=idck]").prop("checked",true);
           if($.cookie("preId")!=null) {
                $("input[name=userId]").val($.cookie("preId"));
            }
        }else{
            $.removeCookie("preId");
        }
          $("form").submit(function () {
                if($("input[name=idck]").is(":checked")){
                   $.cookie("idck","ck");
                }else{
                    $.removeCookie("idck");
                }
            });
        });
    </script>--%>
    <title>$Title$</title>
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
<%--<%
//    String msg = null;
//     msg = (String)request.getAttribute("msg");
//    if(msg!=null){
        %>--%>
        <p>${msg}</p>
<%--        <%
    }
%>--%>
    <form action="login.jsp" method="post">
        <table>
            <tr>
                <td>아이디(이메일)</td>
                <td><input type="text" name="userId" value="${cookie.preId.value}" >

                    <input type="checkbox"
                    <c:if test="${cookie.containsKey('preId')}">
                      checked
                    </c:if>
                           name="idck" value="idck">
                   </td>
            </tr>

            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="userPwd"></td>
            </tr>

            <tr>
                <td colspan="2" style="text-align: center"><input type="submit" value="로그인"></td>
            </tr>
        </table>
    </form>

</div>

</body>
</html>
