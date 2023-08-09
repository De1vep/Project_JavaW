package Controller.comic;

import dal.CategoryDBContext;
import dal.ChapterDBContext;
import dal.ComicDBContext;
import dal.CommentDBContext;
import dal.FollowDBContext;
import dal.ViewDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Category;
import model.Chapter;
import model.Comic;
import model.Comment;
import model.Following;
import model.View;

public class DetailsController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(request.getParameter("cid"));
        ComicDBContext cdb = new ComicDBContext();
        Comic c = cdb.getComic(id);
        Comic cc = cdb.getComicByICA(id);
        Comic last = cdb.getLastComic();

        //lay ra so chuong truyen
        ChapterDBContext chdb = new ChapterDBContext();
        ArrayList<Chapter> listCh = chdb.getAllChapter();

        CategoryDBContext cadb = new CategoryDBContext();
        ArrayList<Category> listCa = cadb.getAllCategory();

        FollowDBContext fldb = new FollowDBContext();
        ArrayList<Following> listFollowed = fldb.getAllFollowingComic();

        CommentDBContext codb = new CommentDBContext();
        ArrayList<Comment> listComment = codb.getAllCommentByCid(id);

        ViewDBContext vdb = new ViewDBContext();
        View allView = vdb.getAllViewByCid(id);
        
     
        request.setAttribute("comic", c);
        request.setAttribute("comicc", cc);
        request.setAttribute("allView", allView);
        request.setAttribute("listChapter", listCh);
        request.setAttribute("listComment", listComment);
        request.setAttribute("listCategory", listCa);
        request.setAttribute("listFollowed", listFollowed);
        request.setAttribute("p", last);

        request.getRequestDispatcher("Detail.jsp").forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
