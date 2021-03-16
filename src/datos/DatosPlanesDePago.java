package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import entidades.*;
import logic.AutoLogic;
import logic.PlanDePagoLogic;
import logic.UsuarioLogic;

public class DatosPlanesDePago {
	
	public LinkedList<PlanDePago> getAll() throws SQLException{
		LinkedList<PlanDePago> planes = new LinkedList<>();
		PlanDePago plan = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM planesDePago");
			rs = stmt.executeQuery();
			
			if(rs != null) {
				while(rs.next()) {
					plan = new PlanDePago();
					
					plan.setIdPlan(rs.getInt("idPlan"));
					plan.setNombrePlan(rs.getString("nombrePlan"));
					plan.setEntidadCrediticia(rs.getString("entidadCrediticia"));
					plan.setNombreTarjeta(rs.getString("nombreTarjeta"));
					plan.setCantCuotas(rs.getInt("cantCuotas"));
					
					planes.add(plan);
				}
			}
		}catch(Exception ex) {
			throw ex;
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			}catch(SQLException e) {
				throw e;
			}
		}
		return planes;
	}
	public LinkedList<Alquiler> getSoloPlanes(String nomPlan, String entCred, String nomTar) throws SQLException{ //ESTE METODO SE USA PARA BuscaCliEnPlanes.jsp
		LinkedList<Alquiler> alquileres= new LinkedList<>();
		Alquiler alq= null;
		AutoLogic al = null;
		UsuarioLogic ul = null;
		PlanDePagoLogic pl = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("select * from alquileres WHERE idPlan in (SELECT pdp.idPlan from planesDePago pdp where pdp.nombrePlan like ? AND pdp.entidadCrediticia like ? AND pdp.nombreTarjeta like ?)");
			
			stmt.setString(1, nomPlan);
			stmt.setString(2, entCred);
			stmt.setString(3, nomTar);
			
			rs = stmt.executeQuery();
			
			if(rs != null) {
				while(rs.next()) {
					alq = new Alquiler();
					al = new AutoLogic();
					ul = new UsuarioLogic();
					pl = new PlanDePagoLogic();
					alq.setIdAlquiler(rs.getInt("idAlquiler"));
					alq.setAuto(al.getOne(rs.getString("patente")));
					alq.setUsuario(ul.getOne(rs.getString("cuil")));
					alq.setPlan(pl.getOne(Integer.parseInt(rs.getString("idPlan"))));
					
					alquileres.add(alq);
					
				}
			}
		}catch(Exception ex) {
			throw ex;
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			}catch(SQLException e) {
				throw e;
			}
		}
		return alquileres;
	}
	public LinkedList<PlanDePago> getBancos() throws SQLException{
		LinkedList<PlanDePago> planes = new LinkedList<>();
		PlanDePago plan = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT DISTINCT entidadCrediticia FROM planesDePago");
			rs = stmt.executeQuery();
			
			if(rs != null) {
				while(rs.next()) {
					plan = new PlanDePago();
					
					plan.setEntidadCrediticia(rs.getString("entidadCrediticia"));
					
					planes.add(plan);
				}
			}
		}catch(Exception ex) {
			throw ex;
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			}catch(SQLException e) {
				throw e;
			}
		}
		return planes;
	}
	public LinkedList<PlanDePago> getTarjetas() throws SQLException{
		LinkedList<PlanDePago> planes = new LinkedList<>();
		PlanDePago plan = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT DISTINCT nombreTarjeta FROM planesDePago");
			rs = stmt.executeQuery();
			
			if(rs != null) {
				while(rs.next()) {
					plan = new PlanDePago();
					
					plan.setNombreTarjeta(rs.getString("nombreTarjeta"));
					
					planes.add(plan);
				}
			}
		}catch(Exception ex) {
			throw ex;
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			}catch(SQLException e) {
				throw e;
			}
		}
		return planes;
	}
	public PlanDePago getOne(int idPlan) throws SQLException{
		PlanDePago plan = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM planesDePago WHERE idPlan=?");
			stmt.setInt(1, idPlan);
			rs = stmt.executeQuery();
			
			if(rs != null && rs.next()) {
					plan = new PlanDePago();
					
					plan.setIdPlan(rs.getInt("idPlan"));
					plan.setNombrePlan(rs.getString("nombrePlan"));
					plan.setEntidadCrediticia(rs.getString("entidadCrediticia"));
					plan.setNombreTarjeta(rs.getString("nombreTarjeta"));
					plan.setCantCuotas(rs.getInt("cantCuotas"));
					
			}
		}catch(Exception ex) {
			throw ex;
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			}catch(SQLException e) {
				throw e;
			}
		}
		return plan;
	}
	public int getId(String entidad, String tarjeta, int cuotas) throws SQLException{
		//PlanDePago plan = null; 
		PreparedStatement stmt=null;
		ResultSet rs=null;
		int num = 0;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT idPlan FROM planesDePago WHERE entidadCrediticia=? and nombreTarjeta=? and cantCuotas=?");
			stmt.setString(1, entidad);
			stmt.setString(2, tarjeta);
			stmt.setInt(3, cuotas);
			rs = stmt.executeQuery();
			
			if(rs != null && rs.next()) {
					//plan = new PlanDePago();
					
					num = rs.getInt("idPlan");
					
					
			}
		}catch(Exception ex) {
			throw ex;
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			}catch(SQLException e) {
				throw e;
			}
		}
		return num;
	}
	public void addPlan(PlanDePago plan) throws SQLException {
		PreparedStatement stmt=null;
		ResultSet keyResultSet=null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO planesDePago (nombrePlan, entidadCrediticia, nombreTarjeta, cantCuotas) VALUES (?,?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setString(1, plan.getNombrePlan());
			stmt.setString(2, plan.getEntidadCrediticia());
			stmt.setString(3, plan.getNombreTarjeta());
			stmt.setInt(4, plan.getCantCuotas());
			stmt.executeUpdate();
			keyResultSet = stmt.getGeneratedKeys();
			if(keyResultSet!=null && keyResultSet.next()) {
				plan.setIdPlan(keyResultSet.getInt(1));
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
	public void updatePlan(PlanDePago plan) throws SQLException{
		PreparedStatement stmt = null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("UPDATE planesDePago SET nombrePlan=?, entidadCrediticia=?, nombreTarjeta=?, cantCuotas=? WHERE idPlan=?");
			stmt.setString(1, plan.getNombrePlan());
			stmt.setString(2, plan.getEntidadCrediticia());
			stmt.setString(3, plan.getNombreTarjeta());
			stmt.setInt(4, plan.getCantCuotas());
			stmt.setInt(5, plan.getIdPlan());
			stmt.executeUpdate();
		}catch (SQLException e) {
            throw e;
		}finally {
			try {
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
	}
	public void deletePlan(int idPlan)throws SQLException{
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("DELETE from planesDePago where idPlan=?");
			stmt.setInt(1,idPlan);
			
			stmt.executeUpdate();
		}
		catch (SQLException e) {
            //e.printStackTrace();
			throw e;
		}finally {
			try {
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
	
	}
}
