package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Following;

public class FollowDBContext extends DBContext {

    public ArrayList<Following> getAllFollowingComic() {
        ArrayList<Following> follow = new ArrayList<>();
        String sql = "select * from Following";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                follow.add(new Following(
                        rs.getString(1),
                        rs.getInt(2),
                        rs.getBoolean(3)
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(FollowDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return follow;
    }

    public void followComic(String username, int cid, Boolean flstatus) {
        String sql = "INSERT INTO [Following] ([username], [cid], [flstatus]) VALUES (?,?,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setInt(2, cid);
            stm.setBoolean(3, flstatus);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(FollowDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateFollowComic(String username, int cid, boolean flstatus) {
        String sql = "Update [Following] Set [flstatus] = ? Where [cid] =? and [username] =?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, flstatus);
            stm.setInt(2, cid);
            stm.setString(3, username);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(FollowDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        FollowDBContext fldb = new FollowDBContext();
//        fldb.followComic("phgly", 1, true);
    }
}
