package myServlet;


import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import java.io.IOException;

public class WelcomeServlet implements Servlet {


    @Override
    public void init(ServletConfig servletConfig) throws ServletException {

    }

    @Override
    public ServletConfig getServletConfig() {
        return null;
    }

    @Override
    public void service(ServletRequest servletRequest, ServletResponse servletResponse) throws ServletException, IOException {
        System.out.println("Hello Servlet:Servlet 被访问了!");
    }

    @Override
    public String getServletInfo() {
        return null;
    }

    @Override
    public void destroy() {

    }
}



//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.io.PrintWriter;
//
//public class WelcomeServlet extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//        throws ServletException, IOException{
//        response.setContentType("text/html;charset = UTF-8");
//        PrintWriter out = response.getWriter();
//        out.println("欢迎来到本系统!");
//
//    }
//
//
//
//}
