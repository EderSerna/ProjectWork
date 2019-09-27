<%@page import="com.ipartek.formacion.controller.backoffice.CategoriaController"%>
<%@page import="com.ipartek.formacion.controller.ControladorCrud"%>
<%@include file="../../includes/header.jsp"%>
<%@include file="../../includes/navbar.jsp"%>

<h1>Formulario</h1>
<div class="row">
	<div class="col">
	 	<%@include file="../../includes/mensaje.jsp"%>
		<form action="backoffice/categoria" method="post">
			
				<%
					if (ControladorCrud.OP_MOSTRAR_FORMULARIO.equals(request.getAttribute("op"))) {
				%>
					<input type="hidden" name="op" value="<%=CategoriaController.OP_GUARDAR%>">
				<%
					}
				%>
				<%
					if (ControladorCrud.OP_GUARDAR.equals(request.getAttribute("op"))) {
				%>
					<input type="hidden" name="op" value="<%=CategoriaController.OP_GUARDAR%>">
				<%
					}
				%>
				<%
					if (ControladorCrud.OP_ELIMINAR.equals(request.getAttribute("op"))) {
				%>
					<input type="hidden" name="op" value="<%=CategoriaController.OP_ELIMINAR%>">
				<%
					}
				%>
			
  			 <input type="hidden" name="op" value="<%=ControladorCrud.OP_GUARDAR%>">
   			
   			<div class="form-group">
   			 	<label for="inputId" class="col-sm-3 col-form-label col-form-label-lg">Id</label>
   				<input type="text" readonly class="form-control" name="id" id="id" placeholder="" value="${categoriaEditar.id}">
  			</div>
				
			<div class="form-group">
			    <label for="inputTitulo" class="col-sm-3 col-form-label col-form-label-lg">Nombre</label>
			    <input type="text" class="form-control" name="nombre" id="inputTitulo" placeholder="" value="${categoriaEditar.nombre}">
			 </div>
		   
			<div class="form-group row">
				<input type="submit" value="${(categoriaEditar.id != -1)?'Modificar':'Crear'}" class="btn btn-outline-primary  btn-block">
				
					
					
				<c:if test="${categoriaEditar.id != -1}">
				
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-outline-danger btn-block" data-toggle="modal" data-target="#eliminar">
					  Eliminar
					</button>
			
					<!-- Modal -->
					<div class="modal fade" id="eliminar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">¿Estas Seguro de ELIMINAR el registro?</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					        <p>Cuidado porque operación no es reversible</p>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				        	<form action="backoffice/categoria" method="post">	
								<input type="hidden" name="op" value="<%=CategoriaController.OP_ELIMINAR%>">
								<input type="hidden" name="id" value="${categoria.id}" readonly>			
								<input type="submit" value="Eliminar" class="btn btn-danger btn-block">	
							</form>
					      </div>
					    </div>
					  </div>
					</div>		
				</c:if>	
				

			</div>
				
		</form>
	</div>
</div>
<%@include file="../../includes/footer.jsp"%>