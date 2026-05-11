package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Product;

public class ProductDAO {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/icecream-shop?useSSL=false&characterEncoding=UTF-8&allowPublicKeyRetrieval=true";
    private static final String DB_USER = "root";
    private static final String DB_PASS = ""; 

    protected Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
    }

    // --- HÀM 1: DÀNH CHO HomeServlet (Hiện 5 món tiêu biểu) ---
    public List<Product> getTop5Products() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products ORDER BY id DESC LIMIT 5";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setOriginal_price(rs.getDouble("original_price"));
                p.setImage_url(rs.getString("image_url"));
                p.setHandle(rs.getString("handle"));
                p.setDescription(rs.getString("description"));
                list.add(p);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // --- HÀM 2: DÀNH CHO SearchServlet (Instant Search gợi ý nhanh) ---
    public List<Product> searchProductsByName(String keyword) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE name LIKE ? OR description LIKE ? LIMIT 5";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            String pattern = "%" + keyword + "%";
            ps.setString(1, pattern);
            ps.setString(2, pattern);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setImage_url(rs.getString("image_url"));
                p.setHandle(rs.getString("handle"));
                list.add(p);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // --- HÀM 3: DÀNH CHO CollectionPageServlet (Phân trang 24 món + Lọc) ---
    public List<Product> getFilteredProducts(int offset, int limit, String search, Double minPrice, Double maxPrice, String sort) {
        List<Product> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM products WHERE 1=1 ");
        
        // 1. Filter logic
        if (search != null && !search.isEmpty()) sql.append("AND name LIKE ? ");
        if (minPrice != null) sql.append("AND price >= ? ");
        if (maxPrice != null) sql.append("AND price <= ? ");
        
        // 2. Sorting logic
        sql.append("ORDER BY "); 

        String sortOrder = "id DESC"; // Mặc định nếu không khớp case nào
        if (sort != null && !sort.isEmpty()) {
            switch (sort) {
                case "price-asc":  sortOrder = "price ASC"; break;
                case "price-desc": sortOrder = "price DESC"; break;
                case "name-asc":   sortOrder = "name ASC"; break;
                case "name-desc":  sortOrder = "name DESC"; break;
                case "newest":     sortOrder = "id DESC"; break;
                case "manual":     sortOrder = "id ASC"; break;
            }
        }

        // Ghép sortOrder và luôn thêm id DESC làm tiêu chí phụ để phân trang không bị trùng
        sql.append(sortOrder).append(", id DESC "); 

        // 3. Phân trang
        sql.append("LIMIT ? OFFSET ?");
        
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            int paramIdx = 1;
            if (search != null && !search.isEmpty()) ps.setString(paramIdx++, "%" + search + "%");
            if (minPrice != null) ps.setDouble(paramIdx++, minPrice);
            if (maxPrice != null) ps.setDouble(paramIdx++, maxPrice);
            ps.setInt(paramIdx++, limit);
            ps.setInt(paramIdx++, offset);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setOriginal_price(rs.getDouble("original_price"));
                p.setImage_url(rs.getString("image_url"));
                p.setHandle(rs.getString("handle"));
                p.setDescription(rs.getString("description"));
                list.add(p);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // --- HÀM 4: DÀNH CHO PHÂN TRANG (Đếm tổng số sản phẩm) ---
    public int getTotalCount(String search, Double minPrice, Double maxPrice) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM products WHERE 1=1 ");
        if (search != null && !search.isEmpty()) sql.append("AND name LIKE ? ");
        if (minPrice != null) sql.append("AND price >= ? ");
        if (maxPrice != null) sql.append("AND price <= ? ");

        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            int paramIdx = 1;
            if (search != null && !search.isEmpty()) ps.setString(paramIdx++, "%" + search + "%");
            if (minPrice != null) ps.setDouble(paramIdx++, minPrice);
            if (maxPrice != null) ps.setDouble(paramIdx++, maxPrice);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }
}