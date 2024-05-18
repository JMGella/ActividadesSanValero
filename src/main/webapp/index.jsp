<%@ page import="org.svalero.domain.Activity" %>
<%@ page import="org.svalero.dao.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="org.svalero.dao.ActivityDao" %>
<html>
<head>
    <meta charset="UTF-8">
     <title>Actividades Extraescolares de San Valero</title>
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">


               <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
                   <a href="/ActividadesSanValero" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                       <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
                       <span class="fs-4">San Valero Activities</span>
                   </a>

               </header>


    <div class="container mb-5">
        <div class="col"></div>
        <div class="col"><h1 class="display-5 fw-bold text-body-emphasis lh-1 mb-3 text-center">These are our available activities</h1></div>
        <div class="col"></div>
    </div>

    <div class="album py-5">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <%

                    Database.connect();
                    List<Activity> activities = Database.jdbi.withExtension(ActivityDao.class, dao -> dao.getAllActivities());
                    for (Activity activity : activities) {

                %>
                <div class="col mb-5">
                    <div class="card shadow h-100">
                        <img src="../FotosActividadesSanValero/<%= activity.getAct_image() %>" class="card-img-top" style="object-fit: cover" width="100%" height="225"  </img>

                        <div class="card-body">
                            <h4 class="card-text"><strong><%= activity.getAct_name() %> </strong></h4>
                            <p class="card-text"><%= activity.getAct_description() %></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <a href="detail.jsp?id=<%= activity.getAct_id() %>" type="button" class="btn btn-sm btn-outline-primary mr-1">+ Info</a>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
