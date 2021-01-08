package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

//import com.mysql.cj.protocol.Resultset;

import entidades.*;



public class DatosAutos {
	
	public LinkedList<Auto> getAutosFromSucursal(int idSuc){
	
		LinkedList<Auto> autos = new LinkedList<>();
		Auto auto = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM autos WHERE idSucursal=?");
			stmt.setInt(1, idSuc);
			rs = stmt.executeQuery();
			
			if(rs != null && rs.next()) {
				auto = new Auto();
				auto.setPatente(rs.getString("patente"));
				auto.setEstado(Auto.Estado.valueOf(rs.getString("estado")));
				auto.setCapacidadDelTanque(rs.getFloat("capacidadTanque"));
				auto.setKilometraje(rs.getFloat("kilometraje"));
				//FALTA TERMINAR
				
			}
		}catch(Exception ex) {
			
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return autos;		
	}
	
	
}
