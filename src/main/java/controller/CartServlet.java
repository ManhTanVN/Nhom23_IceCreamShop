package controller;

import com.google.gson.Gson;
import dao.CartDAO;
import model.CartItem;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CartServlet", urlPatterns = {"/api/cart"})
public class CartServlet extends HttpServlet {
    private CartDAO cartDAO = new CartDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            List<CartItem> cart = cartDAO.getCartByUserId(user.getId());
            sendJsonResponse(response, cart);
        } else {
            response.setStatus(401);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.setStatus(401);
            return;
        }

        String action = request.getParameter("action");
        String name = request.getParameter("name");

        if ("add".equals(action)) {
            double price = Double.parseDouble(request.getParameter("price"));
            String image = request.getParameter("image");
            int qty = Integer.parseInt(request.getParameter("quantity"));
            cartDAO.addToCart(new CartItem(0, user.getId(), name, price, image, qty));
        } else if ("update".equals(action)) {
            // Lấy con số thay đổi (+1 hoặc -1) từ JavaScript
            int change = Integer.parseInt(request.getParameter("change"));
            // Gọi DAO để cập nhật trong Database
            cartDAO.updateQuantity(user.getId(), name, change);

        } else if ("delete".equals(action)) {
            // Gọi DAO để xóa hẳn món này khỏi Database
            cartDAO.deleteCartItem(user.getId(), name);
        }

        List<CartItem> updatedCart = cartDAO.getCartByUserId(user.getId());
        sendJsonResponse(response, updatedCart);
    }

    private void sendJsonResponse(HttpServletResponse response, List<CartItem> cart) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(new Gson().toJson(cart));
    }
}