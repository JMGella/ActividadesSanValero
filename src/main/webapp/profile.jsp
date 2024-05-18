        <%@ page import="org.svalero.dao.Database" %>
<%@ page import="org.svalero.domain.User" %>
<%@ page import="org.svalero.dao.UserDao" %>
<%@ page import="org.svalero.domain.Reservation" %>
<%@ page import="org.svalero.dao.ReservationDao" %>
<%@ page import="java.util.List" %>
<%@ page import="org.svalero.domain.Activity" %>
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

                String role = currentSession.getAttribute("role").toString();
                String name = currentSession.getAttribute("name").toString();
                int userId = Integer.parseInt(currentSession.getAttribute("id").toString());

                %>

<div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">

        <a href="/ActividadesSanValero"><h3>San Valero Activities</h3></a>



        <div class="col-md-3 text-end">
            <% if (role.equals("anonymous")) {%>
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
        <div class="col"><h1 class="display-5 fw-bold text-body-emphasis lh-1 mb-3 text-center">Profile Details</h1></div>
        <div class="col"></div>
    </div>
    <%

        Database.connect();
        User user = Database.jdbi.withExtension(UserDao.class, dao -> dao.getUserid(userId));
    %>

    <div class="container">
        <div class="card text-center">

            <div class="card-body">

                <h5 class="card-title"><%=user.getUser_firstname()%></h5>
                <h5 class="card-title"><%=user.getUser_lastName()%></h5>
                <h5 class="card-title"><%=user.getUser_phone()%></h5>

            </div>
            <div class="card-header">
                <h3> My Reservations</h3>


               <%
                   List<Reservation> reservations = Database.jdbi.withExtension(ReservationDao.class, dao -> dao.getReservationsbyUser(user.getUser_id()));
                   for (Reservation reservation : reservations) {

                   Activity activity = Database.jdbi.withExtension(ActivityDao.class, dao -> dao.getActivity(reservation.getAct_id()));

               %>
                <h5 class="card-title"><%=activity.getAct_name()%></h5>
                <a href="detail.jsp?id=<%=activity.getAct_id()%>" type="button" class="btn btn-sm btn-outline-primary mr-1"> More Info</a>
                <a href="DeleteReservationServlet?act_id=<%=activity.getAct_id()%>" type="button" class="btn btn-sm btn-outline-danger mr-1"> Delete Reservation</a>
                <%}%>

            </div>


        </div>
</main>
</html>
```

