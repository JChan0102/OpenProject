package dao;


import jdbc.JdbcUtil;
import model.visitorMessageVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class visitorMessageDAO {

    private static visitorMessageDAO dao = new visitorMessageDAO();

    public static visitorMessageDAO getInstance() {
        return dao;
    }
    private visitorMessageDAO(){}
    public int insert (Connection conn, visitorMessageVO message) throws SQLException {
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

    public List<visitorMessageVO> selectList(Connection conn, int firstRow, int endRow) throws SQLException {
        PreparedStatement pstmt = null;

        try{
            String sql = "select visitormessage_id, username, userid, message  from "+"(SELECT ROWNUM rm, visitormessage_id, ;username,userid, message FROM "+"(SELECT * FROM VISITORMESSAGE ORDER by visitormessage_id) "+"WHERE rownum<=?) "+"where rm>=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,endRow);
            pstmt.setInt(2,firstRow);
   return new ArrayList<>();
        }finally {
            JdbcUtil.close(pstmt);
        }

    }

}
