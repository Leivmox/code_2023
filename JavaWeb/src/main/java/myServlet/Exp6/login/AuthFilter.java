package myServlet.Exp6.login;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
//过滤器，它将拦截 /JavaWeb_Web_exploded/Jsp/Exp6/login/welcome.html 页面的访问，并检查用户是否已登录。
@WebFilter("/Jsp/Exp6/login/welcome.html")
public class AuthFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {
        // 初始化过滤器
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false); // 获取用户的 Session，如果不存在则返回 null

        if (session == null || session.getAttribute("username") == null) {
            // 用户未登录，重定向到登录页面
            httpResponse.sendRedirect("/JavaWeb_Web_exploded/Jsp/Exp6/login/login.html");
        } else {
            // 用户已登录，允许访问欢迎页面
            chain.doFilter(request, response);
        }
    }

    public void destroy() {
        // 销毁过滤器
    }
}
