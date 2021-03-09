package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import entidades.*;
import logic.*;


public class DatosAlquiler {
	public void addAlquiler(Alquiler alq) throws SQLException {
		PreparedStatement stmt=null;
		ResultSet keyResultSet=null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO alquileres (costoDesperfecto, costoDevolucionTardia, precioDiario, estado, fecRetiroPrevista, fecDevPrevista, idModelo, idSucursal, cuil, idPlan, patente) VALUES (?,?,?,?,?,?,?,?,?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setDouble(1, alq.getCostoDesperfecto());
			stmt.setDouble(2, alq.getCostoDevolucionTardia());
			stmt.setDouble(3, alq.getPrecioDiario());
			stmt.setString(4, alq.getEstado().toString());
			stmt.setDate(5, alq.getFecRetiroPrevisto());
			stmt.setDate(6, alq.getFecDevPrevista());
			stmt.setInt(7, alq.getModelo().getIdentificacion());
			stmt.setInt(8, alq.getSucursal().getIdSucursal());
			stmt.setString(9, alq.getUsuario().getCuil());
			stmt.setInt(10, alq.getPlan().getIdPlan());
			stmt.setString(11, alq.getAuto().getPatente());
			stmt.executeUpdate();
			keyResultSet = stmt.getGeneratedKeys();
			if(keyResultSet!=null && keyResultSet.next()) {
				alq.setIdAlquiler(keyResultSet.getInt(1));
			}
		}catch(SQLException e) {
			throw e;
		}finally {
			try {
				if(keyResultSet!=null) {keyResultSet.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
	}
	public LinkedList<Alquiler> buscarAlquiler(String cuil) throws SQLException{
		Alquiler alq = null;
		ModeloLogic ml = null;
		UsuarioLogic ul = null;
		SucursalLogic sl = null;
		PlanDePagoLogic pl = null;
		LinkedList<Alquiler> alquileres = new LinkedList<>();
		
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM alquileres WHERE cuil=? and estado=? order by fecRetiroPrevista");
			stmt.setString(1, cuil);
			stmt.setString(2, "reservado");
			rs = stmt.executeQuery();
			
			if(rs != null) {
				while(rs.next()) {
					alq = new Alquiler();
					sl = new SucursalLogic();
					pl = new PlanDePagoLogic();
					ml = new ModeloLogic();
					ul = new UsuarioLogic();
					
					alq.setIdAlquiler(rs.getInt("idAlquiler"));
					alq.setCostoDesperfecto(rs.getDouble("costoDesperfecto"));
					alq.setCostoDevolucionTardia(rs.getDouble("costoDevolucionTardia"));
					alq.setPrecioDiario(rs.getDouble("precioDiario"));
					alq.setEstado(Alquiler.Estado.valueOf(rs.getString("estado")));
					alq.setFecDevPrevista(rs.getDate("fecDevPrevista"));
					alq.setFecRetiroPrevisto(rs.getDate("fecRetiroPrevista"));
					alq.setModelo(ml.getOne(Integer.parseInt(rs.getString("idModelo"))));
					alq.setPlan(pl.getOne(Integer.parseInt(rs.getString("idPlan"))));
					alq.setSucursal(sl.getOne(Integer.parseInt(rs.getString("idSucursal"))));
					alq.setUsuario(ul.getOne(rs.getString("cuil")));
					
					alquileres.add(alq);
				}
			}			
			
		}catch(SQLException e) {
			throw e;
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
		
		
		
		return alquileres;
	}
	public Alquiler getAlquiler(int id) throws SQLException{
		Alquiler alq = null;
		ModeloLogic ml = null;
		UsuarioLogic ul = null;
		SucursalLogic sl = null;
		PlanDePagoLogic pl = null;
		
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM alquileres WHERE idAlquiler=?");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			
			if(rs != null && rs.next()) {
				
					alq = new Alquiler();
					sl = new SucursalLogic();
					pl = new PlanDePagoLogic();
					ml = new ModeloLogic();
					ul = new UsuarioLogic();
					
					alq.setIdAlquiler(rs.getInt("idAlquiler"));
					alq.setCostoDesperfecto(rs.getDouble("costoDesperfecto"));
					alq.setCostoDevolucionTardia(rs.getDouble("costoDevolucionTardia"));
					alq.setPrecioDiario(rs.getDouble("precioDiario"));
					alq.setEstado(Alquiler.Estado.valueOf(rs.getString("estado")));
					alq.setFecDevPrevista(rs.getDate("fecDevPrevista"));
					alq.setFecRetiroPrevisto(rs.getDate("fecRetiroPrevista"));
					alq.setModelo(ml.getOne(Integer.parseInt(rs.getString("idModelo"))));
					alq.setPlan(pl.getOne(Integer.parseInt(rs.getString("idPlan"))));
					alq.setSucursal(sl.getOne(Integer.parseInt(rs.getString("idSucursal"))));
					alq.setUsuario(ul.getOne(rs.getString("cuil")));
					
					
				
			}			
			
		}catch(SQLException e) {
			throw e;
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
		
		
		
		return alq;
	}
}
