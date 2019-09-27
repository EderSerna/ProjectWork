<%@page
	import="com.ipartek.formacion.controller.backoffice.UsuarioController"%>
<%@page
	import="com.ipartek.formacion.controller.publico.InicioController"%>

<%@include file="../../includes/header.jsp"%>
<%@include file="../../includes/navbar.jsp"%>


<%@include file="../../includes/mensaje.jsp"%>


<!--******************************************************************************** 
************************************************************************************
************************************************************************************
*********************************************************************************-->


		<form action="inicio" class="form-inline my-2 my-lg-0 ">
			<input type="hidden" name="op"
				value="<%=InicioController.OP_BUSCAR%>"> <input
				class="form-control mr-sm-2" name="buscar" type="search"
				placeholder="Buscar" aria-label="Buscar">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">
				<i class="fas fa-search"></i>
			</button>
		</form>



<!--******************************************************************************** 
************************************************************************************
************************************************************************************
*********************************************************************************-->



<div class="row">
	<div class="col">
		<h1>Videos Publicados</h1>
		<ul class="list-group">
			<c:forEach items="${videosVisibles}" var="v">
				<li class="list-group-item"><img class="float-left mr-3"
					src="https://img.youtube.com/vi/${v.codigo}/default.jpg"
					alt="Imagen destacda del video ${v.nombre}" />
				
					<a href="inicio?op=<%=InicioController.OP_DETALLE%>&id=${v.id}"><p class="h3">${v.nombre}</p></a>
					<p>
						<i class="fas fa-user mr-1"></i>${v.usuario.nombre}</p>

					<p>
						<i class="fas fa-tag mr-1"></i>${v.categoria.nombre}</p>
					<p>
						<i class="far fa-thumbs-up ml-5"></i>${v.likes}</p></li>
			</c:forEach>
		</ul>
	</div>


</div>


<%@include file="../../includes/footer.jsp"%>

