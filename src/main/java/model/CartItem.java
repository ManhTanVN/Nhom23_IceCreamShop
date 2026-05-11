package model;

public class CartItem {
    private int id;
    private int userId;
    private String name;
    private double price;
    private String image;
    private int quantity;

    public CartItem() {}

    public CartItem(int id, int userId, String name, double price, String image, int quantity) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.price = price;
        this.image = image;
        this.quantity = quantity;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
}