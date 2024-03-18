package model;

import dao.DAO;
import java.util.ArrayList;
import java.util.List;

public class Cart {

    private List<Item> list;

    public Cart() {
    }

    public Cart(List<Item> list) {
        this.list = list;
    }

    public List<Item> getList() {
        return list;
    }

    public void setList(List<Item> list) {
        this.list = list;
    }

    public ArrayList<Item> getItemsByID(int id) {
        ArrayList<Item> itemsExisted = new ArrayList<>();
        for (Item i : list) {
            if (i.getProduct().getId() == id) {
                itemsExisted.add(i);
            }
        }
        return itemsExisted;
    }

    public Item getItemByIDSize(int id, int size) {
        ArrayList<Item> itemsExisted = getItemsByID(id);
        for (Item i : itemsExisted) {
            if (i.getSize() == size) {
                return i;
            }
        }
        return null;
    }

    public Item getItemByID(int id) {
        for (Item i : list) {
            if (i.getProduct().getId() == id) {
                return i;
            }
        }
        return null;
    }

    public int getQuantityByID(int id) {
        return getItemByID(id).getQuantity();
    }

    public void addItem(Item i) {
        //neu da ton tai
        if (getItemByID(i.getProduct().getId()) != null && getItemByID(i.getProduct().getId()).getSize() == i.getSize()) {
            Item t = getItemByID(i.getProduct().getId());
            t.setQuantity(i.getQuantity());
        } else {
            list.add(i);
        }
    }

    public void removeItem(int id, int size) {
        if (getItemByID(id) != null && getItemByID(id).getSize() == size) {
            list.remove(getItemByID(id));
        }
    }

    public double getTotalMoney() {
        double total = 0;
        for (Item i : list) {
            total += i.getPrice() * i.getQuantity();
        }
        return total;
    }

    public Product getProductById(int id, List<Product> list) {
        for (Product p : list) {
            if (p.getId() == id) {
                return p;
            }
        }
        return null;
    }

    public Cart(String txt, List<Product> listP) { // 2:1_36/3:1_37
        list = new ArrayList<>();
        DAO d = new DAO();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("/");
                for (String i : s) {
                    String[] n = i.split(":");
                    int id = Integer.parseInt(n[0]);
                    String text = n[1];
                    int quantity = Integer.parseInt(text.split("_")[0]);
                    int size = Integer.parseInt(text.split("_")[1]);
                    if (getItemByID(id) != null && getItemByID(id).getSize() == size) {
                        getItemByID(id).setQuantity(getQuantityByID(id) + quantity);
                    } else {
                        Product p = getProductById(id, listP);
                        Category c = d.getCategory(d.getCidById(id));
                        Item t = new Item(p, c, quantity, size, p.getPrice());
                        addItem(t);
                    }
                }
            }
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
    }
}
