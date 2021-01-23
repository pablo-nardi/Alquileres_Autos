package datos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import entidades.*;

public class DatosProvincia {
	
	public LinkedList<Provincia> getAll(){
		LinkedList<Provincia> provincias = new LinkedList<>();
		Provincia prov = null;
		DatosLocalidad dl = new DatosLocalidad();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM provincias");
			rs = stmt.executeQuery();
			
			if(rs != null) {
				while(rs.next()) {
					prov = new Provincia();
					
					prov.setIdProvincia(rs.getInt("idProvincia"));
					prov.setDenominacion(rs.getString("denominacion"));
					prov.setLocalidades(dl.getLocalidades(prov.getIdProvincia()));
					
					provincias.add(prov);
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return provincias;
	}
	public Provincia getOne(int id) {

		Provincia prov = null;
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM provincias WHERE idProvincia=?");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			
			if(rs != null && rs.next()) {
				prov = new Provincia();
				prov.setIdProvincia(rs.getInt("idProvincia"));
				prov.setDenominacion(rs.getString("denominacion"));
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
		
		return prov;
	}
	public void addProvincia(Provincia prov) throws SQLException {
		PreparedStatement stmt=null;
		ResultSet keyResultSet=null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO provincias (denominacion) VALUES (?)", PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setString(1, prov.getDenominacion());
			stmt.executeUpdate();
			keyResultSet = stmt.getGeneratedKeys();
			if(keyResultSet!=null && keyResultSet.next()) {
				prov.setIdProvincia(keyResultSet.getInt(1));
			}
		}catch(SQLException e) {
			throw e;
		}finally {
			try {
				if(keyResultSet!=null) {keyResultSet.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void updateProvincia(Provincia prov) throws SQLException{
		PreparedStatement stmt = null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("UPDATE provincias SET denominacion=? WHERE idProvincia=?");
			stmt.setString(1, prov.getDenominacion());
			
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
	public void deleteProvincia(int idProvincia)throws SQLException{
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("DELETE from provincias where idProvincia=?");
			stmt.setInt(1,idProvincia);
			
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

