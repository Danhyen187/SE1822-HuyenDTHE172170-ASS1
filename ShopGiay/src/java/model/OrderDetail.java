package model;

public class OrderDetail {
    
    
    private int oid, pid, quantity,size;
    private Product product;
    private Category category;
    private double price;

    public OrderDetail() {
    }

    public OrderDetail(int oid, int pid, int quantity, int size, double price) {
        this.oid = oid;
        this.pid = pid;
        this.quantity = quantity;
        this.size = size;
        this.price = price;
    }

    public OrderDetail(int oid, int pid, int quantity, int size, Product product, Category category, double price) {
        this.oid = oid;
        this.pid = pid;
        this.quantity = quantity;
        this.size = size;
        this.product = product;
        this.category = category;
        this.price = price;
    }

 

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    
    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
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
    
}
