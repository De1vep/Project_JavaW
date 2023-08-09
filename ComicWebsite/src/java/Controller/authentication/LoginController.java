package Controller.authentication;

import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;

public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Cookie arr[] = request.getCookies();
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("user")) {
                    request.setAttribute("username", o.getValue());
                }
                if (o.getName().equals("pass")) {
                    request.setAttribute("password", o.getValue());
                }
            }
        }

        request.getRequestDispatcher("Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String remember = request.getParameter("remember");
        AccountDBContext db = new AccountDBContext();
        Account account = db.getAccount(username, password);
        if (account != null) {//success
            request.getSession().setAttribute("account", account);

            Cookie u = new Cookie("user", username);
            Cookie p = new Cookie("pass", password);
            u.setMaxAge(Integer.MAX_VALUE); //second(s)
            if (remember != null) {
                p.setMaxAge(60*60);
            } else {
                p.setMaxAge(0);
            }
            response.addCookie(u);
            response.addCookie(p);
            response.sendRedirect("home");
//            request.getRequestDispatcher("home").forward(request, response);

        } else {
            request.getSession().setAttribute("account", null);
            request.setAttribute("mess", "Wrong user or pass");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }
    //getRequestDispatcher mang theo du lieu
    //sendRedirect k mang theo du lieu

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
