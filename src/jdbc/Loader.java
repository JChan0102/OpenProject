package jdbc;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.util.StringTokenizer;

@WebServlet(name = "Loader")
public class Loader extends HttpServlet {
    public void init(ServletConfig config) throws ServletException{
try{
    String drivers= config.getInitParameter("jdbcdriver");
    StringTokenizer  tokenizer = new StringTokenizer(drivers,",");

    while (tokenizer.hasMoreTokens()){
        String driver = tokenizer.nextToken();
        Class.forName(driver);
        System.out.println(driver+" : 드라이버 로드 성공");
    }
} catch (ClassNotFoundException e){

    e.printStackTrace();
}

    }
}
