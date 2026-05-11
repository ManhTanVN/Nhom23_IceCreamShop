package controller;

import dao.ProductDAO;
import model.Product;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "SearchPageServlet", urlPatterns = {"/search"})
public class SearchPageServlet extends HttpServlet {
    private ProductDAO productDAO = new ProductDAO();
    private final int LIMIT = 24; // Phân trang 24 món theo yêu cầu

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");

        // 1. Lấy tham số
        String query = request.getParameter("q");
        String pageStr = request.getParameter("page");
        String minP = request.getParameter("minPrice");
        String maxP = request.getParameter("maxPrice");
        String sort = request.getParameter("sort"); 
        if (sort == null || sort.isEmpty()) {
            sort = "manual"; // Nếu khách mới vào hoặc không chọn, mặc định là manual
        }

        // 2. Xử lý giá trị mặc định
        int currentPage = (pageStr != null && !pageStr.isEmpty()) ? Integer.parseInt(pageStr) : 1;
        Double minPrice = (minP != null && !minP.isEmpty()) ? Double.parseDouble(minP) : null;
        Double maxPrice = (maxP != null && !maxP.isEmpty()) ? Double.parseDouble(maxP) : null;

        int offset = (currentPage - 1) * LIMIT;

        // 3. Gọi DAO lấy dữ liệu
        List<Product> products = productDAO.getFilteredProducts(offset, LIMIT, query, minPrice, maxPrice, sort);
        int totalProducts = productDAO.getTotalCount(query, minPrice, maxPrice);
        int totalPages = (int) Math.ceil((double) totalProducts / LIMIT);

        // 4. Đẩy dữ liệu sang search.jsp
        request.setAttribute("productList", products);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("searchQuery", query);
        request.setAttribute("pageTitle", "Kết quả tìm kiếm cho: " + query);
        request.setAttribute("currentSort", sort);

        request.getRequestDispatcher("/search.jsp").forward(request, response);
    }
}