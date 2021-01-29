package datos;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
	public LinkedList<Auto> getAll() throws SQLException {
		Statement stmt=null;
		ResultSet rs = null;
		LinkedList<Auto> autos = new LinkedList<>();
		
		try {
			stmt = DbConnector.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("select * from autos");
			
			if(rs != null) {
				while(rs.next()) {
					Auto auto = new Auto();
					DatosModelos dm = new DatosModelos();
					DatosSucursal ds = new DatosSucursal();
					
					auto.setCapacidadDelTanque(rs.getFloat("capacidadTanque"));
					auto.setEstado(Auto.Estado.valueOf(rs.getString("estado")));
					auto.setFecha_de_compra(rs.getDate("fechaDeCompra"));
					auto.setFechaUtltimoServicio(rs.getDate("fechaUltimoServicio"));
					auto.setKilometraje(rs.getFloat("kilometraje"));
					auto.setPatente(rs.getString("patente"));
					auto.setModelo(dm.getOne(rs.getInt("idModelo")));
					auto.setSucursal(ds.getOne(rs.getInt("idSucursal")));
					
					autos.add(auto);
				}
			}
		}catch(Exception ex) {
			throw ex;
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
		return autos;
	}
	public Auto getOne(String patente) throws SQLException{
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Auto auto = new Auto();
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM autos where patente=?");
			stmt.setString(1, patente);
			rs = stmt.executeQuery();
			
			
			if(rs != null && rs.next()) {
					auto = new Auto();
					DatosModelos dm = new DatosModelos();
					DatosSucursal ds = new DatosSucursal();
					
					auto.setCapacidadDelTanque(rs.getFloat("capacidadTanque"));
					auto.setEstado(Auto.Estado.valueOf(rs.getString("estado")));
					auto.setFecha_de_compra(rs.getDate("fechaDeCompra"));
					auto.setFechaUtltimoServicio(rs.getDate("fechaUltimoServicio"));
					auto.setKilometraje(rs.getFloat("kilometraje"));
					auto.setPatente(rs.getString("patente"));
					auto.setModelo(dm.getOne(rs.getInt("idModelo")));
					auto.setSucursal(ds.getOne(rs.getInt("idSucursal")));
					
			}
		}catch(Exception ex) {
			throw ex;
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw e;
			}
		}
		
		return auto;
	}
	public void addAuto(Auto auto) throws SQLException{
		PreparedStatement stmt=null;
		ResultSet keyResultSet=null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("insert into autos (patente, estado, capacidadTanque, kilometraje, fechaDeCompra, fechaUltimoServicio, idModelo, idSucursal) VALUES (?,?,?,?,?,?,?,?)");
			
			stmt.setString(1, auto.getPatente());
			stmt.setString(2, auto.getEstado().toString());
			stmt.setFloat(3, auto.getCapacidadDelTanque());
			stmt.setFloat(4, auto.getKilometraje());
			stmt.setDate(5, (Date) auto.getFecha_de_compra());
			stmt.setDate(6, (Date) auto.getFechaUtltimoServicio());
			stmt.setInt(7, auto.getModelo().getIdentificacion());
			stmt.setInt(8, auto.getSucursal().getIdSucursal());
			
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
	public void update(Auto auto) throws SQLException{
		PreparedStatement stmt = null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("UPDATE autos set estado=?, capacidadTanque=?, kilometraje=?, fechaDeCompra=?, fechaUltimoServicio=?, idModelo=?, idSucursal=? WHERE patente=?");
			
			stmt.setString(1, auto.getEstado().toString());
			stmt.setFloat(2, auto.getCapacidadDelTanque());
			stmt.setFloat(3, auto.getKilometraje());
			stmt.setDate(4, (Date) auto.getFecha_de_compra());
			stmt.setDate(5, (Date) auto.getFechaUtltimoServicio());
			stmt.setInt(6, auto.getModelo().getIdentificacion());
			stmt.setInt(7, auto.getSucursal().getIdSucursal());
			stmt.setString(8, auto.getPatente());
			
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
	public void delete(String patente) throws SQLException {
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("DELETE from autos where patente=?");
			stmt.setString(1,patente);
			
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
