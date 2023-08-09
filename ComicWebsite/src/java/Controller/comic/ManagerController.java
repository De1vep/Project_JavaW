package Controller.comic;

import Controller.authentication.BaseRequireAuthenController;
import dal.CategoryDBContext;
import dal.ChapterDBContext;
import dal.ComicDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import model.Account;
import model.Category;
import model.Chapter;
import model.Comic;

/**
 *
 * @author Won Wolf
 */
public class ManagerController extends BaseRequireAuthenController {

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
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");

        ComicDBContext cdb = new ComicDBContext();
        String page = request.getParameter("page");
        if (page == null || page.trim().length() == 0) {
            page = "1";
        }
        int pageSize = 10;
        int pageIndex = Integer.parseInt(page);
        ArrayList<Comic> list = cdb.getAllComic(pageIndex, pageSize);
        int totalRecords = cdb.getCount();
        int totalPages = (totalRecords % pageSize == 0) ? totalRecords / pageSize
                : (totalRecords / pageSize) + 1;
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageIndex", pageIndex);

        CategoryDBContext cadb = new CategoryDBContext();
        ArrayList<Category> listCa = cadb.getAllCategory();
        ArrayList<Comic> listt = cdb.getAllComic();

        ChapterDBContext chdb = new ChapterDBContext();
        ArrayList<Chapter> listCh = chdb.getAllChapter();

        request.setAttribute("listChapter", listCh);
        request.setAttribute("listComic", list);
        request.setAttribute("listComicc", listt);
        request.setAttribute("listCategory", listCa);
        request.getRequestDispatcher("ManagerComic.jsp").forward(request, response);

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
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
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
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
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
