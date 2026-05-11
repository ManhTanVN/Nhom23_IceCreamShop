package controller;

import dao.BlogDAO;
import dao.ProductDAO;
import model.Blog;
import model.Product;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Mapping cho trang chủ: chạy khi vào đường dẫn gốc hoặc /home
@WebServlet(name = "HomeServlet", urlPatterns = {"/home", ""})
public class HomeServlet extends HttpServlet {

    // Khởi tạo DAO dùng chung
    private BlogDAO blogDAO = new BlogDAO();
    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Thiết lập tiếng Việt cho request và response
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        try {
            // 2. Lấy 5 bài viết mới nhất (đã viết hàm getTop5Blogs ở turn trước)
            List<Blog> top5Blogs = blogDAO.getTop5Blogs();
            request.setAttribute("blogList", top5Blogs);

            // 3. Lấy 5 sản phẩm mới nhất (đã viết hàm getTop5Products ở turn trước)
            List<Product> top5Products = productDAO.getTop5Products();
            request.setAttribute("productList", top5Products);

            // 4. Chuyển hướng dữ liệu sang trang index.jsp
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            
        } catch (Exception e) {
            // In lỗi ra console để debug nếu có vấn đề về Database
            System.out.println("Lỗi tại HomeServlet: " + e.getMessage());
            e.printStackTrace();
            // Nếu lỗi nặng, vẫn cho về index nhưng có thể không có dữ liệu
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Mọi yêu cầu POST cũng sẽ được xử lý như GET
        doGet(request, response);
    }
}