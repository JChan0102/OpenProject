<%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-05
  Time: 오후 4:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <link rel="stylesheet" href="css/default.css">
    <style>
      h2, td{
        padding-bottom: 10px;
        padding-top: 10px;
      }

    </style>
  </head>
  <body>
  <%@include file="menu.jsp"%>
<div class="content">
  <h2>SignUp</h2>

  <form>
    <table>
      <tr>
        <td><label for="id">아이디(이메일)</label></td>
        <td><input type="text" name="id" id="id"></td>
      </tr>
      <tr>
        <td><label for="pwd">비밀번호</label></td>
        <td><input type="password" name="pwd" id="pwd"></td>
      </tr>
      <tr>
        <td><label for="name">이름</label></td>
        <td><input type="text" name="name" id="name"></td>
      </tr>
      <tr>
        <td><label for="img">사진</label></td>
        <td><input type="file" name="img" id="img"></td>
      </tr>
      <tr>
        <td colspan="2" style="text-align: center"> <input type="submit" value="등록"></td>
      </tr>

    </table>
  </form>

</div>

  </body>
</html>
