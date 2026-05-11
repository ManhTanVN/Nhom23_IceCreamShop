package controller;

import com.google.gson.Gson;
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
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/api/login"})
public class LoginServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/icecream-shop?useSSL=false&characterEncoding=UTF-8&allowPublicKeyRetrieval=true";
    private static final String DB_USER = "root";
    private static final String DB_PASS = ""; 

    // --- HÀM XỬ LÝ HEADERS ĐỂ TRÌNH DUYỆT CHỊU NHẬN SESSION ---
    private void setAccessControlHeaders(HttpServletRequest req, HttpServletResponse resp) {
        String origin = req.getHeader("Origin");
        if (origin != null) {
            resp.setHeader("Access-Control-Allow-Origin", origin);
        } else {
            resp.setHeader("Access-Control-Allow-Origin", "*");
        }
        resp.setHeader("Access-Control-Allow-Credentials", "true");
        resp.setHeader("Access-Control-Allow-Methods", "POST, OPTIONS");
        resp.setHeader("Access-Control-Allow-Headers", "Content-Type");
        resp.setContentType("application/json;charset=UTF-8");
    }

    @Override
    protected void doOptions(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        setAccessControlHeaders(req, resp);
        resp.setStatus(HttpServletResponse.SC_OK);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        setAccessControlHeaders(request, response);
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
                
                JsonObject jsonObject = JsonParser.parseReader(request.getReader()).getAsJsonObject();
                String email = jsonObject.get("email").getAsString();
                String password = jsonObject.get("password").getAsString();
                
                String sql = "SELECT id, fullname, role FROM users WHERE email=? AND password=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, email);
                pstmt.setString(2, password);
                
                ResultSet rs = pstmt.executeQuery();
                
                PrintWriter out = response.getWriter();
                
                if (rs.next()) {
                    // 1. Lấy thông tin từ database
                    int id = rs.getInt("id");
                    String fullname = rs.getString("fullname");
                    int role = rs.getInt("role");

                    // 2. Tạo đối tượng User (model.User)
                    model.User userForSession = new model.User(id, fullname, email, ""); 

                    // 3. Lưu vào Session với key là "user" để CartServlet có thể đọc được
                    HttpSession session = request.getSession();
                    session.setAttribute("user", userForSession); 
                    session.setAttribute("adminId", id);
                    session.setAttribute("userRole", role);

                    // 4. Trả về JSON cho client
                    JsonObject userObj = new JsonObject();
                    userObj.addProperty("id", id);
                    userObj.addProperty("fullname", fullname);
                    userObj.addProperty("role", role);

                    response.getWriter().print(new Gson().toJson(userObj));
                } else {
                    response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                    out.print("{\"error\": \"Sai email hoặc mật khẩu!\"}");
                }
            }
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().print("{\"error\": \"" + e.getMessage() + "\"}");
        }
    }
}