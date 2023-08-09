package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Group;

public class GroupDBContext extends DBContext {

    public ArrayList<Group> getAllGroup() {
        ArrayList<Group> group = new ArrayList<>();
        String sql = "select  gid, gname from [Group]";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                group.add(new Group(
                        rs.getInt(1),
                        rs.getString(2)
                )
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return group;
    }
//    public static void main(String[] args) {
//        GroupDBContext gdb = new GroupDBContext();
//        ArrayList<Group> ccc = gdb.getAllGroup();
//        System.out.println(ccc);
//    }
}
