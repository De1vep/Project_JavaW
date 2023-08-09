package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Category;

public class CategoryDBContext extends DBContext {

    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> category = new ArrayList<>();
        String sql = "select caid, caname from Category";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                category.add(new Category(
                        rs.getInt(1),
                        rs.getString(2)
                )
                );
            }
        } catch (SQLException e) {
        }
        return category;
    }
    
    
    public static void main(String[] args) {
        CategoryDBContext ch = new CategoryDBContext();
        ArrayList<Category> list = ch.getAllCategory();
        for (Category category : list) {
            System.out.println(category);
        }
    }
}
