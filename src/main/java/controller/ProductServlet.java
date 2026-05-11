package controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.Normalizer;
import java.util.regex.Pattern;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "ProductServlet", urlPatterns = {"/api/products"})
public class ProductServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/icecream-shop?useSSL=false&characterEncoding=UTF-8&allowPublicKeyRetrieval=true";
    private static final String DB_USER = "root";
    private static final String DB_PASS = ""; 

    // --- HÀM TỰ ĐỘNG TẠO HANDLE (SLUG) ---
    private String generateHandle(String name) {
        if (name == null) return "";
        // Chuyển sang chữ thường và chuẩn hóa
        String temp = Normalizer.normalize(name.toLowerCase(), Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        String slug = pattern.matcher(temp).replaceAll("");
        // Thay chữ đ, thay ký tự đặc biệt thành dấu gạch ngang
        slug = slug.replaceAll("đ", "d");
        slug = slug.replaceAll("[^a-z0-9\\s]", "");
        slug = slug.replaceAll("\\s+", "-");
        slug = slug.replaceAll("-+", "-");
        return slug.trim();
    }

    private void setAccessControlHeaders(HttpServletRequest req, HttpServletResponse resp) {
        String origin = req.getHeader("Origin");
        if (origin != null) {
            resp.setHeader("Access-Control-Allow-Origin", origin);
        } else {
            resp.setHeader("Access-Control-Allow-Origin", "*");
        }
        resp.setHeader("Access-Control-Allow-Credentials", "true");
        resp.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
        resp.setHeader("Access-Control-Allow-Headers", "Content-Type");
        resp.setContentType("application/json;charset=UTF-8");
    }

    @Override
    protected void doOptions(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        setAccessControlHeaders(req, resp);
        resp.setStatus(HttpServletResponse.SC_OK);
    }

    private boolean isAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null && session.getAttribute("userRole") != null && (int) session.getAttribute("userRole") == 1;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        setAccessControlHeaders(request, response);
        String handle = request.getParameter("handle"); // Lấy tham số handle nếu có

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
                String sql = (handle != null) ? "SELECT * FROM products WHERE handle = ?" : "SELECT * FROM products";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                
                if (handle != null) {
                    pstmt.setString(1, handle);
                }

                ResultSet rs = pstmt.executeQuery();
                JsonArray jsonArray = new JsonArray();
                
                while (rs.next()) {
                    JsonObject obj = new JsonObject();
                    obj.addProperty("id", rs.getInt("id"));
                    obj.addProperty("name", rs.getString("name"));
                    obj.addProperty("handle", rs.getString("handle"));
                    obj.addProperty("description", rs.getString("description"));
                    obj.addProperty("image_url", rs.getString("image_url"));
                    obj.addProperty("price", rs.getInt("price"));
                    obj.addProperty("original_price", rs.getInt("original_price"));
                    obj.addProperty("allergies", rs.getString("allergies"));
                    jsonArray.add(obj);
                }

                PrintWriter out = response.getWriter();
                // Nếu tìm theo handle và có kết quả, trả về 1 object thay vì mảng để dễ xử lý ở Frontend
                if (handle != null && jsonArray.size() > 0) {
                    out.print(new Gson().toJson(jsonArray.get(0)));
                } else {
                    out.print(new Gson().toJson(jsonArray));
                }
            }
        } catch (Exception e) {
            response.setStatus(500);
            response.getWriter().print("{\"error\": \"Lỗi Java: " + e.getMessage() + "\"}");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        setAccessControlHeaders(request, response);
        if (!isAdmin(request)) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            response.getWriter().print("{\"error\": \"Bạn không có quyền thêm sản phẩm!\"}");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
                JsonObject jsonObject = JsonParser.parseReader(request.getReader()).getAsJsonObject();
                String name = jsonObject.get("name").getAsString();
                String handle = generateHandle(name); // TỰ ĐỘNG TẠO HANDLE

                String sql = "INSERT INTO products (name, handle, description, image_url, price, original_price, allergies) VALUES (?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setString(2, handle);
                pstmt.setString(3, jsonObject.get("description").getAsString());
                pstmt.setString(4, jsonObject.get("image_url").getAsString());
                pstmt.setInt(5, jsonObject.get("price").getAsInt());
                pstmt.setInt(6, jsonObject.get("original_price").getAsInt());
                pstmt.setString(7, jsonObject.has("allergies") ? jsonObject.get("allergies").getAsString() : "[]");
                
                pstmt.executeUpdate();
                response.getWriter().print("{\"message\": \"Thêm thành công!\", \"handle\": \"" + handle + "\"}");
            }
        } catch (Exception e) {
            response.setStatus(500);
            response.getWriter().print("{\"error\": \"" + e.getMessage() + "\"}");
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        setAccessControlHeaders(request, response);
        if (!isAdmin(request)) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            response.getWriter().print("{\"error\": \"Bạn không có quyền sửa sản phẩm!\"}");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
                JsonObject jsonObject = JsonParser.parseReader(request.getReader()).getAsJsonObject();
                String name = jsonObject.get("name").getAsString();
                String handle = generateHandle(name); // CẬP NHẬT LẠI HANDLE THEO TÊN MỚI

                String sql = "UPDATE products SET name=?, handle=?, description=?, image_url=?, price=?, original_price=?, allergies=? WHERE id=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setString(2, handle);
                pstmt.setString(3, jsonObject.get("description").getAsString());
                pstmt.setString(4, jsonObject.get("image_url").getAsString());
                pstmt.setInt(5, jsonObject.get("price").getAsInt());
                pstmt.setInt(6, jsonObject.get("original_price").getAsInt());
                pstmt.setString(7, jsonObject.has("allergies") ? jsonObject.get("allergies").getAsString() : "[]");
                pstmt.setInt(8, jsonObject.get("id").getAsInt());
                
                pstmt.executeUpdate();
                response.getWriter().print("{\"message\": \"Sửa thành công!\", \"handle\": \"" + handle + "\"}");
            }
        } catch (Exception e) {
            response.setStatus(500);
            response.getWriter().print("{\"error\": \"" + e.getMessage() + "\"}");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        setAccessControlHeaders(request, response);
        if (!isAdmin(request)) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            response.getWriter().print("{\"error\": \"Bạn không có quyền xóa sản phẩm!\"}");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
                String id = request.getParameter("id");
                String sql = "DELETE FROM products WHERE id=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, Integer.parseInt(id));
                pstmt.executeUpdate();
                response.getWriter().print("{\"message\": \"Xóa thành công!\"}");
            }
        } catch (Exception e) {
            response.setStatus(500);
            response.getWriter().print("{\"error\": \"" + e.getMessage() + "\"}");
        }
    }
}