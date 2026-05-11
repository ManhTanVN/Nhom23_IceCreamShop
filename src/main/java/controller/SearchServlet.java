package controller;

import com.google.gson.Gson;
import dao.ProductDAO;
import model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;    

@WebServlet(name = "SearchServlet", urlPatterns = {"/api/search"})
public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String keyword = request.getParameter("keyword");

        System.out.println("=== SearchServlet LOG ===");
        System.out.println("Keyword received from Browser: [" + keyword + "]");

        try (PrintWriter out = response.getWriter()) {
            if (keyword == null || keyword.trim().isEmpty()) {
                System.out.println("Keyword is empty, returning empty object");
                out.print("{\"products\": [], \"totalCount\": 0}");
                return;
            }

            ProductDAO dao = new ProductDAO();
            
            // Logic 1: Lấy danh sách gợi ý 
            List<Product> list = dao.searchProductsByName(keyword);
            
            // Logic 2: Lấy TỔNG số lượng sản phẩm khớp với từ khóa trong DB
            int totalCount = dao.getTotalCount(keyword, null, null);

            // Bọc dữ liệu vào Map để trả về object {} thay vì array []
            Map<String, Object> result = new HashMap<>();
            result.put("products", list);
            result.put("totalCount", totalCount);

            // LOG 4: Kiểm tra dữ liệu
            String json = new Gson().toJson(result);
            System.out.println("JSON sending to Browser: " + json);

            out.print(json);
            out.flush();
        } catch (Exception e) {
            System.out.println("Servlet Error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}