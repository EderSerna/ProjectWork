<%@page import="com.ipartek.formacion.controller.backoffice.UsuarioController"%>
<%@page import="com.ipartek.formacion.controller.frontoffice.VideoFrontofficeController"%>

<%@include file="../../includes/header.jsp"%>
<%@include file="../../includes/navbar.jsp"%>


<h3>Número de likes del usuario: ${numLikes }</h3>
<div class="row">
    <div class="col-10">
     	<h1>Videos Publicados por el usuario</h1>
		<%@include file="../../includes/mensaje.jsp"%>
    </div>
    <div class="col">
     <a class="btn btn-primary mt-2" href="frontoffice/videos?op=<%=VideoFrontofficeController.OP_NUEVO%>" role="button" title="anadir"><i class="fas fa-plus"></i> Añadir</a>

    </div>
</div>			
	

<table class="table">
	<thead>
		<tr class="text-center">
			<th scope="col">Video</th>
			<th scope="col">Título</th>
			<th scope="col">Operación</th>
		</tr>
	</thead>
	<tbody class="text-center">
		<c:forEach items="${videosUsuario}" var="v" >	
			<tr>
				<td class="video align-middle">
					<div class="embed-responsive">
						<a href="frontoffice/videos?op=<%=VideoFrontofficeController.OP_DETALLE%>&id=${v.id}">
						  			<img class="float-left mr-3" src="https://img.youtube.com/vi/${v.codigo}/default.jpg" alt="Imagen destacda del video ${v.nombre}"/>
						 </a>
					</div>	 
				</td>
				<td class="align-middle">
					<p class="h3">${v.nombre}</p>
					<p><i class="fas fa-tag mr-1"></i>${v.categoria.nombre}</p>
					<p><i class="far fa-thumbs-up ml-5"></i>${v.likes}</p>
				</td>
				<td class="align-middle">
					<a class="btn btn-success" href="frontoffice/videos?op=<%=VideoFrontofficeController.OP_DETALLE%>&id=${v.id}" role="button" title="editar"><i class="fas fa-edit"></i> Editar</a>
					<a class="btn btn-danger text-light" role="button" title="eliminar" data-toggle="modal" data-target="#eliminar${v.id}"><i class="fas fa-trash-alt"></i> Borrar</a>
					
				<!-- Modal -->
							<div class="modal fade" id="eliminar${v.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
						        	<form action="frontoffice/videos" method="post">					 
										<input type="hidden" name="op" value="<%=VideoFrontofficeController.OP_ELIMINAR%>">
										<input type="hidden" name="id" value="${v.id}" readonly>			
										<input type="submit" value="Eliminar" class="btn btn-danger btn-block">	
									</form>
									<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							      </div>
							    </div>
							  </div>
							</div>	
				<!-- End Modal -->
				
				</td>	
			</tr>
		</c:forEach>	
	</tbody>
</table>
<%@include file="../../includes/footer.jsp"%>