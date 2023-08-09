package Controller.comic;

import Controller.authentication.BaseRequireAuthenController;
import dal.ComicDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Category;
import model.Comic;

/**
 *
 * @author Won Wolf
 */
public class InsertController extends BaseRequireAuthenController {

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
        request.setCharacterEncoding("UTF-8");
        Comic c = new Comic();
        c.setComicName(request.getParameter("cname"));
        c.setComicAvatar(request.getParameter("cavatar"));
        c.setComicAuthor(request.getParameter("cauthor"));
        c.setComicDescrible(request.getParameter("cdescrible"));
        c.setComicStatus(request.getParameter("cstatus").equals("true"));

        String[] caids = request.getParameterValues("caid");
        if (caids != null) {
            for (String caid : caids) {
                Category ca = new Category();
                ca.setCategoryId(Integer.parseInt(caid));
                c.getCategories().add(ca);
            }
        }
        
        ComicDBContext cdb = new ComicDBContext();
        cdb.insertComic(c);
        response.sendRedirect("manager");
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
