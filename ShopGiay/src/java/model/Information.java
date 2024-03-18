package model;

public class Information {
    private int orderId,inforId;
    private String fullName,phoneNumber,address;

    public Information() {
    }

    public Information(int orderId, int inforId, String fullName, String phoneNumber, String address) {
        this.orderId = orderId;
        this.inforId = inforId;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getInforId() {
        return inforId;
    }

    public void setInforId(int inforId) {
        this.inforId = inforId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
}
