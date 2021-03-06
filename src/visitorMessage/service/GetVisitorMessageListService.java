package visitorMessage.service;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import service.ServiceException;
import visitorMessage.dao.VisitorMessageDAO;
import visitorMessage.model.VisitorMessageListView;
import visitorMessage.model.VisitorMessageVO;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

public class GetVisitorMessageListService {

    private static GetVisitorMessageListService service = new GetVisitorMessageListService();

    public static GetVisitorMessageListService getService(){
        return service;
    }

    private GetVisitorMessageListService(){}

    private static final int MESSAGE_COUNT_PER_PAGE=5;

    public VisitorMessageListView getVisitorMessageList(int pageNumber)throws ServiceException{

        Connection conn = null;
        int currentPageNumber=pageNumber;
        try {
            conn= ConnectionProvider.getConnection();
            VisitorMessageDAO messageDAO = VisitorMessageDAO.getInstance();
            int messageTotalCount = messageDAO.selectListCount(conn);
            List<VisitorMessageVO> messageVOList =null;
            int firstRow =0;
            int endRow=0;
            if(messageTotalCount>0){
                firstRow=(pageNumber-1)*MESSAGE_COUNT_PER_PAGE+1;
                endRow=firstRow+MESSAGE_COUNT_PER_PAGE-1;
                messageVOList = messageDAO.selectList(conn,firstRow,endRow);
            }else {
                currentPageNumber=0;
                messageVOList= Collections.emptyList();
            }
            return new VisitorMessageListView(messageVOList,messageTotalCount,currentPageNumber,MESSAGE_COUNT_PER_PAGE,firstRow,endRow);
        } catch (SQLException e) {
           throw new ServiceException("메세지 목록 구하기 실패: "+ e.getMessage(),e);
        } finally {
            JdbcUtil.close(conn);
        }

    }

}
