package myServlet.Exp7;

import beans.Customer;
import conn.CustomerDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(value = "/login.do")
public class login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//解决post中文乱码
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // 获取输入参数
        String studentId = request.getParameter("studentId");
        String password = request.getParameter("password");

        // 创建顾客对象
        Customer customer = new Customer();
        customer.setStudentId(studentId);
        customer.setPassword(password);

        // 调用DAO查询数据库
        CustomerDao dao = new CustomerDao();
        boolean isLogined = false;
        try {
            isLogined = dao.login(customer);

            // 判断是否登录成功
            if (isLogined) {
                out.print("<h1>登录成功！</h1>");
                out.print("<p>姓名：" + customer.getPassword() + "</p>");
            } else {
                out.print("<h1>登录失败！</h1>");
            }
        } catch (SQLException e) {

            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
