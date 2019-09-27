package com.ipartek.formacion.model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

import com.ipartek.formacion.model.ConnectionManager;
import com.ipartek.formacion.model.pojo.Categoria;

public class CategoriaDAO {

	private static CategoriaDAO INSTANCE = null;

	private static final String SQL_GET_ALL = "SELECT id,nombre FROM categoria ORDER BY id DESC LIMIT 500;";
	private static final String RUN_GET_ALL = "{ call categoriaGetAll() }";
	private static final String RUN_GET_BY_ID = "{ call categoriaGetById(?) }";
	private static final String RUN_DELETE = "{ call categoriaDelete(?) }";
	private static final String RUN_INSERT = "{ call categoriaInsert(?,?) }";
	private static final String RUN_UPDATE = "{ call categoriaUpdate(?,?) }";
	private static final String SQL_GET_BY_NAME = "SELECT id, nombre FROM categoria WHERE nombre LIKE ? ORDER BY id ASC LIMIT 500;";
	
	private CategoriaDAO() {
		super();
	}

	public static synchronized CategoriaDAO getInstance() {

		if (INSTANCE == null) {
			INSTANCE = new CategoriaDAO();
		}

		return INSTANCE;

	}

	/*
	 * public ArrayList<Categoria> getAll() {
	 * 
	 * ArrayList<Categoria> lista = new ArrayList<Categoria>();
	 * 
	 * try (Connection con = ConnectionManager.getConnection(); PreparedStatement
	 * pst = con.prepareStatement(SQL_GET_ALL); ResultSet rs = pst.executeQuery()) {
	 * 
	 * while (rs.next()) { lista.add(mapper(rs)); }
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); }
	 * 
	 * return lista; }
	 */

	public ArrayList<Categoria> getAll() {

		ArrayList<Categoria> lista = new ArrayList<Categoria>();

		try (Connection con = ConnectionManager.getConnection();
				CallableStatement cst = con.prepareCall(RUN_GET_ALL);
				ResultSet rs = cst.executeQuery()) {

			while (rs.next()) {
				lista.add(mapper(rs));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lista;
	}

	public Categoria getById(int id) {
		Categoria categoria = new Categoria();

		try (Connection con = ConnectionManager.getConnection();
				CallableStatement cst = con.prepareCall(RUN_GET_BY_ID)) {

			// sustituyo la 1º ? por la variable id
			cst.setInt(1, id);

			try (ResultSet rs = cst.executeQuery()) {
				if (rs.next()) {
					categoria = mapper(rs);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return categoria;
	}

	public boolean eliminar(int id) {
		boolean resultado = false;

		try (Connection con = ConnectionManager.getConnection();
				CallableStatement cst = con.prepareCall(RUN_DELETE)) {

			cst.setInt(1, id);

			int affetedRows = cst.executeUpdate();
			if (affetedRows == 1) {
				resultado = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultado;
		
	}
	
	public Categoria crear(Categoria pojo) throws Exception {
		try (Connection con = ConnectionManager.getConnection();
				CallableStatement cst = con.prepareCall(RUN_INSERT)) {
			
			cst.setString(1, pojo.getNombre());
			cst.registerOutParameter(2, Types.INTEGER);
			
			cst.executeUpdate();
			
			int idGenerado = cst.getInt(2);
			pojo.setId(idGenerado);
		}
		return pojo;
	}
	
	
	
	public boolean modificar(Categoria pojo) throws Exception {
		boolean resultado = false;
		try (Connection con = ConnectionManager.getConnection();
				CallableStatement cst = con.prepareCall(RUN_UPDATE);) {

			cst.setString(1, pojo.getNombre());
			cst.setInt(2, pojo.getId());
			
			cst.registerOutParameter(2, Types.INTEGER);

			int affectedRows = cst.executeUpdate();
			if (affectedRows == 1) {
				pojo.setId(cst.getInt(2));
				resultado = true;
			}

		}
		return resultado;
		
	}
	
	public ArrayList<Categoria> getAllByName(String buscar) {
		ArrayList<Categoria> lista = new ArrayList<Categoria>();
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pst = con.prepareStatement(SQL_GET_BY_NAME)) {

			pst.setString(1, '%' + buscar + '%'); // busca todos, los que contengan esa letra/palabra
			// pst.setString(1,buscar + '%'); //busca los que empiecen por esa letra/palabra

			try (ResultSet rs = pst.executeQuery()) {
				while (rs.next()) {
					lista.add(mapper(rs));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return lista;
		
	}
	
	
	private Categoria mapper(ResultSet rs) throws SQLException {
		Categoria c = new Categoria();
		c.setId(rs.getInt("id"));
		c.setNombre(rs.getString("nombre"));
		return c;
	}

}
