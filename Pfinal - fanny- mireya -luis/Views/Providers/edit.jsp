<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.util.List"%>
<% 
Provider p = (Provider)request.getAttribute("proveedor");
List<Provider> providers = (List<Provider>) request.getAttribute("providers");

String aux="";
String aux2="";
String emailsExist="";
String numsExist="";
for( Provider t : providers ) {
	if(t.getProviderid().equals(p.getProviderid())) {
		aux=aux+"";
	}else{
		emailsExist=emailsExist+"(?!"+t.getEmail()+")";
		numsExist=numsExist+"(?!"+t.getCelular()+")";
		if(t.getDocIde().length()==8 )
			aux=aux+"(?!"+t.getDocIde()+")";
		else 
			aux2=aux2+"(?!"+t.getDocIde()+")";
	}
}
%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="../assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Provider Edit</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="../assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="../assets/css/paper-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="../assets/css/demo.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="../assets/css/themify-icons.css" rel="stylesheet">

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

                <li>
                    <a href="/users">
                        <i class="ti-user"></i>
                        <p>Usuarios</p>
                    </a>
                </li>
                <li>
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
                <li class="active">
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
                    <a class="navbar-brand" href="#">Editar Proveedor</a>
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
                    <div class="col-lg-12 col-md-7">
                        <div class="card">
                            <div class="content">
                                <form action="/providers/edit" method="get">
                                    
                                    <div class="row">
                                    	<div class="col-md-7">
                                            <div class="form-group">
                                                <label for="">Documento de identificación</label>
                                                <input type="text" class="form-control border-input" name="docIde" maxlength="11" value="<%= p.getDocIde() %>" pattern="<%=aux %>[0-9]{8}|(<%=aux2 %>(10|20)[0-9]{9})" title="RUC(11 dígitos), DNI(8 dígitos), no duplicados"  required>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-7">
                                            <div class="form-group">
                                                <label for="">Nombre/Razon Social</label>
                                                <input type="text" class="form-control border-input" name="name" maxlength="20" value="<%= p.getName() %>" pattern="[a-Z]{5-20}" title="Mínimo 5, Máximo 20 caracteres" required>
                                            </div>
                                        </div>
                                    </div>
                                    
									<div class="row">
                                        <div class="col-md-7">
                                        	<div class="form-group">
                                                <input type="text" class="form-control border-input" name="address" maxlength="40" value="<%= p.getAddress() %>" pattern="[a-Z]{5-20}" title="Mínimo 5, Máximo 20 caracteres" required>
      										</div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-7">
                                            <div class="form-group">
                                                <label for="">Celular</label>
                                                <input type="text" class="form-control border-input" name="celular" maxlength="12" value="<%= p.getCelular() %>" pattern="<%=numsExist %>[0-9]{6,9}" title="No duplicado, un número de contacto solo puede tener de 6(teléfono) a 9(celular) dígitos" required>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-7">
                                            <div class="form-group">
                                                <label for="">Correo</label>
                                                <input type="email" class="form-control border-input" name="email" maxlength="20" value="<%= p.getEmail() %>" pattern="<%=emailsExist %>^[^@]+@[^@]+\.[a-zA-Z]{2,}$" title="No podrá ingresar un correo ya registrado." required>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-7">
                                            <div class="form-group">
                                                <label for="">Estado</label><br>
                                                <input type="radio" name="status" value="Activo" checked> Activo<br>
  												<input type="radio" name="status" value="No activo">No activo<br>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <input type="hidden" name="id" value="<%=p.getProviderid()%>"/>
                                    
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-info btn-fill btn-wd">Guardar</button>
                                    </div>
                                    
                                    
                                    <div class="clearfix"></div>
                                </form>
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
    <script src="../assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="../assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="../assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="../assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="../assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="../assets/js/demo.js"></script>


</html>
