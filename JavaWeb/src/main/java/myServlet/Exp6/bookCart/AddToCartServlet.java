package myServlet.Exp6.bookCart;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");//解决post中文乱码
        String bookname = request.getParameter("bookId");
        String price = request.getParameter("price");

        HttpSession session = request.getSession(true); // 获取用户的 Session，如果不存在则创建一个新的

        ArrayList cart = (ArrayList) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList();
        }

        // 添加图书到购物车
        String item = "书名: " + bookname + " | 价格: ￥" + price;
        cart.add(item);
        session.setAttribute("cart", cart);


        response.sendRedirect("/JavaWeb_Web_exploded/Jsp/Exp6/bookCart/main.html");


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
