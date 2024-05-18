<%@ page import="org.svalero.domain.Activity" %>
<%@ page import="org.svalero.dao.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="org.svalero.dao.ActivityDao" %>
<html>
<head>
    <meta charset="UTF-8">
     <title>San Valero Activities</title>
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>

    <%
    HttpSession currentSession = request.getSession();
    String role = "anonymous";
    String name = "none";
    int userId  ;

    if (currentSession.getAttribute("role") != null) {
        role = currentSession.getAttribute("role").toString();
        name = currentSession.getAttribute("name").toString();
        userId = Integer.parseInt(currentSession.getAttribute("id").toString());
    }
%>

    <div class="container">
        <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">

                <a href="/ActividadesSanValero"><h3>San Valero Activities</h3></a>



            <div class="col-md-3 text-end">
        <% if (role.equals("anonymous")){%>
                <a type="button" href="login.jsp" class="btn btn-outline-primary me-2">Login</a>
                <a type="button" href="register-user.jsp" class="btn btn-primary">Sign-up</a>
        <%} else {%>
                <a type="button" href="LogoutServlet" class="btn btn-outline-primary me-2">Logout</a>
                <a type="button" href="profile.jsp" class="btn btn-outline-primary me-2">Profile</a>
        <%}%>

            </div>
        </header>
    </div>


    <div class="container mb-5">
        <div class="col"></div>
        <div class="col"><h1 class="display-5 fw-bold text-body-emphasis lh-1 mb-3 text-center"> <% if (!role.equals("anonymous")) {
             %>
            Hello, <%= name %>
       These are our available activities</h1></div>
        <%}%>
        <div class="col"></div>

        <% if(role.equals("admin")){%>
        <a type="button" href="addactivity.jsp" class="btn btn-outline-primary me-2">Add Activity</a>
        <%}%>
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
                        <img src="../FotosActividadesSanValero/<%= activity.getAct_image() %>" class="card-img-top" style="object-fit: cover" width="100%" height="225" >

                        <div class="card-body">
                            <h4 class="card-text"><strong><%= activity.getAct_name() %> </strong></h4>
                            <p class="card-text"><%= activity.getAct_description() %></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <a href="detail.jsp?id=<%= activity.getAct_id() %>" type="button" class="btn btn-sm btn-outline-primary mr-1"> More Info</a>
                                    <%if(role.equals("admin")){%>
                                    <a href="DeleteActivityServlet?id=<%= activity.getAct_id() %>" type="button" class="btn btn-sm btn-outline-danger mr-1"> Delete</a>
                                    <%}%>
                                    <%if(!role.equals("anonymous")){%>
                                    <a href="AddReservationServlet?act_id=<%= activity.getAct_id() %>" type="button" class="btn btn-sm btn-outline-primary mr-1"> Join Activity</a>
                                    <%}%>


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
