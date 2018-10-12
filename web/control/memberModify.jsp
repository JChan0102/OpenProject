<%@ page import="member.service.MemModifyService" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<%@ page import="member.model.MemberSessionVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
<%
    //request에 modi라는 값이 있으면 실행
    if(request.getParameter("modi")!=null){
        MemModifyService modifyService = MemModifyService.getService(); %>
<%--수정창에서 sumit으로 받아온값  member 객체에 setProperty 해줌 --%>
<jsp:useBean id="member" class="member.model.MemberVO" scope="request"/>
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
                        System.out.println(dir);
                        File file = new File(dir,newFileName);
                        item.write(file);
                        member.setUserPhoto(newFileName);
                    }else{
                        member.setUserPhoto(request.getParameter("preuserPhoto"));
                    }
                }

            }
        }
        //만약 photo를 새로 저장하지 않으면 저장해논 이전값으로 되돌림 Null->이전사진명
        // member객체를 이용해 update메서드를 수행
        modifyService.updateMember(member);
        session.setAttribute("user",new MemberSessionVO(member.getUserId(),member.getUserName(),member.getUserPhoto()));
    }
    response.sendRedirect(request.getContextPath()+"/control/memberList.jsp");
%>