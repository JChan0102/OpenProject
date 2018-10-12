package visitorMessage.service;

import service.ServiceException;
import visitorMessage.dao.VisitorMessageDAO;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import visitorMessage.model.VisitorMessageVO;

import java.sql.Connection;
import java.sql.SQLException;

public class WriteVisitorMessageService {
    private static WriteVisitorMessageService service = new WriteVisitorMessageService();
    public static WriteVisitorMessageService getService (){
        return service;
    }
    private WriteVisitorMessageService(){};

    public void write(VisitorMessageVO message) throws ServiceException {
        Connection conn = null;
        try {
            conn= ConnectionProvider.getConnection();
            VisitorMessageDAO dao = VisitorMessageDAO.getInstance();
            dao.insert(conn,message);
        } catch (SQLException e) {
          throw  new ServiceException("메세지 등록 실패 :"+ e.getMessage(), e) ;
        }finally {
            JdbcUtil.close(conn);
        }


    }

}
