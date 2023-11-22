package Beans;

import java.util.ArrayList;
import java.util.List;

public class Kart {
    int id;
    int userId;
    int gameId;
    String gameTitle;
    float GamePrice;



    public float getGamePrice() {
        return GamePrice;
    }

    public void setGamePrice(float gamePrice) {
        GamePrice = gamePrice;
    }


    public String getGameTitle() {
        return gameTitle;
    }

    public void setGameTitle(String gameTitle) {
        this.gameTitle = gameTitle;
    }



    public int getId() {
        return id;
    }

    public int getUserId() {
        return userId;
    }



    public int getGameId() {
        return this.gameId;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setGameId(int gameId) {
        this.gameId = gameId;
    }

}








