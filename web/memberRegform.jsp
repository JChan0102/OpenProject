<%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-05
  Time: 오후 4:44
  To change this template use File | Settings | File Templates.
--%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ page pageEncoding="UTF-8" %>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<html>
<head>
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
    <h2>SignUp</h2>
    <p style="color: red">${msg}</p>
    <form action="signUpSuccess.jsp" method="post" id="regform">
        <table>
            <tr>
                <td><label for="userId">아이디(이메일)</label></td>
                <td><input type="text" name="userId" id="userId" onblur="ck(this)"></td>
                <td>   <p id="ckuserId"></p></td>
            </tr>
            <tr>
                <td><label for="userPwd">비밀번호</label></td>
                <td><input type="password" name="userPwd" id="userPwd"  onblur="ck(this)"></td>
              <td>  <p id="ckuserPwd"></p></td>
            </tr>
            <tr>
                <td><label for="userName">이름</label></td>
                <td><input type="text" name="userName" id="userName"  onblur="ck(this)"></td>
                <td><p id="ckuserName"></p></td>
            </tr>
            <tr>
                <td><label for="userPhoto">사진</label></td>
                <td><input type="file" name="userPhoto" id="userPhoto"></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center"><input type="submit"  onsubmit="allck()" value="등록"></td>
            </tr>

        </table>
    </form>

</div>

</body>
<script>
    function ck(a) {
        var idname= '#ck'+a.id;
        var ptag = $(idname);
        if(a.value==""){
            ptag.html('필수 입력입니다.');
        }else{
            if(a.id=='userId'){
               // if((/[^a-z0-9_@.]/.test(a.value)==true||/@?/.test(a.value)==true||a.value.length<=5||a.value.length>=20){
                 if((/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i).test(a.value)){
                     ptag.html('사용 가능합니다.');
                }else{

                     ptag.html('이메일 형식에 맞지 않습니다. 다시 확인해주세요');
                }

            }else if(a.id=='userPwd'){

                if(a.value.length>=8&&a.value.length<=16&&(/[a-zA-Z]/.test(a.value)==true&&/[0-9]/.test(a.value)==true&&/[^a-zA-Z0-9]/.test(a.value)==true)){
                    ptag.html('사용 가능합니다.');
                }else{
                    ptag.html('8~16자 영문 대소문자, 숫자, 특수문자를 모두 사용하세요.');

                }

            }else{
                ptag.html('');
            }

        }
    }
    $('#regform').submit(function () {
        ck(document.getElementById('userId'));
        ck(document.getElementById('userPwd'));
        ck(document.getElementById('userName'));
        if($('#ckuserId').html()!='사용 가능합니다.'||$('#ckuserPwd').html()!='사용 가능합니다.'||$('#ckuserName').html()!=''){
            alert('회원가입 양식을 다시 확인하세요')
            return false;
        }else{
            return true;
        }
    });

    
</script>
</html>
