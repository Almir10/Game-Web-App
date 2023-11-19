package Beans;

import java.util.ArrayList;
import java.util.List;

public class Orders {
    int id;
    String username;
    double total;
    String products;
    short status;
    private List<Games> games;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getProducts() {
        return products;
    }

    public void setProducts(String products) {
        this.products = products;
    }

    public short getStatus() {
        return status;
    }

    public void setStatus(short status) {
        this.status = status;
    }

    public List<Games> getGames() {
        if (games == null) {
            games = new ArrayList<>();
        }
        return games;
    }

    public void setGames(List<Games> games) {
        this.games = games;
    }

    public Orders() {
        this.games = new ArrayList<>();
    }

    public List<Games> getCartItems() {
        return games;
    }

    public void addItemToCart(Games game) {
        games.add(game);
    }

    // New method to update quantity for a specific game
    public void updateQuantity(int gameId, int quantity) {
        for (Games game : games) {
            if (game.getId() == gameId) {
                game.setQuantity(quantity);
                return;
            }
        }
            }
        }


