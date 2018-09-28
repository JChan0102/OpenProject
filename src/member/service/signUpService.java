package member.service;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import member.dao.memberDAO;
import member.model.memberVO;
import service.ServiceException;

import java.sql.Connection;
import java.sql.SQLException;

public class signUpService {
    private static signUpService service = new signUpService();

    private signUpService(){};

    public static signUpService getService(){

        return service;
    }

    public int signUp(memberVO member) throws ServiceException {
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            memberDAO dao = memberDAO.getInstance();
           return dao.insert(conn,member);
        } catch (SQLException e) {
           throw new ServiceException("메세지등록 실패 : "+ e.getMessage(),e);
        } finally {
            JdbcUtil.close(conn);
        }


    }

}
