package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Comment;

public class CommentDBContext extends DBContext {

    public ArrayList<Comment> getAllComment(int cid, int chno) {
        ArrayList<Comment> comment = new ArrayList<>();
        String sql = "select * from Comment as co\n"
                + "where co.cid = ? and co.chno = ?";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            stm.setInt(2, chno);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                comment.add(new Comment(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return comment;
    }
    public ArrayList<Comment> getAllCommentByCid(int cid) {
        ArrayList<Comment> comment = new ArrayList<>();
        String sql = "select * from Comment as co\n"
                + "where co.cid = ?";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                comment.add(new Comment(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return comment;
    }

    public void postCmt(int cid, int chno, String username, String comment) {
        String sql = "INSERT INTO [Comment]([cid],[chno],[username],[comment])\n"
                + "VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            stm.setInt(2, chno);
            stm.setString(3, username);
            stm.setString(4, comment);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        CommentDBContext codb = new CommentDBContext();
        

    }
}
