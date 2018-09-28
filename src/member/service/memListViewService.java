package member.service;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import member.dao.memberDAO;
import member.model.memberVO;
import service.ServiceException;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class memListViewService {

    private static memListViewService service = new memListViewService();

    private memListViewService() { }

    public static memListViewService getService(){
        return service;
    }

    public List<memberVO> getmemberList() throws ServiceException {
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            memberDAO dao = memberDAO.getInstance();
            return dao.selectAll(conn);
        } catch (SQLException e) {
            throw new ServiceException("메세지등록 실패 : "+ e.getMessage(),e);
        } finally {
            JdbcUtil.close(conn);
        }


    }


}
