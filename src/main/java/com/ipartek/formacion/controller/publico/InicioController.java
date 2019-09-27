package com.ipartek.formacion.controller.publico;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Validation;
import javax.validation.Validator;

import com.ipartek.formacion.model.dao.CategoriaDAO;
import com.ipartek.formacion.model.dao.UsuarioDAO;
import com.ipartek.formacion.model.dao.VideoDAO;
import com.ipartek.formacion.model.pojo.Video;

/**
 * Servlet implementation class InicioController
 */
@WebServlet("/inicio")
public class InicioController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InicioController() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static final String VIEW_INDEX = "index.jsp";
	public static final String VIEW_DETALLE = "publico/detalle.jsp";
	public static String view = VIEW_INDEX;

	public static final String OP_DETALLE = "op01de";
	public static final String OP_BUSCAR = "op02bu";

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
		ArrayList<Video> misVideos = new ArrayList<Video>();
		misVideos = videoDAO.getAllVisible(true);
		String op = request.getParameter("op");
		if (OP_DETALLE.equals(op)) {
			detalle(request, response);
		} else {
			listar(request, response);
		}

		request.getRequestDispatcher(view).forward(request, response);
	}

	private void detalle(HttpServletRequest request, HttpServletResponse response) {

		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);

		Video v = videoDAO.getById(id);
		request.setAttribute("video", v);

		request.setAttribute("usuarios", usuarioDAO.getAll());
		request.setAttribute("categorias", categoriaDAO.getAll());

		view = VIEW_DETALLE;

		HttpSession session = request.getSession();
		HashMap<Integer, Video> videosVistos = (HashMap<Integer, Video>) session.getAttribute("videosVistos");
		if (videosVistos == null) {
			videosVistos = new HashMap<Integer, Video>();
		}
		videosVistos.put(v.getId(), v);
		session.setAttribute("videosVistos", videosVistos);

	}

	private void listar(HttpServletRequest request, HttpServletResponse response) {

		request.setAttribute("videosVisibles", videoDAO.getAllVisible(true));
		view = VIEW_INDEX;

	}

}
