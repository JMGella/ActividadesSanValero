package org.svalero.servlet;

import org.svalero.dao.Database;
import org.svalero.dao.UserDao;
import org.svalero.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");


        try {
            Database.connect();
            User user = Database.jdbi.withExtension(UserDao.class, dao -> dao.getUser(username, password));
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("role", user.getUser_role());
                session.setAttribute("username", user.getUsername());
                session.setAttribute("name", user.getUser_firstname());
                session.setAttribute("id", user.getUser_id());
                response.sendRedirect("index.jsp");
            } else {
                response.getWriter().println("<div class='alert alert-warning' role='alert'>" + "Wrong Password" + "</div>");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("<div class='alert alert-warning' role='alert'>" + "Internal Server Error" + "</div>");
            return;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            response.getWriter().println("<div class='alert alert-warning' role='alert'>" + "Error" + "</div>");
            return;
        }

    }
}