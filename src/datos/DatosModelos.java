package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;



import java.sql.*;

import entidades.Modelo;

public class DatosModelos {
	public Modelo getOne(int idModelo) {
		Modelo mod = new Modelo();
		DatosTiposAuto dtp = new DatosTiposAuto();
		PreparedStatement stmt=null;
		ResultSet rs=null;
	
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM modelos where idModelo=?");
			stmt.setInt(1, idModelo);
			rs = stmt.executeQuery();
			
			if(rs != null && rs.next()) {
				mod.setIdentificacion(rs.getInt("idModelo"));
				mod.setCantEquipajeGrande(rs.getInt("cantEquipajeGrande"));
				mod.setCantEquipajeChico(rs.getInt("cantEquipajeChico"));
				mod.setPrecioPorDia(rs.getFloat("precioPorDia"));
				mod.setDenominacion(rs.getString("denominacion"));
				mod.setTransmision(rs.getString("transmision"));
				mod.setAireAcondicionado(rs.getString("aireAcondicionado"));
				//falta la foto
				mod.setCantPasajeros(rs.getInt("cantPasajeros"));
				mod.setTipoAuto(dtp.getOne(rs.getInt("idTipo")));
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
		
		return mod;
	}
	public LinkedList<Modelo> getAll(){
		Statement stmt=null;
		ResultSet rs = null;
		LinkedList<Modelo> modelos = new LinkedList<>();
		
		try {
			stmt = DbConnector.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("select * from modelos");
			
			if(rs != null) {
				while(rs.next()) {
					Modelo mod = new Modelo();
					DatosTiposAuto dtp = new DatosTiposAuto();
					
					mod.setIdentificacion(rs.getInt("idModelo"));
					mod.setCantEquipajeGrande(rs.getInt("cantEquipajeGrande"));
					mod.setCantEquipajeChico(rs.getInt("cantEquipajeChico"));
					mod.setPrecioPorDia(rs.getFloat("precioPorDia"));
					mod.setDenominacion(rs.getString("denominacion"));
					mod.setTransmision(rs.getString("transmision"));
					mod.setAireAcondicionado(rs.getString("aireAcondicionado"));
					//falta la foto
					mod.setCantPasajeros(rs.getInt("cantPasajeros"));
					mod.setTipoAuto(dtp.getOne(rs.getInt("idTipo")));

					
					modelos.add(mod);
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
		return modelos;
	}
	public void addModelos(Modelo mod) {
		PreparedStatement stmt=null;
		ResultSet keyResultSet=null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("insert into modelos (cantEquipajeGrande, cantEquipajeChico, precioPorDia, denominacion, transmision, aireAcondicionado, fotoModelo, cantPasajeros, idTipo) VALUES (?,?,?,?,?,?,?,?,?)",PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, mod.getCantEquipajeGrande());
			stmt.setInt(2, mod.getCantEquipajeChico());
			stmt.setFloat(3, mod.getPrecioPorDia());
			stmt.setString(4, mod.getDenominacion());
			stmt.setString(5, mod.getTransmision());
			stmt.setString(6, mod.getAireAcondicionado());
			stmt.setString(7, null);
			stmt.setInt(8, mod.getCantPasajeros());
			stmt.setInt(9, mod.getTipoAuto().getId_Tipo());
			stmt.executeUpdate();
			keyResultSet = stmt.getGeneratedKeys();
			if(keyResultSet!=null && keyResultSet.next()) {
				mod.setIdentificacion(keyResultSet.getInt(1));
			}
		}catch (SQLException e) {
			e.printStackTrace();
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
	public void update(Modelo mod) {
		PreparedStatement stmt = null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("UPDATE modelos set cantEquipajeGrande=?, cantEquipajeChico=?, precioPorDia=?, denominacion=?, transmision=?, aireAcondicionado=?, fotoModelo=?, cantPasajeros=?, idTipo=? WHERE idModelo=?");
			stmt.setInt(1, mod.getCantEquipajeGrande());
			stmt.setInt(2, mod.getCantEquipajeChico());
			stmt.setFloat(3, mod.getPrecioPorDia());
			stmt.setString(4, mod.getDenominacion());
			stmt.setString(5, mod.getTransmision());
			stmt.setString(6, mod.getAireAcondicionado());
			stmt.setString(7, null);
			stmt.setInt(8, mod.getCantPasajeros());
			stmt.setInt(9, mod.getTipoAuto().getId_Tipo());
			stmt.setInt(10, mod.getIdentificacion());
			
			stmt.executeUpdate();
		}
		catch (SQLException e) {
            e.printStackTrace();
		}finally {
			try {
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void delete(int idModelo) throws SQLException {
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("DELETE from modelos where idModelo=?");
			stmt.setInt(1,idModelo);
			
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
				e.printStackTrace();
			}
		}
	}
}
