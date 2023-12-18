package Servlet.bookCart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(value = "/ViewCartServlet")
public class ViewCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//解决post中文乱码


        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession(false); // 获取用户的 Session，如果不存在则返回 null

        if (session != null) {

            ArrayList cart = (ArrayList) session.getAttribute("cart");
            if (cart != null && !cart.isEmpty()) {

                PrintWriter out = response.getWriter();
                out.println("<h2>购物车内容：</h2>");

                for (int i = 0; i < cart.size(); i++) {
                    out.println(i + 1 + " " + cart.get(i) + " ");
                    out.println("<a href='/JavaWeb_Web_exploded/RemoveFromCartServlet?item=" + i + "'>从购物车中删除</a>");
                    out.println("<hr>");
                }
                out.println("<a href='/JavaWeb_Web_exploded/Jsp/Exp6/bookCart/main.html'>返回查询</a>");
            } else {
                // 购物车为空时的提示信息
                PrintWriter out = response.getWriter();
                out.println("<h2>购物车为空</h2>");
                out.println("<a href='/JavaWeb_Web_exploded/Jsp/Exp6/bookCart/main.html'>返回查询</a>");
            }
        } else {
            response.sendRedirect("/JavaWeb_Web_exploded/Jsp/Exp6/bookCart/main.html");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
