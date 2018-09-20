package com.openproject;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class memberDAO {
    Connection conn = null;
    ResultSet rs = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;

String jdbcUrl="jdbc:apache:commons:dbcp:open";

    public void insertMember(String userId, String userPwd, String userName, String userPhoto) {
        try {
            conn = DriverManager.getConnection(jdbcUrl);
            String sql = "insert into memberinfo values (?,?,?,?)";

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, userId);
            pstmt.setString(2, userPwd);
            pstmt.setString(3, userName);
            pstmt.setString(4, userPhoto);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

                if (pstmt != null) {
                    try {
                        pstmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
            }

        }

    }


    public memberVO selectMember(String userId) {
        try {
            conn = DriverManager.getConnection(jdbcUrl);

            String sql = "select * from memberinfo where userid=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,userId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                return new memberVO(rs.getString("userid"), rs.getString("userpwd"), rs.getString("username"), rs.getString("userphoto"));

            }

        } catch (SQLException g) {
            System.out.println("DB연결 실패");
            g.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {

                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

        }
        return new memberVO(null,null,null,null);
    }

    public List<memberVO> selectMemberAll(){
        List<memberVO> members= new ArrayList<>();

        try{

            conn = DriverManager.getConnection(jdbcUrl);
            String sql = "select * from memberinfo";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()){

                    members.add(new memberVO(rs.getString("userid"), rs.getString("userpwd"), rs.getString("username"), rs.getString("userphoto")));

            }

        } catch (SQLException g) {
            System.out.println("DB연결 실패");
            g.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {

                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

        }
        return members;
    }
 public void delmember(String UserID){
     try {
         conn = DriverManager.getConnection(jdbcUrl);

         String sql = "delete from memberinfo where userid=?";

         pstmt= conn.prepareStatement(sql);
         pstmt.setString(1,UserID);

         pstmt.executeUpdate();
     } catch (Exception e) {
         e.printStackTrace();
     }finally {

         if(pstmt!=null){
             try {
                 pstmt.close();
             } catch (SQLException e) {
                 e.printStackTrace();
             }
         }
         if(conn!=null){
             try {
                 conn.close();
             } catch (SQLException e) {
                 e.printStackTrace();
             }
         }

     }
 }
public void updatemember(memberVO member){
    try {
        conn = DriverManager.getConnection(jdbcUrl);
        String sql = "update memberinfo set userpwd=?, username=?, userphoto=? where userid=?";
    pstmt= conn.prepareStatement(sql);

    pstmt.setString(1,member.getUserPwd());
    pstmt.setString(2,member.getUserName());
    pstmt.setString(3,member.getUserPhoto());
    pstmt.setString(4,member.getUserId());


    pstmt.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    }finally {

        if(pstmt!=null){
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(conn!=null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

}
}
