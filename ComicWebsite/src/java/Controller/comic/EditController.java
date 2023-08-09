package Controller.comic;

import Controller.authentication.BaseRequireAuthenController;
import dal.ComicDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Category;
import model.Comic;

public class EditController extends BaseRequireAuthenController {

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
        c.setComicId(Integer.parseInt(request.getParameter("cid")));
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
        cdb.update(c);
        response.sendRedirect("manager");
    }


    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
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
