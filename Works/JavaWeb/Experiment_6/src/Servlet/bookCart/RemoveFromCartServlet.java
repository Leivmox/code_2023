package Servlet.bookCart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//解决post中文乱码
        response.setContentType("text/html;charset=utf-8");
        String indexToRemoveStr = request.getParameter("item");

        HttpSession session = request.getSession(false);

        if (indexToRemoveStr != null && !indexToRemoveStr.isEmpty()) {
            int indexToRemove = Integer.parseInt(indexToRemoveStr);

            // 获取购物车内容并移除指定图书
            ArrayList cart = (ArrayList) session.getAttribute("cart");
            cart.remove(indexToRemove);
            session.setAttribute("cart", cart);
        }


        response.sendRedirect("/JavaWeb_Web_exploded/ViewCartServlet");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
