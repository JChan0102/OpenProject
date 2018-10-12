package member.service;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import member.dao.MemberDAO;
import member.model.MemberVO;
import service.ServiceException;

import java.sql.Connection;
import java.sql.SQLException;

public class SignUpService {
    private static SignUpService service = new SignUpService();

    private SignUpService(){};

    public static SignUpService getService(){

        return service;
    }

    public int signUp(MemberVO member) throws ServiceException {
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            MemberDAO dao = MemberDAO.getInstance();
           return dao.insert(conn,member);
        } catch (SQLException e) {
           throw new ServiceException("메세지등록 실패 : "+ e.getMessage(),e);
        } finally {
            JdbcUtil.close(conn);
        }


    }

}
