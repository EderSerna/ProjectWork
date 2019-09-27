package com.ipartek.formacion.controller.frontoffice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ipartek.formacion.controller.pojo.Alert;
import com.ipartek.formacion.model.dao.UsuarioDAO;
import com.ipartek.formacion.model.pojo.Usuario;

/**
 * Servlet implementation class UsuarioFrontofficeController
 */
@WebServlet("/frontoffice/usuario")
public class UsuarioFrontofficeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static UsuarioDAO usuarioDAO = UsuarioDAO.getInstance();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UsuarioFrontofficeController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		int idUsuario = usuario.getId();

		// comprobar que el id de session y el que se va a borrar son el mismo
		if (idUsuario == usuarioDAO.getById(idUsuario).getId()) {
			// baja logica
			usuarioDAO.delete(idUsuario);
			session.setAttribute("mensaje", new Alert("success", "El usuario se ha dado de baja correctamente"));
			response.sendRedirect(request.getContextPath() + "/inicio");

		} else {
			session.setAttribute("mensaje", new Alert("danger", "No puedes dar de baja a otros usuarios"));
			response.sendRedirect(request.getContextPath() + "/frontoffice/index.jsp");
		}

	}

}
