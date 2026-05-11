package dao;
import java.sql.*;
import java.util.*;
import model.Blog;

public class BlogDAO extends ProductDAO {
    
    public List<Blog> getAllBlogs() {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * FROM blogs ORDER BY created_at DESC";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("id"));
                b.setTitle(rs.getString("title"));
                b.setSummary(rs.getString("summary"));
                b.setImageUrl(rs.getString("image_url"));
                b.setAuthor(rs.getString("author"));
                b.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(b);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public Blog getBlogById(int id) {
        String sql = "SELECT * FROM blogs WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("id"));
                b.setTitle(rs.getString("title"));
                b.setContent(rs.getString("content"));
                b.setImageUrl(rs.getString("image_url"));
                b.setAuthor(rs.getString("author"));
                b.setCreatedAt(rs.getTimestamp("created_at"));
                return b;
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }
    
    public List<Blog> getTop5Blogs() {
        List<Blog> list = new ArrayList<>();
        // Lấy 5 bài mới nhất dựa trên ngày tạo (DESC)
        String sql = "SELECT * FROM blogs ORDER BY created_at DESC LIMIT 5";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("id"));
                b.setTitle(rs.getString("title"));
                b.setSummary(rs.getString("summary"));
                b.setImageUrl(rs.getString("image_url"));
                b.setAuthor(rs.getString("author"));
                b.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(b);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}