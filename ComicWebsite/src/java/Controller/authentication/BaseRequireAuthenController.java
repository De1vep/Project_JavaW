package Controller.authentication;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;
import model.Feature;

public abstract class BaseRequireAuthenController extends HttpServlet {

    private boolean isAuthenticated(HttpServletRequest request) {
        Account account = (Account) request.getSession().getAttribute("account");
        boolean isAuthorized = false;
        if (account == null) {
            return false;
        } else {
            String url = request.getServletPath();
            for (Feature f : account.getFeatures()) {
                if (f.getUrl().equals(url)) {
                    isAuthorized = true;
                    break;
                }
            }
        }
        return isAuthorized;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isAuthenticated(request)) {
            processGet(request, response);
        } else {
            response.getWriter().println("Access Denied!");
            response.getWriter().println("You do not have permission to access this page !!!");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isAuthenticated(request)) {
            processPost(request, response);
        } else {
            response.getWriter().println("Access Denied");
            response.getWriter().println("You do not have permission to access this page !!!");
        }
    }

    protected abstract void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException;

    protected abstract void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException;

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
