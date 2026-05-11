package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

// Cấu hình để Servlet này hứng mọi yêu cầu bắt đầu bằng /products/
@WebServlet(urlPatterns = {"/products/*"})
public class ProductRouterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Lấy thông tin handle từ URL (ví dụ: /aries-auto-fold-stroller)
        String pathInfo = request.getPathInfo(); 
        
        // Nếu người dùng chỉ gõ /products/ mà không có tên sản phẩm, đá về trang chủ
        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendRedirect(request.getContextPath() + "/index.html");
            return;
        }

        // Chuyển hướng nội bộ (Forward) về file giao diện chi tiết
        // Chú ý: File product-detail.html phải nằm ở thư mục Web Pages (gốc)
        //request.getRequestDispatcher("/product-detail.html").forward(request, response);
        // Trong file ProductRouterServlet.java, hàm doGet:
        request.getRequestDispatcher("/product-detail.jsp").forward(request, response);
    }
}