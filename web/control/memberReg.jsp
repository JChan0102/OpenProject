<%@ page import="member.service.signUpService" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<%--
  Created by IntelliJ IDEA.
  User: JChan
  Date: 2018-09-06
  Time: 오후 2:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--사용자로부터 입력받은 회워가입 form 값은 UseBean을 통해 setProperty해줌--%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="member" class="member.model.memberVO" scope="request"/>
<%
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);

    if(isMultipart){
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> items = upload.parseRequest(request);
        Iterator<FileItem> itr = items.iterator();
        while (itr.hasNext()){
            FileItem item = itr.next();
            if(item.isFormField()){
                if(item.getFieldName().equals("userId")){
                    member.setUserId(item.getString("utf-8"));
                }
                if(item.getFieldName().equals("userName")){
                    member.setUserName(item.getString("utf-8"));
                }
                if(item.getFieldName().equals("userPwd")){
                    member.setUserPwd(item.getString("utf-8"));
                }
            }else {

                if(item.getFieldName().equals("userPhoto")&&item.getSize()>0&&item.getName()!=null&&item.getName().length()>0){
                    String newFileName = "";
                    String fileName = item.getName();
                    newFileName = System.currentTimeMillis()+"_"+fileName;

                    String uploadUri="/uploadImg";
                    String dir = request.getSession().getServletContext().getRealPath(uploadUri);
                    File file = new File(dir,newFileName);
                    item.write(file);
                    member.setUserPhoto(newFileName);
                }
            }

        }
    }
    //sql 메서드를 사용할 객체 생성
    signUpService service = signUpService.getService();
    int cnt=service.signUp(member);
    // member값을 insert메서드를 통해 db에 저장해줌
    String loca = request.getContextPath()+"/view/loginform.jsp";
    if(cnt!=1){
        request.setAttribute("msg","이미 가입하신 이메일입니다!");
        loca = request.getContextPath()+"/view/memberRegform.jsp";

    }
        %><jsp:forward page="<%=loca%>"/>
<%--가입 후 loginform에 입력--%>


<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/default.css">
</head>
<body>

</body>
</html>
