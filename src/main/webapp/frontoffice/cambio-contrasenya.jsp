<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>
<%@include file="../includes/mensaje.jsp"%>




<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<h1>Cambiar Contrase�a</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6 col-sm-offset-3">
			<p class="text-center">Usa el formulario para cambiar tu
				contrase�a.</p>
			<form action="cambioContrasenya" method="post" id="passwordForm">
				<input type="password" class="input-lg form-control"
					name="contrasenya1" id="contrasenya1" placeholder="Nueva Contrase�a"
					autocomplete="off"> <input type="password"
					class="input-lg form-control" name="contrasenya2" id="contrasenya2"
					placeholder="Repetir contrase�a" autocomplete="off">
				<input type="submit"
					class="col-xs-12 btn btn-primary btn-load btn-lg"
					data-loading-text="Cambiando contrase�a..." value="Cambiar contrase�a">
			</form>
		</div>
		<!--/col-sm-6-->
	</div>
	<!--/row-->
</div>




<%@include file="../includes/footer.jsp"%>