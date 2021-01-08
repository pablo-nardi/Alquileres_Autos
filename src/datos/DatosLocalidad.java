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
			
			while(rs!=null&&rs.next()) {
				local = new Localidad();
				
				local.setCodigoPostal(rs.getInt("codigoPostal"));
				local.setDenominacion(rs.getString("denominacion"));
				local.setProvincia(dp.getOne(idProv));
				
				localidades.add(local);
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
}
