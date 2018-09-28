package member.service;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import member.dao.memberDAO;
import member.model.memberVO;
import service.ServiceException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class signInService {
    private static signInService service = new signInService();
    private signInService(){}
    public static signInService getService(){
        return service;
    }

    public void memSignIn(memberVO member, HttpServletRequest request, HttpServletResponse response) throws ServiceException, IOException, ServletException {
        Connection conn = null;
        String url =request.getContextPath()+"/loginform.jsp";
        try {
            conn= ConnectionProvider.getConnection();
            memberDAO dao = memberDAO.getInstance();

            memberVO Dbmember = dao.select(conn,member.getUserId());
            if(Dbmember.getUserId()!=null){
             if(Dbmember.pwdEquals(member.getUserPwd())){
                 url = CookieSessionCreate(Dbmember,request,response);
             }
            }
            request.setAttribute("msg","아이디 혹은 비밀번호 일치하지 않습니다.");
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request,response);

        } catch (SQLException e) {
            throw new ServiceException("에러 :"+e.getMessage(),e);
        } finally {
            JdbcUtil.close(conn);
        }


    }

    private String CookieSessionCreate(memberVO member, HttpServletRequest request, HttpServletResponse response){
        String ck = request.getParameter("idck");
        Cookie cookie = new Cookie("preId",member.getUserId());
        if(ck!=null){
            response.addCookie(cookie);
        }else {
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
        request.getSession(false).setAttribute("user", new memberVO(member.getUserId(),"",member.getUserName(),member.getUserPhoto()));
        return request.getContextPath()+"/myPage/myPage.jsp";
    }

}
