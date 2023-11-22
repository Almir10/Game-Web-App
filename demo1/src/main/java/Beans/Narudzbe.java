package Beans;


import java.util.Date;
import java.util.List;

public class Narudzbe {
    private int id;
    private int userId;

    private int gameId;
    private Date orderDate;
    private String status;
    private List<Kart> stavke;


    public List<Kart> getStavke() {
        return stavke;
    }

    public void setStavke(List<Kart> stavke) {
        this.stavke = stavke;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}