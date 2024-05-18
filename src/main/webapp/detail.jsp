<%@ page import="org.svalero.dao.Database" %>
<%@ page import="org.svalero.domain.Activity" %>
<%@ page import="org.svalero.dao.ActivityDao" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>San Valero Activities</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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



    <main>
        <div class="container mb-5">
        <div class="col"></div>
        <div class="col"><h1 class="display-5 fw-bold text-body-emphasis lh-1 mb-3 text-center">Activity Details</h1></div>
        <div class="col"></div>
        </div>
    <%
        int id = Integer.parseInt(request.getParameter("id"));

        Database.connect();
        Activity activity = Database.jdbi.withExtension(ActivityDao.class, dao -> dao.getActivity(id));
    %>
    <div class="container">
        <div class="card text-center">
            <div class="card-header">

            </div>
            <div class="card-body">
                <img src="../FotosActividadesSanValero/<%= activity.getAct_image() %>" class="card-img-top" style="object-fit: cover" width="100%" height="225"  </img>
                <h5 class="card-title"><%= activity.getAct_name() %></h5>
                <p class="card-text"><%= activity.getAct_description() %></p>
                <p class="card-text"> Start Date: <%=activity.getAct_start_date()  %></p>
                <p class="card-text"> End Date: <%=activity.getAct_end_date()  %></p>

                <a href="signup-activity?id=<%=activity.getAct_id()%>" class="btn btn-primary">Sign in</a>
            </div>

    </div>
</main>