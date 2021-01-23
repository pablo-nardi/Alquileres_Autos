package datos;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import entidades.*;


public class DatosLocalidad {
	
	public LinkedList<Localidad> getLocalidades(int idProv){
		LinkedList<Localidad> localidades = new LinkedList<>();
		Localidad local = null;
		DatosProvincia dp = new DatosProvincia();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM localidades WHERE idProvincia=?");
			stmt.setInt(1, idProv);
			rs = stmt.executeQuery();
			
			if(rs!=null) {
				while(rs.next()) {
					local = new Localidad();
					
					local.setCodigoPostal(rs.getInt("codigoPostal"));
					local.setDenominacion(rs.getString("denominacion"));
					local.setProvincia(dp.getOne(idProv));
					
					localidades.add(local);
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return localidades;
	}
	public Localidad getOne(int id)throws SQLException {
		Localidad localidad = null;
		DatosProvincia dp = new DatosProvincia();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM localidades where codigoPostal=?");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			
			if (rs!=null && rs.next()) {
				localidad = new Localidad();
				localidad.setCodigoPostal(rs.getInt("codigoPostal"));
				localidad.setDenominacion(rs.getString("denominacion"));
				localidad.setProvincia(dp.getOne(rs.getInt("idProvincia")));
			}			
		}catch(Exception e) {
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
		
		
		return localidad;
	}
	public void addLocalidad(Localidad loc) throws SQLException{
		PreparedStatement stmt=null;
		try {
stmt=DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO localidades (codigoPostal, denominacion, idProvincia) VALUES (?,?,?)");
			stmt.setInt(1, loc.getCodigoPostal());
			stmt.setString(2, loc.getDenominacion());
			stmt.setInt(3, loc.getProvincia().getIdProvincia());
			stmt.executeUpdate();
		}catch(SQLException e) {
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
	public void updateLocalidad(Localidad loc)throws SQLException{
		PreparedStatement stmt = null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("UPDATE localidades SET denominacion=?, idProvincia=? WHERE codigoPostal=?");
			stmt.setString(1, loc.getDenominacion());
			stmt.setInt(2, loc.getProvincia().getIdProvincia());
			stmt.setInt(3, loc.getCodigoPostal());
			
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
	public void deleteLocalidad(int idLoc)throws SQLException{
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("DELETE from localidades where codigoPostal=?");
			stmt.setInt(1,idLoc);
			
			stmt.executeUpdate();
		}
		catch (SQLException e) {
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
