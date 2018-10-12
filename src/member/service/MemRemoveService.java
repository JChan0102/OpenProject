package member.service;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import member.dao.MemberDAO;
import service.ServiceException;

import java.sql.Connection;
import java.sql.SQLException;

public class MemRemoveService {
    private static MemRemoveService service = new MemRemoveService();

    public static MemRemoveService getService() {
        return service;
    }
    private MemRemoveService(){};

    public void removeMember(String userId) throws ServiceException {
        Connection conn =null;
        try {
            conn= ConnectionProvider.getConnection();
            MemberDAO dao = MemberDAO.getInstance();
            dao.delete(conn,userId);
        } catch (SQLException e) {
            JdbcUtil.rollback(conn);
            throw new ServiceException("메세지등록 실패 : "+ e.getMessage(),e);
        } finally {
            JdbcUtil.close(conn);
        }


    }

}
