package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // KIỂM TRA BẢO MẬT: Nếu chưa đăng nhập, đá về trang Login ngay lập tức
        if (user == null) {
            // Lưu lại thông báo lỗi vào session để hiển thị ở trang login (nếu cần)
            session.setAttribute("error", "Vui lòng đăng nhập để tiến hành thanh toán!");
            response.sendRedirect(request.getContextPath() + "/index.jsp?showLogin=true");
            return;
        }

        // Nếu đã đăng nhập, chuyển đến trang thanh toán
        request.getRequestDispatcher("/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}