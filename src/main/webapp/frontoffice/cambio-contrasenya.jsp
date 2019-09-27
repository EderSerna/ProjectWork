<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
<%@include file="../includes/mensaje.jsp"%>




<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<h1>Cambiar Contraseña</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6 col-sm-offset-3">
			<p class="text-center">Usa el formulario para cambiar tu
				contraseña.</p>
			<form action="cambioContrasenya" method="post" id="passwordForm">
				<input type="password" class="input-lg form-control"
					name="contrasenya1" id="contrasenya1" placeholder="Nueva Contraseña"
					autocomplete="off"> <input type="password"
					class="input-lg form-control" name="contrasenya2" id="contrasenya2"
					placeholder="Repetir contraseña" autocomplete="off">
				<input type="submit"
					class="col-xs-12 btn btn-primary btn-load btn-lg"
					data-loading-text="Cambiando contraseña..." value="Cambiar contraseña">
			</form>
		</div>
		<!--/col-sm-6-->
	</div>
	<!--/row-->
</div>




<%@include file="../includes/footer.jsp"%>