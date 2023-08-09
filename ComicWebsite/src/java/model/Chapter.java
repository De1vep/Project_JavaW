package model;

public class Chapter {

    private int chapterId;  //identity
    private String chapterName;
    private String chapterImg;
    private int chapterNo;//(Chuong so)
    private int comicId;

    public Chapter() {
    }

    public Chapter(int chapterId, String chapterName, String chapterImg, int chapterNo, int comicId) {
        this.chapterId = chapterId;
        this.chapterName = chapterName;
        this.chapterImg = chapterImg;
        this.chapterNo = chapterNo;
        this.comicId = comicId;
    }

    public int getChapterId() {
        return chapterId;
    }

    public void setChapterId(int chapterId) {
        this.chapterId = chapterId;
    }

    public String getChapterName() {
        return chapterName;
    }

    public void setChapterName(String chapterName) {
        this.chapterName = chapterName;
    }

    public String getChapterImg() {
        return chapterImg;
    }

    public void setChapterImg(String chapterImg) {
        this.chapterImg = chapterImg;
    }

    public int getChapterNo() {
        return chapterNo;
    }

    public void setChapterNo(int chapterNo) {
        this.chapterNo = chapterNo;
    }

    public int getComicId() {
        return comicId;
    }

    public void setComicId(int comicId) {
        this.comicId = comicId;
    }

    @Override
    public String toString() {
        return "Chapter{" + "chapterId=" + chapterId + ", chapterName=" + chapterName + ", chapterImg=" + chapterImg + ", chapterNo=" + chapterNo + ", comicId=" + comicId + '}';
    }

}
