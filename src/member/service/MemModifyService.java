package member.service;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import member.dao.MemberDAO;
import member.model.MemberVO;
import service.ServiceException;

import java.sql.Connection;
import java.sql.SQLException;

public class MemModifyService {
    private static MemModifyService service = new MemModifyService();
    private MemModifyService(){}

    public static MemModifyService getService(){
        return service;
    }

    public MemberVO selectMember(String memberId) throws ServiceException {
        Connection conn = null;

        try {
            conn= ConnectionProvider.getConnection();
            MemberDAO dao = MemberDAO.getInstance();
            return dao.select(conn,memberId);

        } catch (SQLException e) {
            throw new ServiceException("메세지등록 실패 : "+ e.getMessage(),e);
        } finally {
            JdbcUtil.close(conn);
        }
    }

    public void updateMember(MemberVO member) throws ServiceException {
        Connection conn = null;
        try {
            conn= ConnectionProvider.getConnection();
            MemberDAO dao = MemberDAO.getInstance();
            dao.update(conn,member);
        } catch (SQLException e) {
           throw new ServiceException("메세지등록 실패 : "+ e.getMessage(),e);
        } finally {
            JdbcUtil.close(conn);
        }
    }

}
