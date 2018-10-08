<%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-10-08
  Time: 오후 5:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/default.css">
    <style>
        h2, td {
            padding-bottom: 10px;
            padding-top: 10px;
        }

        td {
            text-align: center;
            width: 100px;
        }
        table{
            border-collapse: collapse;
        }
        tr{
            border-bottom: 1px solid #666666;
        }
      .btn{
          width: 150px;
          height: 74px;
          margin-right: 5px;
          margin-bottom: 10px;
      }
    </style>
</head>
<body>

<%@include file="menu.jsp" %>
<h2>회원리스트</h2>
<button class="btn" onclick="json()">json</button><button class="btn" onclick="XML()">XML</button>
<p id="jj"></p>
<p id="jsonS"></p>
<table>

    <tr class="tablehead">
        <td>
            Id
        </td>
        <td>
            pwd
        </td>
        <td>
            name
        </td>
        <td>
            photo
        </td>
        <td>
            수정 / 삭제
        </td>
    </tr>

    <tbody id="tbody">
    <%-- List의 값 하나씩 출력.--%>
    <script>
        function json(){
            resett();
            $.ajax({
                url:'<%=request.getContextPath()%>/control/memberListJson.jsp',
                success:function (data) {
                    $('#jj').append('JSON 형식 ajax로 받은값');
                    $('#jsonS').append(data.trim());
                    jasonData = JSON.parse(data.trim());
                    $(jasonData.members).each(function (key, value) {
                        $('#tbody').append(
                            '<tr> <td>'
                            + value.userId+'</td> <td>'
                            + value.userPwd+'</td> <td>'
                            + value.userName+'</td> <td>' +
                            '<img style="width: 160px" alt="회원사진" src="${pageContext.request.contextPath}/uploadImg/'
                            + value.userPhoto+'"></td>'
                            +'<td><a href="../control/remove.jsp?modiid='+value.userId+'"><button>수정</button></a> / ' +
                            '<a href="../control/remove.jsp?removeid='+value.userId+'"><button>삭제</button></a></td> </tr>'
                        )


                    });
                },
                error:function () {
                    alert("error")
                }

            });
        }
        function XML(){
            resett();
            $.ajax({
                url:'<%=request.getContextPath()%>/control/memberListXML.jsp',
                success:function (data) {
                    $('#jj').append('XML 형식 ajax로 받은값');
                    $(data).find('member').each(function () {
                        var userid = $(this).find('userId').text().trim();
                        var userpwd =$(this).find('userPwd').text().trim();
                        var username = $(this).find('userName').text().trim();
                        var userphoto = $(this).find('userPhoto').text().trim();
                        $('#tbody').append(
                            '<tr> <td>'
                            +userid+'</td> <td>'
                            + userpwd+'</td> <td>'
                            +username+'</td> <td>' +
                            '<img style="width: 160px" alt="회원사진" src="${pageContext.request.contextPath}/uploadImg/'
                            + userphoto+'"></td>'
                            +'<td><a href="../control/remove.jsp?modiid='+userid+'"><button>수정</button></a> / ' +
                            '<a href="../control/remove.jsp?removeid='+userid+'"><button>삭제</button></a></td> </tr>'
                        )

                    })
                },
                error:function () {
                    alert("error")
                }

            });
        }

        function resett() {
            $('#jj').text('');
            $('#jsonS').text('');
            $('#tbody').text('');
        }

    </script>
 <%--   <c:choose>
        <c:when test="${members.size()!=0}">
            <c:forEach items="${members}" var="member">
                <tr>
                    <td>
                            ${member.userId}
                    </td>
                    <td>${member.userPwd}
                    </td>
                    <td>${member.userName}
                    </td>
                    <td ><img style="width: 160px" alt="회원사진" src="${pageContext.request.contextPath}/uploadImg/${member.userPhoto}">
                    </td>
                        &lt;%&ndash;수정 버튼 클릭시 modiid라는 키에 userID값을 get형식으로 보내줌
                            삭제 버튼 클릭시 removeid라는 키에 userID값을 get형식으로 보내줌&ndash;%&gt;
                    <td><a href="../control/remove.jsp?modiid=${member.userId}"><button>수정</button></a> / <a href="../control/remove.jsp?removeid=${member.userId}"><button>삭제</button></a></td>
                </tr>

            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="5">등록된 회원 정보가 없습니다.</td>
            </tr>
        </c:otherwise>
    </c:choose>--%>
    </tbody>
</table>
</body>
</html>