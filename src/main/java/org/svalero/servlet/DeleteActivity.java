package org.svalero.servlet;


import org.svalero.dao.ActivityDao;
import org.svalero.dao.Database;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteActivityServlet")
public class DeleteActivity extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            Database.connect();
            int affectedRows = Database.jdbi.withExtension(ActivityDao.class,
                    dao -> dao.removeActivity(id));
            response.sendRedirect("/ActividadesSanValero");
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }

    }
}
