<%@page import="com.ipartek.formacion.controller.backoffice.CategoriaController"%>
<%@page import="com.ipartek.formacion.controller.ControladorCrud"%>
<%@page import="com.ipartek.formacion.model.pojo.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../../includes/header.jsp"%>
<%@include file="../../includes/navbar.jsp"%>

<div class="row">
	<div class="col-10">
		<h1>Categorias</h1>
		<%@include file="../../includes/mensaje.jsp"%>
	</div>
</div>

<div class="row">
	<div class="col-5">
		<a class="btn btn-primary mt-2 mb-2"
			href="backoffice/categoria?op=<%=ControladorCrud.OP_MOSTRAR_FORMULARIO%>"
			role="button" title="anadir"><i class="fas fa-plus"></i> Añadir</a>
	</div>
	<div class="col-4">
		<a class="btn btn-danger mt-2 mb-2"
			href="backoffice/transacciones"
			role="button" title="insertar"><i class="fas fa-plus"></i> Insertar Categorias</a>
	</div>
	
	<div class="col-3">
		<!-- Search form -->
		<form action="backoffice/categoria" class="form-inline my-2 my-lg-0 ">
			<input type="hidden" name="op"
				value="<%=ControladorCrud.OP_BUSCAR%>"> <input
				class="form-control mr-sm-2" name="buscar" type="search"
				placeholder="Buscar" aria-label="Buscar">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">
				<i class="fas fa-search"></i>
			</button>
		</form>
	</div>
</div>


<%
	ArrayList<Categoria> categorias = (ArrayList<Categoria>) request.getAttribute("categorias");

	if (categorias.isEmpty()) {
%>
<li class="list-group-item text-danger">Lo Sentimos pero no hay
	categorias</li>
<%
	}
%>

<table class="table">
	<thead>
		<tr class="text-center">
			<th scope="col">Id</th>
			<th scope="col">Categoria</th>
			<!-- 
			<th scope="col">Contraseña</th>
			 -->
			<th scope="col">Opciones</th>
		</tr>
	</thead>

	<tbody class="text-center">

		<%
			for (Categoria categoria : categorias) {
		%>
		<tr>
			<td class="align-middle"><span class=""><%=categoria.getId()%></span></td>
			<td class="align-middle"><a href="backoffice/categoria?op=<%=ControladorCrud.OP_MOSTRAR_FORMULARIO%>&id=<%=categoria.getId()%>"><span class=""><%=categoria.getNombre()%></span></a></td>	
			<td class="align-middle"><a class="btn btn-success"
				href="backoffice/categoria?op=<%=ControladorCrud.OP_MOSTRAR_FORMULARIO%>&id=<%=categoria.getId()%>"
				role="button" title="editar"><i class="fas fa-edit"></i> Editar</a>

				<a class="btn btn-danger text-light" role="button" title="eliminar"
				data-toggle="modal" data-target="#eliminar<%=categoria.getId()%>"><i
					class="fas fa-trash-alt"></i> Borrar</a> <!-- Modal -->
				<div class="modal fade" id="eliminar<%=categoria.getId()%>" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">¿Estas
									Seguro de ELIMINAR el registro?</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<p>Cuidado porque operación no es reversible</p>
							</div>
							<div class="modal-footer">
								<form action="backoffice/categoria" method="post">
									<input type="hidden" name="op"
										value="<%=ControladorCrud.OP_ELIMINAR%>"> <input
										type="hidden" name="id" value="<%=categoria.getId()%>" readonly>
									<input type="submit" value="Eliminar"
										class="btn btn-danger btn-block">
								</form>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div></td>
		</tr>
		<%
			} // end for
		%>

	</tbody>
</table>
<%@include file="../../includes/footer.jsp"%>