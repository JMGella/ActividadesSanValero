<%@ page import="org.svalero.domain.Activity" %>
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
                    List<Activity> activities = Database.jdbi.withExtension(DogDao.class, dao -> dao.getAllDogs());

                %>
                <div class="col mb-5">
                    <div class="card shadow h-100">
                        <img src="../AA_pictures/<%= dog.getPicture() %>" class="card-img-top" style="object-fit: cover" width="100%" height="225"  </img>

                        <div class="card-body">
                            <h4 class="card-text"><strong><%= dog.getName() %>   <span class="badge rounded-pill text-white bg-danger"><i class="bi bi-heart"></i>  <%=dog.favcount()%></span></strong></h4>
                            <% if (dog.getAdopted() == 1) { %> <h4><span class="badge rounded-pill bg-success"> Adoptado </span></h4> <% } %>
                            <p class="card-text"><%= dog.getDescription() %></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <a href="dog-detail.jsp?id=<%= dog.getId() %>" type="button" class="btn btn-sm btn-outline-primary mr-1">+ Info</a>

                                    <%

                                        if (role.equals("admin")) {
                                    %>
                                    <a href="edit-dog.jsp?id=<%= dog.getId() %>" type="button" class="btn btn-sm btn-outline-primary">Editar</a>
                                    <a href="RemoveDogServlet?id=<%= dog.getId() %>" type="button" id="eliminar" class="btn btn-sm btn-outline-danger" onClick="popup()" >Eliminar</a>
                                    <script>
                                        function popup() {
                                            alert("Perro eliminado");
                                        }
                                    </script>
                                    <%
                                        } if(role.equals("user")) {
                                        if (favorite != null) {%>


                                    <a href="RemoveFavServlet?fav_id=<%= favorite.getFav_id() %>" type="button" id="eliminar" class="btn btn-sm btn-outline-danger" onClick="popup2()" >Eliminar Favorito</a>
                                    <script>
                                        function popup2() {
                                            alert("Favorito eliminado");
                                        }
                                    </script>
                                    <%

                                    } else {

                                    %>
                                    <a href="FavDogServlet?dog_id=<%= dog.getId()%>" type="button" id="fav-button" class="btn btn-sm btn-outline-primary" onClick="popup3()">Añadir a Favoritos</a>
                                    <script>
                                        function popup3() {
                                            alert("Favorito añadido");
                                        }
                                    </script>
                                    <div id="result"></div>
                                    <% }}
                                    %>

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
