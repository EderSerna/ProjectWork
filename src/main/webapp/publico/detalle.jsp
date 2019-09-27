<%@page import="com.ipartek.formacion.controller.publico.InicioController"%>

<%@include file="../../includes/header.jsp"%>
<%@include file="../../includes/navbar.jsp"%>

	<h1>Detalle Video</h1>
	<div class="row">
		<div class="col">
		
			<%@include file="../../includes/mensaje.jsp"%>
			
			<form action="inicio" method="post" class="mb-2">			

				<div class="form-group">
					<label for="nombre">Nombre:</label>
					<input type="text" name="nombre" value="${video.nombre}" readonly class="form-control">
				</div>
				
				<div class="form-group">
					<label for="categoria_id">Categoria:</label>
					  		<input type="text" name="nombre" value="${video.categoria.nombre}" readonly class="form-control">					  	
			  
				</div>	
								
				<div class="form-group">
					<label for="usuario_id">Usuario:</label>
												
							<% //modificar video %>
							<c:if test="${video.id != -1}">				  				  
						  			<input type="text" name="nombre" value="${video.usuario.nombre}" readonly class="form-control">					  		
						  	</c:if>	
					  
						    <% //nuevo video %>
						 	<c:if test="${video.id == -1}">					  						  
						  			<input type="text" name="nombre" value="${video.usuario.nombre}" readonly class="form-control">					  		
						  	</c:if>
				</div>	
				<div class="form-group">
					<label for="categoria_id">Likes:</label>
					  		<input type="text" name="nombre" value="${video.likes}" readonly class="form-control">					  	
			  
				</div>							
			</form>
			
			
			
			
			
			
			
			
			
		</div>
		<div class="col">	
		
			<div class="embed-responsive embed-responsive-16by9">
		
				<iframe class="embed-responsive-item"
				        src="https://www.youtube.com/embed/${video.codigo}" 
				        frameborder="0" 
				        allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
				        allowfullscreen></iframe>
			</div>        
		</div>
	</div>
	
<%@include file="../../includes/footer.jsp"%>