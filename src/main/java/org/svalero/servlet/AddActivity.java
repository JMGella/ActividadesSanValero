package org.svalero.servlet;

import org.svalero.dao.ActivityDao;
import org.svalero.dao.Database;
import org.svalero.util.DateUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.text.ParseException;
import java.util.Date;
import java.util.UUID;

@WebServlet ("/AddActivityServlet")
@MultipartConfig
public class AddActivity extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

     try {
         String act_name = request.getParameter("act_name");
         Date act_start_date = DateUtils.parse(request.getParameter("act_start_date"));
         Date act_end_date = DateUtils.parse(request.getParameter("act_end_date"));
         String act_description = request.getParameter("act_description");
         Part picturepart = request.getPart("act_image");

        String imagePath = "C:"+File.separator+"apache-tomcat-9.0.86"+File.separator+"webapps"+File.separator +"FotosActividadesSanValero";

         String filename = null;

         if (picturepart.getSize() == 0) {
             filename = "no-image.jpg";
         } else {
             filename = UUID.randomUUID() + ".jpg";
             InputStream input = picturepart.getInputStream();
             Files.copy(input, Path.of(imagePath + File.separator + filename));

         }
         Database.connect();
         final String finalfilename = filename;

         int affectedRows = Database.jdbi.withExtension(ActivityDao.class, dao -> dao.addActivity(act_name, act_start_date, act_end_date, act_description, finalfilename));


     } catch (ParseException e) {
         throw new RuntimeException(e);
     } catch (Exception e) {
         throw new RuntimeException(e);
     }
        response.sendRedirect("/ActividadesSanValero");
    }

}
