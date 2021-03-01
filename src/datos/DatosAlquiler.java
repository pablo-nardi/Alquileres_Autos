package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entidades.*;


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
}
