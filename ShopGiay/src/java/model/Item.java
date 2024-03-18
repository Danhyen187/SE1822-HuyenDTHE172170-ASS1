package model;

public class Item {

    private Product product;
    private Category category;
    private int quantity;
    private int size;
    private double price;

    public Item() {
    }

    public Item(Product product, Category category, int quantity, int size, double price) {
        this.product = product;
        this.category = category;
        this.quantity = quantity;
        this.size = size;
        this.price = price;
    }
    

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    @Override
    public String toString() {
        return "Item{" + "product=" + product + ", category=" + category + ", quantity=" + quantity + ", size=" + size + ", price=" + price + '}';
    }
    
    
   

}
