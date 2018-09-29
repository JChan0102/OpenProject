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
        if(session!=null){
            if(session.getAttribute("user")!=null){
                login=true;
            }
        }

        if(login){

            chain.doFilter(req, resp);
        }else {
            RequestDispatcher dispatcher = req.getRequestDispatcher(((HttpServletRequest) req).getContextPath()+"/view/loginform.jsp");
            dispatcher.forward(req,resp);
            }

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
