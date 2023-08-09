package model;

public class View {

    private int viewed;
    private int comicId;
    private int chapterNo;

    public View() {
    }

    public View(int viewed, int comicId, int chapterNo) {
        this.viewed = viewed;
        this.comicId = comicId;
        this.chapterNo = chapterNo;
    }

    public int getViewed() {
        return viewed;
    }

    public void setViewed(int viewed) {
        this.viewed = viewed;
    }

    public int getComicId() {
        return comicId;
    }

    public void setComicId(int comicId) {
        this.comicId = comicId;
    }

    public int getChapterNo() {
        return chapterNo;
    }

    public void setChapterNo(int chapterNo) {
        this.chapterNo = chapterNo;
    }

    @Override
    public String toString() {
        return "View{" + "viewed=" + viewed + ", comicId=" + comicId + ", chapterNo=" + chapterNo + '}';
    }
}
