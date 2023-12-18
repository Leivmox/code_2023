package Servlet.login;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//解决post中文乱码
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 此处应该进行用户验证，检查用户名和密码是否匹配
        // 假设用户名为 "123"，密码也为 "123"
        if (username.equals("123") && password.equals("123")) {
            HttpSession session = request.getSession(true); // 创建用户的 Session
            session.setAttribute("username", username); // 存储用户信息
            response.sendRedirect("/JavaWeb_Web_exploded/Jsp/Exp6/login/welcome.html"); // 登录成功，重定向到欢迎页面
        } else {
            response.sendRedirect("/JavaWeb_Web_exploded/Jsp/Exp6/login/login.html"); // 登录失败，重定向回登录页面
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
