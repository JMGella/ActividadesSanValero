

<html>
<head>
    <meta charset="UTF-8">
    <title>San Valero Activities</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>



    <div class="container">
        <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">

            <a href="/ActividadesSanValero"><h3>San Valero Activities</h3></a>



            <div class="col-md-3 text-end">
                <a type="button" href="login.jsp" class="btn btn-outline-primary me-2">Login</a>
                <a type="button" href="register-user.jsp" class="btn btn-primary">Sign-up</a>
            </div>
        </header>
    </div>




    <main class="form-signin w-100 m-auto">
        <div class="container mt-5">
            <div class="row">
                <div class="col">
                </div>
                <div class="col">
                    <h1 class="h3 mb-3 fw-normal">Register new user</h1>
                    <form method="post" enctype="multipart/form-data" id="register-form" action="RegisterServlet">
                        <div class="mb-3 form-floating">
                            <label for="inputNombre" class="form-label">Name</label>
                            <input type="text" class="form-control" id="inputNombre" name="user_firstname" placeholder="Name" >
                        </div>
                        <div class="mb-3 form-floating">
                            <label for="inputNombre" class="form-label">Last Name</label>
                            <input type="text" class="form-control" id="inputapellido" name="user_lastname" placeholder="Last Name" >
                        </div>

                        <div class="mb-3 form-floating">
                            <label for="inputUsuario" class="form-label">User</label>
                            <input type="text" class="form-control" id="inputUsuario" name="username" placeholder="User" >
                        </div>


                        <div class="mb-5 form-floating">
                            <label for="inputPassword" class="form-label">Password</label>
                            <input type="password" class="form-control" id="inputPassword" name="password" placeholder="*********" >
                        </div>

                        <div class="mb-3 form-floating">
                            <label for="inputUsuario" class="form-label">Phone Number</label>
                            <input type="number" class="form-control" id="inputtelefono" name="user_phone" placeholder="00000000000" >
                        </div>


                        <button type="submit" class="btn btn-primary" id="register-button">Sign Up</button>


                    </form>
                </div>
                <div class="col">
                </div>
            </div><br/>

        </div>

    </main>