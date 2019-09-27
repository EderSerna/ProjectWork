package com.ipartek.formacion.controller.backoffice;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;

import com.ipartek.formacion.controller.ControladorCrud;
import com.ipartek.formacion.controller.pojo.Alert;
import com.ipartek.formacion.model.dao.CategoriaDAO;
import com.ipartek.formacion.model.pojo.Categoria;

/**
 * Servlet implementation class CategoriaController
 */
@WebServlet("/backoffice/categoria")
public class CategoriaController extends ControladorCrud {
	
	private static final long serialVersionUID = 1L;
	
	public static final String VIEW_INDEX = "categoria/index.jsp";
	public static final String VIEW_FORM  = "categoria/formulario.jsp";
	
	private static final CategoriaDAO categoriaDAO = CategoriaDAO.getInstance();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void listar(HttpServletRequest request, HttpServletResponse response) {
		
		ArrayList<Categoria> lista = categoriaDAO.getAll();;
		request.setAttribute("categorias", lista);
		view = VIEW_INDEX;
		
	}


	@Override
	protected void guardar(HttpServletRequest request, HttpServletResponse response) {
		String sid = request.getParameter("id");
		String nombre = request.getParameter("nombre");

		Categoria c = new Categoria();
		c.setId(Integer.parseInt(sid));
		c.setNombre(nombre);

		Set<ConstraintViolation<Categoria>> violations = validator.validate(c);
		if (violations.isEmpty()) {

			try {
				if (c.getId() == -1) {
					categoriaDAO.crear(c);
				} else {
					categoriaDAO.modificar(c);
				}
				request.setAttribute("mensaje", new Alert("success", "Registro creado con exito"));

			} catch (Exception e) {

				request.setAttribute("mensaje", new Alert("danger", "Tenemos un problema, el nombre <b>"+ nombre +"</b> ya existe"));
			}

		} else { // hay violaciones de las validaciones

			String mensaje = "";

			for (ConstraintViolation<Categoria> violation : violations) {
				mensaje += violation.getPropertyPath() + ": " + violation.getMessage() + "<br>";
			}
			request.setAttribute("mensaje", new Alert("warning", mensaje));
		}
		request.setAttribute("categoriaEditar", c);
		
		
		view = VIEW_FORM;

		
	}

	@Override
	protected void buscar(HttpServletRequest request, HttpServletResponse response) {
		String buscar = request.getParameter("buscar");
		request.setAttribute("categorias", categoriaDAO.getAllByName(buscar));
		view = VIEW_INDEX;
		
	}

	@Override
	protected void mostrarFormulario(HttpServletRequest request, HttpServletResponse response) {
		String sid = request.getParameter("id");
		Categoria c = new Categoria();
		if (sid !=null) {
			int id = Integer.parseInt(sid);
			c.setId(id);
		}
		
		if(c.getId() == -1) {
			request.setAttribute("categoriaEditar", c);
			view = VIEW_FORM;
		}else {
			int id = Integer.parseInt(sid);
			c = categoriaDAO.getById(id);
			request.setAttribute("categoriaEditar", c);
			view = VIEW_FORM;
		}
		
	}

	@Override
	protected void eliminar(HttpServletRequest request, HttpServletResponse response) {
		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);

		if (categoriaDAO.eliminar(id)) {
			request.setAttribute("mensaje", new Alert("success", "Registro Eliminado"));
		} else {
			request.setAttribute("mensaje", new Alert("danger", "ERROR, no se pudo eliminar"));
		}

		listar(request, response);
		
	}

}
