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
}
