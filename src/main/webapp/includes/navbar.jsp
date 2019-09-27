<%@page import="com.ipartek.formacion.controller.backoffice.VideoController"%>
<%@page import="com.ipartek.formacion.controller.frontoffice.VideoFrontofficeController"%>
<%@page import="com.ipartek.formacion.model.pojo.Rol"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

	<a class="navbar-brand" href="inicio">UF2218</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">

		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="inicio">
					<fmt:message key="menu.inicio" /> <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="ejemplos/index.jsp">
					Ejemplos
			</a></li>
			<!-- Solo se deben ver cuando se loguea con un administrador -->
			<c:if test="${sessionScope.usuario.rol.id == Rol.ROL_ADMINISTRADOR}">
				<li class="nav-item active"><a class="nav-link"
					href="backoffice/inicio">Dashboard</a></li>
			</c:if>
			<c:if test="${sessionScope.usuario.rol.id == Rol.ROL_ADMINISTRADOR}">
				<li class="nav-item active"><a class="nav-link"
					href="backoffice/videos">Administracion videos</a></li>
			</c:if>
			<c:if test="${sessionScope.usuario.rol.id == Rol.ROL_ADMINISTRADOR}">
			<li class="nav-item active"><a class="nav-link"
				href="backoffice/usuario">Usuarios</a></li>
				</c:if>
			<c:if test="${sessionScope.usuario.rol.id == Rol.ROL_ADMINISTRADOR}">
				<li class="nav-item active"><a class="nav-link"
					href="backoffice/categoria">Categorias</a></li>
			</c:if>
			<!-- 
			${sessionScope.usuario != null}
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Youtube </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="backoffice/videos">Listado</a>	
					<a class="dropdown-item" href="backoffice/videos?op=1">Formulario</a>
					<a class="dropdown-item" href="backoffice/videos?op=13">Detalle</a>
					-->
					
			<!-- Los ve el usuario logueado -->		
			<c:if test="${sessionScope.usuario.rol.id == Rol.ROL_USUARIO}">
				<li class="nav-item active"><a class="nav-link"
					href="frontoffice/videos">Videos Propios</a></li>
			</c:if>	
			<c:if test="${sessionScope.usuario.rol.id == Rol.ROL_USUARIO}">
				<li class="nav-item active"><a class="nav-link"
					href="frontoffice/index.jsp">Dashboard</a></li>
			</c:if>	
			
	</div>
	
	<ul class="navbar-nav mr-auto">

		<c:if test="${sessionScope.usuario == null}">
			<a class="nav-link" href="login.jsp">Login</a>
		</c:if>
		<c:if test="${sessionScope.usuario != null}">
			<span class="nav-link text-light"><i class="fas fa-user"></i>
				Hola ${sessionScope.usuario.nombre}</span>
			<a class="nav-link" href="logout">Logout</a>
		</c:if>

	</ul>

	
	<!-- end container -->
</nav>
<!-- end navbar -->

<!-- navbar idiomas -->
<div class="d-flex flex-row-reverse bd-highlight container">
	<div class="p-2">
		<a href="i18n?idiomaSeleccionado=es_ES"><img alt="es"
			src="resources/img/Spain.png"
			class="${sessionScope.idiomaSeleccionado != 'es_ES' ? 'inactive':'' }"
			width=25px></a>
	</div>
	<div class="p-2">
		<a href="i18n?idiomaSeleccionado=en_EN"><img alt="es"
			src="resources/img/british.png"
			class="${sessionScope.idiomaSeleccionado != 'en_EN' ? 'inactive':'' }"
			width=25px></a>
	</div>
	<div class="p-2">
		<a href="i18n?idiomaSeleccionado=eu_ES"><img alt="es"
			src="resources/img/euskadi.png"
			class="${sessionScope.idiomaSeleccionado != 'eu_ES' ? 'inactive':'' }"
			width=25px></a>
	</div>
</div>

<!-- end navbar idiomas -->
<main class="container pt-2 mb-5">