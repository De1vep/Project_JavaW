package Controller.comic;

import dal.ChapterDBContext;
import dal.ComicDBContext;
import dal.CommentDBContext;
import dal.ViewDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import model.Chapter;
import model.Comic;
import model.Comment;

public class ChapterController extends HttpServlet {

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
        int chno = Integer.parseInt(request.getParameter("chno"));
        int cid = Integer.parseInt(request.getParameter("cid"));

        //lay ra id truyen va chuong truyen
        ComicDBContext cdb = new ComicDBContext();
        Comic read = cdb.getComicByChnoAndCid(cid, chno);
        //lay ra tat ca chuong truyen
        ChapterDBContext chdb = new ChapterDBContext();
        ArrayList<Chapter> listCh = chdb.getAllChapter();

        CommentDBContext codb = new CommentDBContext();
        ArrayList<Comment> listComment = codb.getAllComment(cid, chno);

        ViewDBContext vdb = new ViewDBContext();
        HttpSession session = request.getSession();
        if (session != null) {
            vdb.updateView(cid, chno);
        }

        request.setAttribute("listComment", listComment);
        request.setAttribute("chap", chno);
        request.setAttribute("listChapter", listCh);
        request.setAttribute("readComic", read);
        request.getRequestDispatcher("Chapter.jsp").forward(request, response);

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
