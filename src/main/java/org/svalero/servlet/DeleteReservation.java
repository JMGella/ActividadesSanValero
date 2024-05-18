package org.svalero.servlet;

import org.svalero.dao.Database;
import org.svalero.dao.ReservationDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;


@WebServlet("/DeleteReservationServlet")
public class DeleteReservation extends HttpServlet {


    @Override

        public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            HttpSession currentSession = request.getSession();
            if (currentSession.getAttribute("role") == null) {
                response.sendRedirect("/ActividadesSanValero");
            }

            final int act_id = Integer.parseInt(request.getParameter("act_id"));
            final int user_id = (int) currentSession.getAttribute("id");

            try {
                Database.connect();
                Database.jdbi.withExtension(ReservationDao.class, dao -> dao.deleteReservation(user_id, act_id));
                response.sendRedirect("profile.jsp");


            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                response.getWriter().println("Internal Server Error");



            }
        }
}
