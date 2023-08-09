package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.View;

public class ViewDBContext extends DBContext {

    public View getAllViewByCid(int cid) {
        try {
            String sql = "select sum(v.viewed) as totalView, v.cid from [view] as v\n"
                    + "where v.cid = ?\n"
                    + "group by v.cid";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            View v = null;
            if (rs.next()) {
                if (v == null) {
                    v = new View();
                    v.setViewed(rs.getInt("totalView"));
                    v.setComicId(rs.getInt("cid"));
                }
            }
            return v;
        } catch (SQLException ex) {
            Logger.getLogger(ViewDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getViewByCidAndChno(int cid, int chno) {
        try {
            String sql = "select * from [view] as v\n"
                    + "where v.cid = ? and v.chno = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            stm.setInt(2, chno);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ViewDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public void updateView(int cid, int chno) {
        try {
            String sql = "update [View]\n"
                    + "set viewed = viewed + 1\n"
                    + "where cid = ? and chno = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            stm.setInt(2, chno);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ViewDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public View getTop3View() {
        try {
            String sql = "select sum(v.viewed) as t, v.cid from [view] as v\n"
                    + "group by v.cid\n"
                    + "order by t desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            View v = null;
            if (rs.next()) {
                if (v == null) {
                    v = new View();
                    v.setViewed(rs.getInt("t"));
                    v.setComicId(rs.getInt("cid"));
                }
            }
            return v;
        } catch (SQLException ex) {
            Logger.getLogger(ViewDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        ViewDBContext vdb = new ViewDBContext();
        View v = new View();

//        View allViewByCid = vdb.getAllViewByCid(1);
//        System.out.println(allViewByCid);
//        int viewByCidAndChno = vdb.getViewByCidAndChno(1, 1);
//        System.out.println(viewByCidAndChno);
//        vdb.updateView(1, 1);
        View top3View = vdb.getTop3View();
        System.out.println(top3View);
    }
}
