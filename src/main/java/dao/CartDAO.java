package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.CartItem;

public class CartDAO extends ProductDAO {

    public List<CartItem> getCartByUserId(int userId) {
        List<CartItem> list = new ArrayList<>();
        // Thống nhất dùng product_name
        String sql = "SELECT * FROM cart_items WHERE user_id = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new CartItem(
                    rs.getInt("id"), 
                    rs.getInt("user_id"), 
                    rs.getString("product_name"), // Khớp với DB
                    rs.getDouble("price"), 
                    rs.getString("image_url"), 
                    rs.getInt("quantity")
                ));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void addToCart(CartItem item) {
        String checkSql = "SELECT id, quantity FROM cart_items WHERE user_id = ? AND product_name = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement psCheck = conn.prepareStatement(checkSql)) {
            psCheck.setInt(1, item.getUserId());
            psCheck.setString(2, item.getName());
            ResultSet rs = psCheck.executeQuery();
            
            if (rs.next()) {
                String upSql = "UPDATE cart_items SET quantity = quantity + ? WHERE id = ?";
                try (PreparedStatement psUp = conn.prepareStatement(upSql)) {
                    psUp.setInt(1, item.getQuantity());
                    psUp.setInt(2, rs.getInt("id"));
                    psUp.executeUpdate();
                }
            } else {
                String insSql = "INSERT INTO cart_items (user_id, product_name, price, image_url, quantity) VALUES (?,?,?,?,?)";
                try (PreparedStatement psIns = conn.prepareStatement(insSql)) {
                    psIns.setInt(1, item.getUserId());
                    psIns.setString(2, item.getName());
                    psIns.setDouble(3, item.getPrice());
                    psIns.setString(4, item.getImage());
                    psIns.setInt(5, item.getQuantity());
                    psIns.executeUpdate();
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
    }
    
    public void updateQuantity(int userId, String name, int change) {
        // PHẢI SỬA: "name = ?" thành "product_name = ?"
        String sql = "UPDATE cart_items SET quantity = quantity + ? WHERE user_id = ? AND product_name = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, change);
            ps.setInt(2, userId);
            ps.setString(3, name);

            int rowsUpdated = ps.executeUpdate();

            System.out.println("DEBUG CART: UserID=" + userId + ", Name=[" + name + "], Change=" + change);
            System.out.println("DEBUG CART: Rows updated: " + rowsUpdated);

            if (rowsUpdated > 0) {
                // PHẢI SỬA: "name = ?" thành "product_name = ?"
                String deleteSql = "DELETE FROM cart_items WHERE user_id = ? AND product_name = ? AND quantity <= 0";
                try (PreparedStatement psDel = conn.prepareStatement(deleteSql)) {
                    psDel.setInt(1, userId);
                    psDel.setString(2, name);
                    psDel.executeUpdate();
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void deleteCartItem(int userId, String name) {
        // PHẢI SỬA: "name = ?" thành "product_name = ?"
        String sql = "DELETE FROM cart_items WHERE user_id = ? AND product_name = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setString(2, name);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}