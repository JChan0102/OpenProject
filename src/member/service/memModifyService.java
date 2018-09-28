package member.service;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import member.dao.memberDAO;
import member.model.memberVO;
import service.ServiceException;

import java.sql.Connection;
import java.sql.SQLException;

public class memModifyService {
    private static memModifyService service = new memModifyService();
    private memModifyService(){}

    public static memModifyService getService(){
        return service;
    }

    public memberVO selectMember(String memberId) throws ServiceException {
        Connection conn = null;

        try {
            conn= ConnectionProvider.getConnection();
            memberDAO dao = memberDAO.getInstance();
            return dao.select(conn,memberId);

        } catch (SQLException e) {
            throw new ServiceException("메세지등록 실패 : "+ e.getMessage(),e);
        } finally {
            JdbcUtil.close(conn);
        }
    }

    public void updateMember(memberVO member) throws ServiceException {
        Connection conn = null;
        try {
            conn= ConnectionProvider.getConnection();
            memberDAO dao = memberDAO.getInstance();
            dao.update(conn,member);
        } catch (SQLException e) {
           throw new ServiceException("메세지등록 실패 : "+ e.getMessage(),e);
        } finally {
            JdbcUtil.close(conn);
        }
    }

}
