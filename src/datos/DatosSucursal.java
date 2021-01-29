package datos;

import entidades.Sucursal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalTime;
import java.util.LinkedList;
import java.sql.Time;
import entidades.Localidad;

public class DatosSucursal {
	public LinkedList<Sucursal> getAll() throws SQLException{
		Sucursal sucursal=null;
		LinkedList<Sucursal> sucursales = new LinkedList<>();
		DatosLocalidad dl = new DatosLocalidad();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM sucursales");
			rs=stmt.executeQuery();
			
			if(rs!=null) {
				while(rs.next()) {
					sucursal = new Sucursal();
					
					sucursal.setDenominacion(rs.getString("denominacion"));
					sucursal.setDireccion(rs.getString("direccion"));
					sucursal.setHoraApertura(LocalTime.parse(String.valueOf(rs.getTime("horaApertura")))); //REVISAR COMO HACER CON LOCALTIME
					sucursal.setHoraCierre(LocalTime.parse(String.valueOf(rs.getTime("horaCierre"))));		//REVISAR COMO HACER CON LOCALTIME
					sucursal.setIdSucursal(rs.getInt("idSucursal"));
					sucursal.setTelefono(rs.getString("telefono"));
					sucursal.setLocalidad(dl.getOne(rs.getInt("codigoPostal")));
					
					sucursales.add(sucursal);
				}
			}
		}catch(Exception ex) {
			throw ex;
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException ex) {
				throw ex;
			}
		}
		
		return sucursales;
	}
	public Sucursal getOne(int idSucursal)throws SQLException {
		Sucursal suc = null;
		DatosLocalidad dl = new DatosLocalidad();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM sucursales where idSucursal=?");
			stmt.setInt(1, idSucursal);
			rs = stmt.executeQuery();
			
			if (rs!=null && rs.next()) {
				suc = new Sucursal();
				
				suc.setDenominacion(rs.getString("denominacion"));
				suc.setDireccion(rs.getString("direccion"));
				//suc.setHoraApertura(rs.getTime("horaApertura"));
				//suc.setHoraCierre(rs.getTime("horaCierre"));
				suc.setIdSucursal(rs.getInt("idSucursal"));
				suc.setTelefono(rs.getString("telefono"));
				suc.setLocalidad(dl.getOne(rs.getInt("codigoPostal")));
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
		
		
		return suc;
	}
	public void addSucursal(Sucursal suc) throws SQLException{
		PreparedStatement stmt=null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO sucursales (idSucursal, telefono, denominacion, direccion, horaApertura, horaCierre, codigoPostal) VALUES (?,?,?,?,?,?,?)");
			stmt.setInt(1, suc.getIdSucursal());
			stmt.setString(2, suc.getTelefono());
			stmt.setString(3, suc.getDenominacion());
			stmt.setString(4, suc.getDireccion());/*
			suc.setHoraApertura(LocalTime.parse(String.valueOf(rs.getTime("horaApertura")))); //REVISAR COMO HACER CON LOCALTIME
			suc.setHoraCierre(LocalTime.parse(String.valueOf(rs.getTime("horaCierre"))));//REVISAR COMO HACER CON LOCALTIME
			stmt.setTime(5, suc.getHoraApertura());
			stmt.setTime(5, suc.getHoraApertura());
			stmt.setTime(6, suc.getHoraCierre());*/
			stmt.setInt(7, suc.getLocalidad().getCodigoPostal());
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
	/*public void updateSucursal(Sucursal suc) throws SQLException{
		PreparedStatement stmt=null;
			try {
				stmt=DbConnector.getInstancia().getConn().prepareStatement("UPDATE sucursales SET telefono=?, denominacion=?, direccion=?, horaApertura=?, horaCierre=?, codigoPostal=? WHERE idSucursal=?) VALUES (?,?,?,?,?,?,?)");
				stmt.setString(1, suc.getTelefono());
				stmt.setString(2, suc.getDenominacion());
				stmt.setString(3, suc.getDireccion());
				stmt.setTime(4, suc.getHoraApertura());
				stmt.setTime(5, suc.getHoraCierre());
				stmt.setInt(6, suc.getLocalidad().getCodigoPostal());
				stmt.setInt(7, suc.getIdSucursal());
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
	public void deleteSucursal(int idSuc)throws SQLException{
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("DELETE from sucursales where idSucursal=?");
			stmt.setInt(1,idSuc);
			
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
	}*/
}
