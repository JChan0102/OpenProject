package member.service;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import member.dao.memberDAO;
import service.ServiceException;

import java.sql.Connection;
import java.sql.SQLException;

public class memRemoveService {
    private static memRemoveService service = new memRemoveService();

    public static memRemoveService getService() {
        return service;
    }
    private memRemoveService(){};

    public void removeMember(String userId) throws ServiceException {
        Connection conn =null;
        try {
            conn= ConnectionProvider.getConnection();
            memberDAO dao = memberDAO.getInstance();
            dao.delete(conn,userId);
        } catch (SQLException e) {
            JdbcUtil.rollback(conn);
            throw new ServiceException("메세지등록 실패 : "+ e.getMessage(),e);
        } finally {
            JdbcUtil.close(conn);
        }


    }

}
