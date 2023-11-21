package Beans;

public class Orders {
    int id;
    String userId;
    String gameId;
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

    public String getUserId() {
        return userId;
    }

    public String getGameId() {
        return gameId;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }
}








