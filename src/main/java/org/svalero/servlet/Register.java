package org.svalero.servlet;

import org.svalero.dao.Database;
import org.svalero.dao.UserDao;
import org.svalero.domain.User;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;


    @WebServlet("/RegisterServlet")
    @MultipartConfig
    public class Register extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");

            HttpSession currentSession = request.getSession();

            if (currentSession.getAttribute("role") != null) {
                if (!currentSession.getAttribute("role").equals("anonymous")) {
                    response.sendRedirect("/ActividadesSanValero");
                }
            }

            String username = request.getParameter("username");

            String password = request.getParameter("password");

            String user_firstname = request.getParameter("user_firstname");

            String user_lastname = request.getParameter("user_lastname");
            int user_phone = Integer.parseInt(request.getParameter("user_phone"));


            try {
                Database.connect();
                User userexist = Database.jdbi.withExtension(UserDao.class, dao -> dao.getUser(username, password));
                if (userexist != null) {
                    response.getWriter().println("<div class='alert alert-warning' role='alert'>" + "User already Exists." + "</div>");
                    return;
                } else {

                    int affectedRows = Database.jdbi.withExtension(UserDao.class, dao -> dao.addUser(username, user_firstname, user_lastname, user_phone, password));

                    if (affectedRows == 1) {

                        response.sendRedirect("index.jsp");
                    } else {
                        response.getWriter().println("<div class='alert alert-warning' role='alert'>" + "Error .</div>");
                    }

                }

            } catch (ClassNotFoundException cnfe) {
                cnfe.printStackTrace();

            } catch (SQLException sqle) {
                sqle.printStackTrace();


            }
        }
    }
