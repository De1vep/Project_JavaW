package model;

public class Following {

    private String username;
    private int comicId;
    private Boolean flStatus;

    public Following() {
    }

    public Following(String username, int comicId, Boolean flStatus) {
        this.username = username;
        this.comicId = comicId;
        this.flStatus = flStatus;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getComicId() {
        return comicId;
    }

    public void setComicId(int comicId) {
        this.comicId = comicId;
    }

    public Boolean getFlStatus() {
        return flStatus;
    }

    public void setFlStatus(Boolean flStatus) {
        this.flStatus = flStatus;
    }

    @Override
    public String toString() {
        return "Following{" + "username=" + username + ", comicId=" + comicId + ", flStatus=" + flStatus + '}';
    }

}
