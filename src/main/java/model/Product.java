package model;

public class Product {
    private int id;
    private String name;
    private double price;
    private double original_price; // Thêm thuộc tính này
    private String image_url;
    private String description;
    private String handle;

    public Product() {}

    // Getter và Setter cho original_price
    public double getOriginal_price() { return original_price; }
    public void setOriginal_price(double original_price) { 
        this.original_price = original_price; 
    }

    // Các Getter/Setter khác giữ nguyên...
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public String getImage_url() { return image_url; }
    public void setImage_url(String image_url) { this.image_url = image_url; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getHandle() { return handle; }
    public void setHandle(String handle) { this.handle = handle; }
}