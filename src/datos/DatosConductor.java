package datos;


import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entidades.*;

public class DatosConductor {
	

	public boolean buscar(String dni) throws SQLException{
		PreparedStatement stmt=null;
		ResultSet rs=null;
		boolean estado = false;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("select * from conductores where dni=?");
			stmt.setString(1, dni);
			rs=stmt.executeQuery();
			
			if(rs!=null && rs.next()){
				estado = true;
			}
			
			
		}catch (SQLException e) {
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
		return estado;
	}
	public void addConductor (Conductor con) throws SQLException{
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("insert into conductores (dni, nombreApellido, fecNac, numLicencia, fecLicencia, celular, mail) VALUES (?,?,?,?,?,?,?)");
			
			stmt.setString(1, con.getDni());
			stmt.setString(2,con.getNombreApellido());
			stmt.setDate(3, con.getFecNac());
			stmt.setString(4, con.getNumLicencia());
			stmt.setDate(5, con.getFecLic());
			stmt.setString(6, con.getCelular());
			stmt.setString(7, con.getMail());
			
			stmt.executeUpdate();
			
		}catch (SQLException e) {
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
	}
	
	public void updateConductor(Conductor con) throws SQLException{
		PreparedStatement stmt=null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("UPDATE conductores SET nombreApellido=?, fecNac=?, numLicencia=?, fecLicencia=?, celular=?, mail=? WHERE dni=?");
			
			
			stmt.setString(1,con.getNombreApellido());
			stmt.setDate(2, con.getFecNac());
			stmt.setString(3, con.getNumLicencia());
			stmt.setDate(4, con.getFecLic());
			stmt.setString(5, con.getCelular());
			stmt.setString(6, con.getMail());
			stmt.setString(7, con.getDni());
			
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
	
	/////////////////////////////
	
	// CARGO LA TABLA ALQUILER_CONDUCTOR
	
	public void addAlqCon (AlquilerConductor alqCon) throws SQLException{
		PreparedStatement stmt=null;
		ResultSet keyResultSet=null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("insert into alquiler_conductor (dni, id_alquiler) VALUES (?,?)", PreparedStatement.RETURN_GENERATED_KEYS);
			
			stmt.setString(1, alqCon.getDni());
			stmt.setInt(2, alqCon.getIdAlquiler());
			
			stmt.executeUpdate();
			keyResultSet = stmt.getGeneratedKeys();
			if(keyResultSet!=null && keyResultSet.next()) {
				alqCon.setId(keyResultSet.getInt(1));
			}
			
		}catch (SQLException e) {
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
	
	
	
	
	
	
	
	
	
	
	
	
	
}
