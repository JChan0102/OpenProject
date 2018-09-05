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
  <h2>Login</h2>
  <hr>

  <form>
    <table>
      <tr>
        <td>아이디(이메일)</td>
        <td><input type="text" name="id"></td>
      </tr>

      <tr>
        <td>비밀번호</td>
        <td><input type="password" name="pwd"></td>
      </tr>

      <tr>
        <td colspan="2" style="text-align: center"><input type="submit" value="로그인"></td>
      </tr>
    </table>
  </form>

</div>

  </body>
</html>
