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

<main>

    <div class="container">

        <h1 class="mb-5">Add Activity</h1>

        <form class="row g-3 needs-validation"  method="post" enctype="multipart/form-data" action="AddActivityServlet">
            <div class="col-md-4">
                <label for="inputNombre" class="form-label">Activity Name</label>
                <input type="text" name="act_name" class="form-control" id="inputNombre" placeholder="Activity Name" >
            </div>

            <div class="col-md-4">
                <label for="inputFechainicio"  class="form-label">Start Date</label>
                <input type="date" name="act_start_date" class="form-control"  id="inputFechainicio">
                <label for="inputFechafin"  class="form-label">End Date</label>
                <input type="date" name="act_end_date" class="form-control"  id="inputFechafin">
            </div>


            <div class="col-md-4">
                <label for="inputFoto" class="form-label">Foto</label>
                <input type="file" name="act_image" class="form-control"  id="inputFoto">
            </div>

            <div class="input-group justify-content-center mt-4">
                <span class="input-group-text">Description</span>
                <textarea name="act_description" class="form-control"  id="inputDescripcion" >  </textarea>

            </div>
            <div class="mt-4 justify-content-center">


                <input class="btn btn-outline-primary btn-lg"   value="Register"id="button" type="submit">
            </div>

        </form>

    </div>
</main>