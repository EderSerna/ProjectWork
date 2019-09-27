package com.ipartek.formacion.controller.frontoffice;

import java.io.IOException;
import java.sql.SQLException;

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
 * Servlet implementation class CambioContrasenyaController
 */
@WebServlet("/cambioContrasenya")
public class CambioContrasenyaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static UsuarioDAO usuarioDAO = UsuarioDAO.getInstance();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CambioContrasenyaController() {
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

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String contrasenya1 = request.getParameter("contrasenya1");
		String contrasenya2 = request.getParameter("contrasenya2");

		HttpSession session = request.getSession();
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		int idUsuario = usuario.getId();

		// comprobar que las passwords son iguales
		if (contrasenya1.equals(contrasenya2)) {
			try {
				usuarioDAO.cambiarContrasenya(idUsuario, contrasenya1);
				// request.setAttribute("mensaje", new Alert("success", "La contraseña ha sido
				// cambiada correctamente"));
				// pasamos el mensaje por session porque si no lo pierde al hacer la redireccion
				session.setAttribute("mensaje", new Alert("success", "La contraseña ha sido cambiada correctamente"));
			} catch (SQLException e) {
				// e.printStackTrace();
				session.setAttribute("mensaje",
						new Alert("danger", "Lo sentimos pero no se puede cambiar la contraseña"));
			}

			response.sendRedirect("frontoffice/index.jsp");
		} else {
			session.setAttribute("mensaje", new Alert("danger", "Las contraseñas deben coincidir"));
			response.sendRedirect("frontoffice/cambio-contrasenya.jsp");
		}

	}

}
