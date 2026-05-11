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
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "UserServlet", urlPatterns = {"/api/users"})
public class UserServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/icecream-shop?useSSL=false&characterEncoding=UTF-8&allowPublicKeyRetrieval=true";
    private static final String DB_USER = "root";
    private static final String DB_PASS = ""; 

    @Override
    protected void doOptions(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setHeader("Access-Control-Allow-Origin", "*");
        resp.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
        resp.setHeader("Access-Control-Allow-Headers", "Content-Type");
        resp.setStatus(HttpServletResponse.SC_OK);
    }

    private void setHeaders(HttpServletResponse resp) {
        resp.setHeader("Access-Control-Allow-Origin", "*");
        resp.setContentType("application/json;charset=UTF-8");
    }

    // LẤY DANH SÁCH NGƯỜI DÙNG
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        setHeaders(response);
        try (PrintWriter out = response.getWriter(); 
             Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            ResultSet rs = conn.createStatement().executeQuery("SELECT * FROM users");
            
            JsonArray jsonArray = new JsonArray();
            while (rs.next()) {
                JsonObject obj = new JsonObject();
                obj.addProperty("id", rs.getInt("id"));
                obj.addProperty("fullname", rs.getString("fullname"));
                obj.addProperty("email", rs.getString("email"));
                obj.addProperty("password", rs.getString("password"));
                obj.addProperty("role", rs.getInt("role"));
                jsonArray.add(obj);
            }
            out.print(new Gson().toJson(jsonArray));
        } catch (Exception e) { response.setStatus(500); }
    }

    // THÊM NGƯỜI DÙNG MỚI
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        setHeaders(response);
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            JsonObject obj = JsonParser.parseReader(request.getReader()).getAsJsonObject();
            
            String sql = "INSERT INTO users (fullname, email, password, role) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, obj.get("fullname").getAsString());
            pstmt.setString(2, obj.get("email").getAsString());
            pstmt.setString(3, obj.get("password").getAsString());
            pstmt.setInt(4, obj.get("role").getAsInt());
            pstmt.executeUpdate();
            response.getWriter().print("{\"message\": \"Thêm thành công!\"}");
        } catch (Exception e) { response.setStatus(500); }
    }

    // SỬA NGƯỜI DÙNG
    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        setHeaders(response);
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            JsonObject obj = JsonParser.parseReader(request.getReader()).getAsJsonObject();
            
            String sql = "UPDATE users SET fullname=?, email=?, password=?, role=? WHERE id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, obj.get("fullname").getAsString());
            pstmt.setString(2, obj.get("email").getAsString());
            pstmt.setString(3, obj.get("password").getAsString());
            pstmt.setInt(4, obj.get("role").getAsInt());
            pstmt.setInt(5, obj.get("id").getAsInt());
            pstmt.executeUpdate();
            response.getWriter().print("{\"message\": \"Sửa thành công!\"}");
        } catch (Exception e) { response.setStatus(500); }
    }

    // XÓA NGƯỜI DÙNG
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        setHeaders(response);
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String id = request.getParameter("id");
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM users WHERE id=?");
            pstmt.setInt(1, Integer.parseInt(id));
            pstmt.executeUpdate();
            response.getWriter().print("{\"message\": \"Xóa thành công!\"}");
        } catch (Exception e) { response.setStatus(500); }
    }
}