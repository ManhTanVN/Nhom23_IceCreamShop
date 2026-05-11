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

@WebServlet(name = "CollectionPageServlet", urlPatterns = {"/collections"})
public class CollectionPageServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();
    private final int LIMIT = 24; // Số lượng sản phẩm mỗi trang

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Lấy các tham số từ URL
        String search = request.getParameter("q"); // Từ ô tìm kiếm
        String minPStr = request.getParameter("minPrice");
        String maxPStr = request.getParameter("maxPrice");
        String pageStr = request.getParameter("page");
        String sort = request.getParameter("sort"); 
        if (sort == null || sort.isEmpty()) {
            sort = "manual"; // Nếu khách mới vào hoặc không chọn, mặc định là manual
        }

        // 2. Xử lý giá trị mặc định
        int currentPage = 1;
        if (pageStr != null && !pageStr.isEmpty()) {
            currentPage = Integer.parseInt(pageStr);
        }

        Double minPrice = (minPStr != null && !minPStr.isEmpty()) ? Double.parseDouble(minPStr) : null;
        Double maxPrice = (maxPStr != null && !maxPStr.isEmpty()) ? Double.parseDouble(maxPStr) : null;

        // 3. Tính toán OFFSET cho SQL
        int offset = (currentPage - 1) * LIMIT;

        // 4. Lấy dữ liệu từ DAO
        List<Product> products = productDAO.getFilteredProducts(offset, LIMIT, search, minPrice, maxPrice, sort);
        int totalProducts = productDAO.getTotalCount(search, minPrice, maxPrice);

        // 5. Tính tổng số trang (totalPages)
        int totalPages = (int) Math.ceil((double) totalProducts / LIMIT);

        // 6. Gửi dữ liệu sang JSP
        request.setAttribute("productList", products);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("searchQuery", search); // Gửi lại để hiển thị trong ô input
        request.setAttribute("currentSort", sort);
        
        request.setAttribute("pageTitle", (search != null && !search.isEmpty()) ? "Kết quả tìm kiếm cho: " + search : "Tất cả sản phẩm kem");

        request.getRequestDispatcher("/collection.jsp").forward(request, response);
    }
}