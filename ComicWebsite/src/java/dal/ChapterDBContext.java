package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Chapter;

public class ChapterDBContext extends DBContext {

    public ArrayList<Chapter> getAllChapter() {
        ArrayList<Chapter> chapter = new ArrayList<>();
        String sql = "select ch.chid,ch.chname,ch.chimg,ch.chno,ch.cid from Chapter as ch \n"
                + "join Comic as c on c.cid = ch.cid\n"
                + "ORDER BY ch.chno desc";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                chapter.add(new Chapter(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ChapterDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return chapter;
    }

    public ArrayList<Chapter> get3Chapter(int cid) {
        ArrayList<Chapter> chapter = new ArrayList<>();
        String sql = "select top 3 ch.chid,ch.chname,ch.chimg,ch.chno,ch.cid from Chapter as ch\n"
                + "join Comic as c on c.cid = ch.cid\n"
                + "where ch.cid = ?	\n"
                + "ORDER BY ch.chno desc";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                chapter.add(new Chapter(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ChapterDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return chapter;
    }

    public ArrayList<Chapter> getAllChapterByCid(int cid) {
        ArrayList<Chapter> chapter = new ArrayList<>();
        String sql = "select ch.chid,ch.chname,ch.chimg,ch.chno,ch.cid from Chapter as ch\n"
                + "join Comic as c on c.cid = ch.cid\n"
                + "where ch.cid = ?\n"
                + "ORDER BY ch.chno desc";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                chapter.add(new Chapter(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ChapterDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return chapter;
    }

    public void insertChapter(Chapter ch) {
        try {
            String sql = "INSERT INTO [Chapter] ([chname],[chno],[cid],[chimg]) VALUES (?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, ch.getChapterName());
            stm.setInt(2, ch.getChapterNo());
            stm.setInt(3, ch.getComicId());
            stm.setString(4, ch.getChapterImg());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ChapterDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteChapter(int cid, int chno) {
        String sql = "DELETE FROM  Chapter where cid = ? and chno = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            stm.setInt(2, chno);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ChapterDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//    public static void main(String[] args) {
//        Chapter ch = new Chapter();
//        ch.setChapterName("Chuong 6");
//        ch.setChapterImg("gfdgasdfasdf");
//        ch.setChapterNo(6);
//        ch.setComicId(49);
//        ChapterDBContext chdb = new ChapterDBContext();
//        chdb.insertChapter(ch);
//
//    }
//    public static void main(String[] args) {
//        Chapter ch = new Chapter();
//        ChapterDBContext chdb = new ChapterDBContext();
////        chdb.deleteChapter(50,6);
//        ArrayList<Chapter> allChapterByCid = chdb.getAllChapterByCid(1);
//        System.out.println(allChapterByCid);
//    }
    public void updateChapter(Chapter ch) {
        try {
            String sql = "UPDATE [Chapter]\n"
                    + "SET [chname] = ?\n"
                    + ",[chno] = ?\n"
                    + ",[cid] = ?\n"
                    + ",[chimg] = ?\n"
                    + " WHERE chno = ? and cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, ch.getChapterName());
            stm.setInt(2, ch.getChapterNo());
            stm.setInt(3, ch.getComicId());
            stm.setString(4, ch.getChapterImg());
            stm.setInt(5, ch.getChapterNo());
            stm.setInt(6, ch.getComicId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ChapterDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//    public static void main(String[] args) {
//        ChapterDBContext chdb = new ChapterDBContext();
//        Chapter ch = new Chapter();
//        chdb.get3Chapter();
//    }
}
