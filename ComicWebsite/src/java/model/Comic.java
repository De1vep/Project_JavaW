package model;

import java.sql.Date;
import java.util.ArrayList;

public class Comic {

    private int comicId;
    private String comicName;
    private String comicAvatar;
    private String comicAuthor;
    private String comicDescrible;
    private Date comicPostDate;
    private Boolean comicStatus;
    ArrayList<Chapter> chapters = new ArrayList<>();
    ArrayList<Category> categories = new ArrayList<>();

    public Comic() {
    }

    public ArrayList<Category> getCategories() {
        return categories;
    }

    public void setCategories(ArrayList<Category> categories) {
        this.categories = categories;
    }

    public Comic(int comicId, String comicName, String comicAvatar, String comicAuthor, String comicDescrible, Date comicPostDate, Boolean comicStatus) {
        this.comicId = comicId;
        this.comicName = comicName;
        this.comicAvatar = comicAvatar;
        this.comicAuthor = comicAuthor;
        this.comicDescrible = comicDescrible;
        this.comicPostDate = comicPostDate;
        this.comicStatus = comicStatus;
    }

    public ArrayList<Chapter> getChapters() {
        return chapters;
    }

    public void setChapters(ArrayList<Chapter> chapters) {
        this.chapters = chapters;
    }

    public int getComicId() {
        return comicId;
    }

    public void setComicId(int comicId) {
        this.comicId = comicId;
    }

    public String getComicName() {
        return comicName;
    }

    public void setComicName(String comicName) {
        this.comicName = comicName;
    }

    public String getComicAvatar() {
        return comicAvatar;
    }

    public void setComicAvatar(String comicAvatar) {
        this.comicAvatar = comicAvatar;
    }

    public String getComicAuthor() {
        return comicAuthor;
    }

    public void setComicAuthor(String comicAuthor) {
        this.comicAuthor = comicAuthor;
    }

    public String getComicDescrible() {
        return comicDescrible;
    }

    public void setComicDescrible(String comicDescrible) {
        this.comicDescrible = comicDescrible;
    }

    public Date getComicPostDate() {
        return comicPostDate;
    }

    public void setComicPostDate(Date comicPostDate) {
        this.comicPostDate = comicPostDate;
    }

    public Boolean getComicStatus() {
        return comicStatus;
    }

    public void setComicStatus(Boolean comicStatus) {
        this.comicStatus = comicStatus;
    }

    @Override
    public String toString() {
        return "Comic{" + "comicId=" + comicId + ", comicName=" + comicName + ", comicAvatar=" + comicAvatar + ", comicAuthor=" + comicAuthor + ", comicDescrible=" + comicDescrible + ", comicPostDate=" + comicPostDate + ", comicStatus=" + comicStatus + ", chapters=" + chapters + "\n" + ", categories=" + categories + '}' + "\n";
    }

}
