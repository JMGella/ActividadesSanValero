
<html>
<head>
    <meta charset="UTF-8">
    <title>San Valero Activities</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<%
    HttpSession currentSession = request.getSession();
    String role = "anonymous";
    int userId = 0;
    if (currentSession.getAttribute("role") != null) {
        role = currentSession.getAttribute("role").toString();
    }
    if (currentSession.getAttribute("id") != null) {
        userId = Integer.parseInt(currentSession.getAttribute("id").toString());
    }
%>

<div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">

        <a href="/ActividadesSanValero"><h3>San Valero Activities</h3></a>



        <div class="col-md-3 text-end">
            <button type="button" class="btn btn-outline-primary me-2">Login</button>
            <button type="button" class="btn btn-primary">Sign-up</button>
        </div>
    </header>
</div>


<main class="form-signin w-100 m-auto">
    <div class="container mt-5">
        <div class="row">
            <div class="col">
            </div>
            <div class="col">
                <h1 class="h3 mb-3 fw-normal">Log In</h1>
                <form method="post" action="LoginServlet">
                    <div class="mb-3 form-floating">
                        <label for="inputUsuario" class="form-label">User</label>
                        <input type="text" class="form-control" id="inputUsuario" name="username" placeholder="User" >
                    </div>

                    <div class="mb-5 form-floating">
                        <label for="inputPassword" class="form-label">Password</label>
                        <input type="password" class="form-control" id="inputPassword" name="password" placeholder="*********" >
                    </div>

                    <button type="submit" class="btn btn-primary">Log in </button>
                    <a href="registe-ruser.jsp" class="btn btn-secondary">Sign-up </a>

                </form>
            </div>
            <div class="col">
            </div>
        </div><br/>
        <div class="container">
            <div class="col"></div>
            <div id="result"></div>
            <div class="col"></div>
        </div>
    </div>

</main>