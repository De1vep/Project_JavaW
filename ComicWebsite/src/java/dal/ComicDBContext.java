package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Chapter;
import model.Comic;

public class ComicDBContext extends DBContext {

    public ArrayList<Comic> getAllComic(int pageIndex, int pageSize) {
        ArrayList<Comic> list = new ArrayList<>();
        try {
            String sql = "select cid, cname, cavatar, cauthor,cdescrible, cpostdate, cstatus from(\n"
                    + "select row_number() over(order by cid asc) as rownum, *\n"
                    + "from  Comic) t\n"
                    + "where rownum >= (? - 1) * ? + 1 And rownum <= ? * ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageIndex);
            stm.setInt(2, pageSize);
            stm.setInt(3, pageIndex);
            stm.setInt(4, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Comic(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getBoolean(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ComicDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Comic> getAllComic() {
        ArrayList<Comic> list = new ArrayList<>();
        String sql = "select distinct c.cid, c.cname, c.cavatar, c.cauthor, c.cdescrible, c.cpostdate, c.cstatus from comic as c \n"
                + "join Chapter as ch on ch.cid = c.cid";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Comic(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getBoolean(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ComicDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Comic> getAllComicByStatus(Boolean status) {
        ArrayList<Comic> list = new ArrayList<>();
        String sql = "select distinct c.cid, c.cname, c.cavatar, c.cauthor, c.cdescrible, c.cpostdate, c.cstatus from comic as c\n"
                + "join Chapter as ch on ch.cid = c.cid\n"
                + "where c.cstatus = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, status);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Comic(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getBoolean(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ComicDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Comic> getComicByCAID(String caid) {
        ArrayList<Comic> list = new ArrayList<>();
        String sql = "select * from comic as c\n"
                + "left join ComicCategory cca on c.cid = cca.cid\n"
                + "join Category as ca on ca.caid = cca.caid\n"
                + "where ca.caid = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, caid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Comic(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getBoolean(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ComicDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Comic> searchByName(String txtSearch) {
        ArrayList<Comic> list = new ArrayList<>();
        String sql = "select * from comic\n"
                + "where [cname] like ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);;
            stm.setString(1, "%" + txtSearch + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Comic(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getBoolean(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ComicDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Comic getLastComic() {
        String sql = "select top 1 * from comic as c\n"
                + "order by c.cid desc";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Comic(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getBoolean(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ComicDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Comic getComicByChnoAndCid(int cid, int chno) {
        try {
            String sql = "select ch.chid,ch.chimg,ch.chname,ch.chno,c.cid from Comic as c\n"
                    + "left join Chapter as ch on ch.cid = c.cid\n"
                    + "where c.cid = ? and ch.chno = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            stm.setInt(2, chno);
            ResultSet rs = stm.executeQuery();
            Comic c = null;
            while (rs.next()) {
                if (c == null) {
                    c = new Comic();
                    c.setComicId(cid);
                }

                if (chno != 0) {
                    Chapter ch = new Chapter();
                    ch.setChapterNo(chno);
                    ch.setChapterName(rs.getString("chname"));
                    ch.setChapterImg(rs.getString("chimg"));
                    ch.setComicId(rs.getInt("cid"));
                    c.getChapters().add(ch);
                }
            }
            return c;
        } catch (SQLException ex) {
            Logger.getLogger(ComicDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Comic getComic(int id) {
        try {
            String sql = "select distinct c.cid, c.cname,c.cavatar,c.cauthor,c.cdescrible,c.cpostdate,c.cstatus,ca.caid,ca.caname, ch.chid,ch.chname,ch.chno,ch.chimg \n"
                    + "from Comic as c\n"
                    + "join Chapter as ch on c.cid = ch.cid\n"
                    + "left join ComicCategory as cca on cca.cid = c.cid\n"
                    + "left join Category as ca on ca.caid = cca.caid\n"
                    + "where c.cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            Comic c = null;

            while (rs.next()) {
                if (c == null) {
                    c = new Comic(
                            rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getDate(6),
                            rs.getBoolean(7));
                }

                int caid = rs.getInt("caid");
                if (caid != 0) {
                    Category ca = new Category();
                    ca.setCategoryId(caid);
                    ca.setCategoryName(rs.getString("caname"));
                    c.getCategories().add(ca);
                }

                int chid = rs.getInt("chid");
                if (chid != 0) {
                    Chapter ch = new Chapter();
                    ch.setChapterId(chid);
                    ch.setChapterName(rs.getString("chname"));
                    ch.setChapterNo(rs.getInt("chno"));
                    ch.setChapterImg(rs.getString("chimg"));
                    c.getChapters().add(ch);
                }
            }
            return c;
        } catch (SQLException ex) {
            Logger.getLogger(ComicDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Comic getComicByICA(int id) {
        try {
            String sql = "select distinct c.cid, c.cname,c.cavatar,c.cauthor,c.cdescrible,c.cpostdate,c.cstatus,ca.caid,ca.caname\n"
                    + "from Comic as c\n"
                    + "join Chapter as ch on c.cid = ch.cid\n"
                    + "left join ComicCategory as cca on cca.cid = c.cid\n"
                    + "left join Category as ca on ca.caid = cca.caid\n"
                    + "where c.cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            Comic c = null;

            while (rs.next()) {
                if (c == null) {
                    c = new Comic(
                            rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getDate(6),
                            rs.getBoolean(7));
                }

                int caid = rs.getInt("caid");
                if (caid != 0) {
                    Category ca = new Category();
                    ca.setCategoryId(caid);
                    ca.setCategoryName(rs.getString("caname"));
                    c.getCategories().add(ca);
                }
            }
            return c;
        } catch (SQLException ex) {
            Logger.getLogger(ComicDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Comic getComicByCid(int cid) {
        try {
            String sql = "select distinct c.cid, c.cname,c.cavatar,c.cauthor,c.cdescrible,c.cpostdate,c.cstatus, ch.chid,ch.chname,ch.chno,ch.chimg \n"
                    + "from Comic as c\n"
                    + "join Chapter as ch on c.cid = ch.cid\n"
                    + "where c.cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            Comic c = null;

            while (rs.next()) {
                if (c == null) {
                    c = new Comic(
                            rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getDate(6),
                            rs.getBoolean(7));
                }

                int chid = rs.getInt("chid");
                if (chid != 0) {
                    Chapter ch = new Chapter();
                    ch.setChapterId(chid);
                    ch.setChapterName(rs.getString("chname"));
                    ch.setChapterNo(rs.getInt("chno"));
                    ch.setChapterImg(rs.getString("chimg"));
                    c.getChapters().add(ch);
                }
            }
            return c;
        } catch (SQLException ex) {
            Logger.getLogger(ComicDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Comic getComicByID(int id) {
        String sql = "select * from Comic\n"
                + "where cid = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                return new Comic(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6),
                        rs.getBoolean(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ComicDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void deleteComic(int cid) {
        String sql = "Delete Chapter where cid = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            stm.executeUpdate();

            String sql_remove_category = "Delete ComicCategory where cid = ?";
            PreparedStatement stm_remove_category = connection.prepareStatement(sql_remove_category);
            stm_remove_category.setInt(1, cid);
            stm_remove_category.executeUpdate();

            String sql_remove_comic = "Delete from Comic where cid = ?";
            PreparedStatement stm_remove_comic = connection.prepareStatement(sql_remove_comic);
            stm_remove_comic.setInt(1, cid);
            stm_remove_comic.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ComicDBContext.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    public void insertComic(Comic c) {
        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO [Comic] ([cname], [cavatar], [cauthor], [cdescrible], [cpostdate], [cstatus]) \n"
                    + "VALUES (?,?,?,?,GETDATE(),?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, c.getComicName());
            stm.setString(2, c.getComicAvatar());
            stm.setString(3, c.getComicAuthor());
            stm.setString(4, c.getComicDescrible());
            stm.setBoolean(5, c.getComicStatus());
            stm.executeUpdate();

            //query to get comic id
            String sql_get_id = "select @@identity as cid";
            PreparedStatement stm_get_id = connection.prepareStatement(sql_get_id);
            ResultSet rs = stm_get_id.executeQuery();
            if (rs.next()) {
                c.setComicId(rs.getInt("cid"));
            }
            //insert into S_C 
            for (Category ca : c.getCategories()) {
                String sql_insert_cert = "INSERT INTO [ComicCategory]\n"
                        + "           ([cid]\n"
                        + "           ,[caid])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?)";
                PreparedStatement stm_insert_cert = connection.prepareStatement(sql_insert_cert);
                stm_insert_cert.setInt(1, c.getComicId());
                stm_insert_cert.setInt(2, ca.getCategoryId());
                stm_insert_cert.executeUpdate();
            }
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(ComicDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ComicDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(ComicDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void update(Comic c) {
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE [Comic]\n"
                    + "   SET [cname] = ?\n"
                    + "      ,[cavatar] = ?\n"
                    + "      ,[cauthor] = ?\n"
                    + "      ,[cdescrible] = ?\n"
                    + "      ,[cstatus] = ?\n"
                    + " WHERE cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, c.getComicName());
            stm.setString(2, c.getComicAvatar());
            stm.setString(3, c.getComicAuthor());
            stm.setString(4, c.getComicDescrible());
            stm.setBoolean(5, c.getComicStatus());
            stm.setInt(6, c.getComicId());
            stm.executeUpdate();

            //remove all cert of student
            String sql_remove_cert = "Delete ComicCategory where cid = ?";
            PreparedStatement stm_remove_cert = connection.prepareStatement(sql_remove_cert);
            stm_remove_cert.setInt(1, c.getComicId());
            stm_remove_cert.executeUpdate();

            //insert new certs for student
            for (Category ca : c.getCategories()) {
                String sql_insert_cert = "INSERT INTO [ComicCategory]\n"
                        + "           ([cid]\n"
                        + "           ,[caid])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?)";
                PreparedStatement stm_insert_cert = connection.prepareStatement(sql_insert_cert);
                stm_insert_cert.setInt(1, c.getComicId());
                stm_insert_cert.setInt(2, ca.getCategoryId());
                stm_insert_cert.executeUpdate();
            }

            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(ComicDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ComicDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(ComicDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public int getCount() {
        try {
            String sql = "SELECT count(*) as Total FROM Comic";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ComicDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public static void main(String[] args) {
        ComicDBContext cdb = new ComicDBContext();
        Comic c = cdb.getComic(1);
        System.out.println(c);

        ArrayList<Comic> allComicByStatus = cdb.getAllComicByStatus(Boolean.FALSE);
        System.out.println(allComicByStatus);
//        ArrayList<Comic> all = cdb.getAllComic();
//        System.out.println(all);
//        System.out.println("");
    }
}

//
//    public ArrayList<Comic> getTop3Comic() {
//        ArrayList<Comic> list = new ArrayList<>();
//        String sql = "select top 3 * from Comic";
//        try {
//            PreparedStatement stm = connection.prepareStatement(sql);
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                list.add(new Comic(
//                        rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getString(4),
//                        rs.getString(5),
//                        rs.getDate(6),
//                        rs.getBoolean(7)));
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(ComicDBContext.class.getName()).log(Level.SEVERE, null, ex);
//
//        }
//        return list;
//    }
//
//    public ArrayList<Comic> getNext3Comic(int amount) {
//        ArrayList<Comic> list = new ArrayList<>();
//        String sql = "SELECT *\n"
//                + "  FROM Comic\n"
//                + " ORDER BY cid\n"
//                + "OFFSET ? ROWS\n"
//                + " FETCH NEXT 3 ROWS ONLY";
//        try {
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setInt(1, amount);
//            ResultSet rs = stm.executeQuery();
//
//            while (rs.next()) {
//                list.add(new Comic(
//                        rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getString(4),
//                        rs.getString(5),
//                        rs.getDate(6),
//                        rs.getBoolean(7)));
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(ComicDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return list;
//    }
