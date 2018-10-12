package member.service;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import member.dao.MemberDAO;
import member.model.MemberVO;
import service.ServiceException;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

public class MemListViewService {

    private static MemListViewService service = new MemListViewService();

    private MemListViewService() { }

    public static MemListViewService getService(){
        return service;
    }

    public List<MemberVO> getmemberList() throws ServiceException {
            Connection conn = null;
            try {
                conn = ConnectionProvider.getConnection();
                MemberDAO dao = MemberDAO.getInstance();
                return dao.selectAll(conn);
            } catch (SQLException e) {
                throw new ServiceException("메세지등록 실패 : "+ e.getMessage(),e);
            } finally {
                JdbcUtil.close(conn);
            }
    }
    //memberList값을 json형태의 String으로 반환하는 메서드
    public String jsonMemberList(){
        List<MemberVO> list = getmemberList();
        String stringList = "{\"members\" : [ ";

        Iterator iterator = list.iterator();

        while (iterator.hasNext()){

         MemberVO member = (MemberVO) iterator.next();

         stringList+= "{ \"userId\" : \""+ member.getUserId()+ "\", "+
                      " \"userPwd\" : \""+ member.getUserPwd()+ "\", "+
                      " \"userName\" : \""+ member.getUserName()+ "\", "+
                      " \"userPhoto\" : \""+ member.getUserPhoto()+ "\" }";
         if(iterator.hasNext()){
             stringList +=", ";
         }
        }
        return stringList +" ] }";
    }

}
