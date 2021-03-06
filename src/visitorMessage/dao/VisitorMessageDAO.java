package visitorMessage.dao;


import jdbc.JdbcUtil;
import visitorMessage.model.VisitorMessageVO;

import javax.sql.ConnectionPoolDataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class VisitorMessageDAO {

    private static VisitorMessageDAO dao = new VisitorMessageDAO();
    public static VisitorMessageDAO getInstance() {
        return dao;
    }
    private VisitorMessageDAO(){}
    public int insert (Connection conn, VisitorMessageVO message) throws SQLException {
        PreparedStatement pstmt = null;
       try{

           pstmt= conn.prepareStatement("insert into visitorMessage (visitormessage_id, username, userid, message) values (visitormessage_id_seq.NEXTVAL,?,?,?)");
           pstmt.setString(1,message.getUserName());
           pstmt.setString(2, message.getUserId());
           pstmt.setString(3,message.getMessage());

           return pstmt.executeUpdate();

    } finally {
           JdbcUtil.close(pstmt);
       }
    }
    public int selectListCount (Connection conn)throws SQLException{
        Statement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "select count(*) from visitorMessage";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            rs.next();
            return rs.getInt(1);
        }finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(stmt);
        }



    }
    private VisitorMessageVO makeMessageFromResultSet(ResultSet rs) throws SQLException {
        VisitorMessageVO message = new VisitorMessageVO();
        message.setId(rs.getInt("visitormessage_id"));
        message.setUserName(rs.getString("username"));
        message.setUserId(rs.getString("userid"));
        message.setMessage(rs.getString("message"));
        return message;
    }

    public List<VisitorMessageVO> selectList(Connection conn, int firstRow, int endRow) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            String sql = "select visitormessage_id, username, userid, message  from "+"(SELECT ROWNUM rm, visitormessage_id, username,userid, message FROM "+"(SELECT * FROM VISITORMESSAGE ORDER by visitormessage_id) "+"WHERE rownum<=?) "+"where rm>=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,endRow);
            pstmt.setInt(2,firstRow);
         rs= pstmt.executeQuery();
        if(rs.next()){
            List<VisitorMessageVO> messageVOList = new ArrayList<VisitorMessageVO>();
            do{
                messageVOList.add(makeMessageFromResultSet(rs));
            }while (rs.next());
                return messageVOList;
            }else{
                return Collections.emptyList();
            }
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }

    }

}
