<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.util.List"%>

<%
List<Role> roles = (List<Role>)request.getAttribute("roles");
%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Roles View</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/themify-icons.css" rel="stylesheet">

</head>
<body>

<div class="wrapper">
	<div class="sidebar" data-background-color="white" data-active-color="danger">

    <!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a  class="simple-text">
                    ERP
                </a>
            </div>

            <ul class="nav">

                <li >
                    <a href="/users">
                        <i class="ti-user"></i>
                        <p>Usuarios</p>
                    </a>
                </li>
                <li class="active">
                    <a href="/roles">
                        <i class="ti-stamp"></i>
                        <p>Roles</p>
                    </a>
                </li>
                <li >
                    <a href="/resources">
                        <i class="ti-view-grid"></i>
                        <p>Resources</p>
                    </a>
                </li>
                <li>
                    <a href="/access">
                        <i class="ti-lock"></i>
                        <p>Access</p>
                    </a>
                </li>
                <li>
                    <a href="/products">
                        <i class="ti-view-list-alt"></i>
                        <p>Products</p>
                    </a>
                </li>
                <li >
                    <a href="/providers">
                        <i class="ti-view-list-alt"></i>
                        <p>Providers</p>
                    </a>
                </li>
				<li >
                    <a href="/client">
                        <i class="ti-view-list-alt"></i>
                        <p>Clients</p>
                    </a>
                </li>
<li >
                    <a href="/compras">
                        <i class="ti-view-list-alt"></i>
                        <p>Registro - Compras</p>
                    </a>
                </li>
                <li >
                    <a href="/ventas">
                        <i class="ti-view-list-alt"></i>
                        <p>Registro - Ventas</p>
                    </a>
                </li>
            </ul>
    	</div>
    </div>

    <div class="main-panel">
		<nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#">Lista de Roles</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
						<li>
                            <a href="/users/login">
								<i class="ti-angle-down"></i>
								<p>LogIn</p>
                            </a>
                        </li>
                        <li>
                            <a href="/users/logout">
								<i class="ti-angle-up"></i>
								<p>LogOut</p>
                            </a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
								<a href="/roles/add"><button class="btn btn-info btn-fill btn-wd"><i class="ti-plus"></i> Rol</button></a>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-striped">
                                    <thead>
                                        <th>ID</th>
                                    	<th>Nombre</th>
                                    	<th>Estado</th>
                                    	<th>Creación</th>
                                    	<th>Acciones</th>
                                    </thead>
                                    <tbody>
                                    	<%
                                    	for(Role p : roles){
                                    		out.println("<tr>");
                                    		out.println("<td>"+ p.getRoleId() +"</td>");
                                    		out.println("<td>"+ p.getName() +"</td>");
                                    		out.println("<td>"+ p.getStatusMostrar() +"</td>");
                                    		out.println("<td>"+ p.getCreatedFormatted() +"</td>");
                                    		out.println("<td><a href='/roles/view?roleId="+p.getRoleId()+"'>View</a> "+
                                    			"<a href='/roles/edit?roleId="+p.getRoleId()+"'>Editar</a> "+
                                    			"<a href='/roles/delete?roleId="+p.getRoleId()+"'>Eliminar</a>" +"</td>");
                                        	out.println("</tr>");
                                    	}
                                    	%>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        

    </div>
</div>


</body>

    <!--   Core JS Files   -->
    <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script>


</html>
