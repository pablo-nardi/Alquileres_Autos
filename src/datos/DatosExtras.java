package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import entidades.*;

public class DatosExtras {
	public LinkedList<Extras> getAll() throws SQLException{
		LinkedList<Extras> extras= new LinkedList<>();
		Extras extra = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM extras");
			rs = stmt.executeQuery();
			
			if(rs != null) {
				while(rs.next()) {
					extra = new Extras();
					
					extra.setCodigo(rs.getInt("idExtra"));
					extra.setDescripcion(rs.getString("descripcion"));
					extra.setPrecio(rs.getFloat("precio"));
					
					extras.add(extra);
				}
			}
		}catch(Exception ex) {
			throw ex;
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			}catch(SQLException e) {
				throw e;
			}
		}
		return extras;
	}
	public Extras getOne(int id) throws SQLException{

		Extras extra = null;
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM extras WHERE idExtra=?");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			
			if(rs != null && rs.next()) {
				extra = new Extras();
				
				extra.setCodigo(rs.getInt("idExtra"));
				extra.setDescripcion(rs.getString("descripcion"));
				extra.setPrecio(rs.getFloat("precio"));
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
		
		return extra;
	}
	public void addExtra(Extras extra) throws SQLException {
		PreparedStatement stmt=null;
		ResultSet keyResultSet=null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO extras (descripcion, precio) VALUES (?,?)", PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setString(1, extra.getDescripcion());
			stmt.setFloat(2, extra.getPrecio());
			stmt.executeUpdate();
			keyResultSet = stmt.getGeneratedKeys();
			if(keyResultSet!=null && keyResultSet.next()) {
				extra.setCodigo(keyResultSet.getInt(1));
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
	public void updateExtra(Extras extra) throws SQLException{
		PreparedStatement stmt = null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("UPDATE extras SET descripcion=?, precio=? WHERE idExtra=?");
			stmt.setString(1, extra.getDescripcion());
			stmt.setFloat(2, extra.getPrecio());
			stmt.setInt(3, extra.getCodigo());
			
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
	public void deleteExtra(int idExtra)throws SQLException{

		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("DELETE from extras where idExtra=?");
			stmt.setInt(1,idExtra);
			
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
	public void addCantidad(int cant, int idAlq, int extra)throws SQLException {
		PreparedStatement stmt=null;
		ResultSet keyResultSet=null;
		int id;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO cantidades (cantidad, idAlquiler, idExtra) VALUES (?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, cant);
			stmt.setInt(2, idAlq);
			stmt.setInt(3, extra);
			
			stmt.executeUpdate();
			
			keyResultSet = stmt.getGeneratedKeys();
			if(keyResultSet!=null && keyResultSet.next()) {
				id = keyResultSet.getInt(1);
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
