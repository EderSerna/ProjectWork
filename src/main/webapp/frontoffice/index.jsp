<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
<%@include file="../includes/mensaje.jsp"%>

<h1>Bienvenido ${usuario.nombre }</h1>
<h3>La fecha en la que te registraste es: ${usuario.fechaCreacion }</h3>


<div class="row">
	<div class="col-xl-3 col-sm-6 mb-3">
		<div class="card text-white bg-primary o-hidden h-100">
			<div class="card-body">
				<div class="card-body-icon">
					<i class="fab fa-youtube"></i>
				</div>
				<div class="mr-5">Videos propios</div>
			</div>
			<a class="card-footer text-white clearfix small z-1"
				href="frontoffice/videos"> <span class="float-left">Ver
					listado</span> <span class="float-right"> <i
					class="fas fa-angle-right"></i>
			</span>
			</a>
		</div>
	</div>
	<div class="col-xl-3 col-sm-6 mb-3">
		<div class="card text-white bg-danger o-hidden h-100">
			<div class="card-body">
				<div class="card-body-icon">
					<i class="fas fa-users"></i>
				</div>
				<div class="mr-5">Cambiar contraseña</div>
			</div>
			<a class="card-footer text-white clearfix small z-1"
				href="frontoffice/cambio-contrasenya.jsp"> <span
				class="float-left">Cambiar</span> <span class="float-right">
					<i class="fas fa-angle-right"></i>
			</span>
			</a>
		</div>
	</div>	
	<!-- 
	<div class="col-xl-3 col-sm-6 mb-3">
		<div class="card text-white bg-success o-hidden h-100">
			<div class="card-body">
				<div class="card-body-icon">
					<i class="fas fa-users"></i>
				</div>
				<div class="mr-5">Darse de baja</div>
			</div>
			<a class="card-footer text-white clearfix small z-1"
				href="frontoffice/usuario"> <span
				class="float-left">Baja</span> <span class="float-right">
					<i class="fas fa-angle-right"></i>
			</span>
			</a>
		</div>
	</div>
	-->
	
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary bg-success ml-5" data-toggle="modal" data-target="#eliminar">
			  Darse de baja
			</button>	
				<!-- Modal -->
				<div class="modal fade" id="eliminar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">¿Estas Seguro de darte de baja?</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <p>Cuidado porque operación no es reversible</p>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        	<form action="frontoffice/usuario" method="post">	
									
							<input type="submit" value="Eliminar" class="btn btn-danger btn-block">	
						</form>
				      </div>
				    </div>
				  </div>
				</div>	
</div>







<%@include file="../includes/footer.jsp"%>