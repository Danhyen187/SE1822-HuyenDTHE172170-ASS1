package model;


public class Order {

    private int orderId;
    private String dateBuy;
    private double totalMoney;
    private int uId;
    private int inforId;
    private String nameBuy;
    public Order() {
    }

    public Order(int orderId, String dateBuy, double totalMoney, int uId, int inforId, String nameBuy) {
        this.orderId = orderId;
        this.dateBuy = dateBuy;
        this.totalMoney = totalMoney;
        this.uId = uId;
        this.inforId = inforId;
        this.nameBuy = nameBuy;
    }

   

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getDateBuy() {
        return dateBuy.toString().substring(0, 19);
    }

    public void setDateBuy(String dateBuy) {
        this.dateBuy = dateBuy;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public int getInforId() {
        return inforId;
    }

    public void setInforId(int inforId) {
        this.inforId = inforId;
    }

    public String getNameBuy() {
        return nameBuy;
    }

    public void setNameBuy(String nameBuy) {
        this.nameBuy = nameBuy;
    }
    
}
