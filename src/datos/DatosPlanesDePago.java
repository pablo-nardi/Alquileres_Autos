package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import entidades.*;

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
	public void updateExtra(PlanDePago plan) throws SQLException{
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
	public void deleteExtra(int idPlan)throws SQLException{
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
