package com.ipartek.formacion.controller.frontoffice;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;

import com.ipartek.formacion.controller.pojo.Alert;
import com.ipartek.formacion.model.dao.CategoriaDAO;
import com.ipartek.formacion.model.dao.UsuarioDAO;
import com.ipartek.formacion.model.dao.VideoDAO;
import com.ipartek.formacion.model.pojo.Usuario;
import com.ipartek.formacion.model.pojo.Video;

/**
 * Servlet implementation class VideoController
 */
@WebServlet("/frontoffice/videos")
public class VideoFrontofficeController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public static final String VIEW_INDEX = "youtube/index.jsp";
	public static final String VIEW_FORM = "youtube/formulario.jsp";
	public static String view = VIEW_INDEX;

	public static final String OP_LISTAR = "0";
	public static final String OP_GUARDAR = "23";
	public static final String OP_NUEVO = "4";
	public static final String OP_ELIMINAR = "hfd3";
	public static final String OP_DETALLE = "13";

	private static VideoDAO videoDAO;
	private static UsuarioDAO usuarioDAO;
	private static CategoriaDAO categoriaDAO;

	private Validator validator;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		videoDAO = VideoDAO.getInstance();
		usuarioDAO = UsuarioDAO.getInstance();
		categoriaDAO = CategoriaDAO.getInstance();
		validator = Validation.buildDefaultValidatorFactory().getValidator();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String op = request.getParameter("op");
		if (op == null) {
			op = OP_LISTAR;
		}

		switch (op) {
		case OP_DETALLE:
			detalle(request, response);
			break;

		case OP_GUARDAR:
			guardar(request, response);
			break;

		case OP_ELIMINAR:
			eliminar(request, response);
			break;

		case OP_NUEVO:
			nuevo(request, response);
			break;

		default:
			listar(request, response);
			break;
		}

		request.getRequestDispatcher(view).forward(request, response);
	}

	private void nuevo(HttpServletRequest request, HttpServletResponse response) {

		request.setAttribute("video", new Video());
		request.setAttribute("usuarios", usuarioDAO.getAll());
		request.setAttribute("categorias", categoriaDAO.getAll());

		view = VIEW_FORM;
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) {
		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);

		HttpSession session = request.getSession();
		Usuario user = (Usuario) session.getAttribute("usuario");
		int idUsuario = user.getId();
		// comprobacion de que el usuario solo puede borrar sus propios videos
		if (!videoDAO.videoPertenece(id, idUsuario)) {
			request.setAttribute("mensaje", new Alert("danger", "Estas intentando eliminar un video de otro usuario"));
		} else {
			if (videoDAO.delete(id)) {
				request.setAttribute("mensaje", new Alert("success", "Registro Eliminado"));
			} else {
				request.setAttribute("mensaje", new Alert("danger", "ERROR, no se pudo eliminar"));
			}

		}
		listar(request, response);
	}

	private void guardar(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		String nombre = request.getParameter("nombre");
		String codigo = request.getParameter("codigo");
		int idVideo = Integer.parseInt(request.getParameter("id"));
		int idCategoria = Integer.parseInt(request.getParameter("categoria_id"));

		Usuario usuario = (Usuario) session.getAttribute("usuario");
		int idUsuario = usuario.getId();

		Video v = new Video();
		v.setId(idVideo);
		v.setNombre(nombre);
		v.setCodigo(codigo);

		Set<ConstraintViolation<Video>> violations = validator.validate(v);
		if (violations.isEmpty()) {

			try {
				if (v.getId() == -1) {
					videoDAO.crear(v, idUsuario, idCategoria);
					idVideo = v.getId();
				} else {
					// comprobacion para para que el usuario solo pueda modificar sus propios videos
					if (videoDAO.videoPertenece(v.getId(), idUsuario)) {
						videoDAO.modificar(v, idUsuario, idCategoria);
						request.setAttribute("mensaje", new Alert("success", "Registro creado con exito"));
					} else {
						request.setAttribute("mensaje",
								new Alert("danger", "No puedes modificar un video de otro usuario"));
					}
				}
			} catch (Exception e) {

				request.setAttribute("mensaje", new Alert("danger", "Tenemos un problema, el codigo ya existe"));
			}

		} else { // hay violaciones de las validaciones

			String mensaje = "";

			for (ConstraintViolation<Video> violation : violations) {
				mensaje += violation.getPropertyPath() + ": " + violation.getMessage() + "<br>";
			}
			request.setAttribute("mensaje", new Alert("warning", mensaje));
		}
		request.setAttribute("video", videoDAO.getById(idVideo));
		request.setAttribute("categorias", categoriaDAO.getAll());

		view = VIEW_FORM;
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) {
		// lista los videos del usuario registrado, pillamos el de session
		HttpSession session = request.getSession();
		Usuario user = (Usuario) session.getAttribute("usuario");
		// pillar los likes del usuario
		int numLikes = 0;
		ArrayList<Video> videos = videoDAO.getAllByUser(user.getId());
		for (int i = 0; i < videos.size(); i++) {
			numLikes = numLikes + videos.get(i).getLikes();
		}

		request.setAttribute("numLikes", numLikes);
		request.setAttribute("videosUsuario", videos);
		view = VIEW_INDEX;

	}

	private void detalle(HttpServletRequest request, HttpServletResponse response) {
		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);

		Video v = videoDAO.getById(id);
		request.setAttribute("video", v);
		request.setAttribute("categorias", categoriaDAO.getAll());
		view = VIEW_FORM;
	}

}
