package model;

public class Comment {

    private int coid;
    private int comicId;
    private int chapterId;
    private String username;
    private String comment;

    public Comment() {
    }

    public Comment(int coid, int comicId, int chapterId, String username, String comment) {
        this.coid = coid;
        this.comicId = comicId;
        this.chapterId = chapterId;
        this.username = username;
        this.comment = comment;
    }

    public int getCoid() {
        return coid;
    }

    public void setCoid(int coid) {
        this.coid = coid;
    }

    public int getComicId() {
        return comicId;
    }

    public void setComicId(int comicId) {
        this.comicId = comicId;
    }

    public int getChapterId() {
        return chapterId;
    }

    public void setChapterId(int chapterId) {
        this.chapterId = chapterId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "Comment{" + "coid=" + coid + ", comicId=" + comicId + ", chapterId=" + chapterId + ", username=" + username + ", comment=" + comment + '}';
    }

  

}
