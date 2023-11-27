//package myServlet;
//
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.io.PrintWriter;
//
//public class ServletTest2 extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        response.setContentType("text/html;charset = UTF-8");
//        PrintWriter out = response.getWriter();
//        out.println("欢迎");
//    }
//
//}
//
////
////import javax.servlet.ServletException;
////import javax.servlet.http.HttpServlet;
////import javax.servlet.http.HttpServletRequest;
////import javax.servlet.http.HttpServletResponse;
////import java.io.IOException;
////import java.io.PrintWriter;
////
////public class ServletTest2 extends HttpServlet {
////    protected void doGet(HttpServletRequest request, HttpServletResponse response)
////        throws ServletException, IOException{
////        response.setContentType("text/html;charset = UTF-8");
////        PrintWriter out = response.getWriter();
////        out.println("欢迎来到本系统!");
////
////    }
////
////
////
////}