package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "loginCheckFilter")
public class loginCheckFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) req;
        HttpServletResponse httpServletResponse = (HttpServletResponse) resp;
        HttpSession session = httpServletRequest.getSession(false);
        boolean login =false;
        if(session!=null){ //세션이 있는지 없는지
            if(session.getAttribute("user")!=null){ //내가 로그인시 저장해논 세션속성이 있는지 없는지
                login=true; // 있으면 트루
            }
        }

        if(login){

            chain.doFilter(req, resp);
        }else {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/view/loginform.jsp");
            dispatcher.forward(req,resp);
            }

}

    public void init(FilterConfig config) throws ServletException {

    }

}
