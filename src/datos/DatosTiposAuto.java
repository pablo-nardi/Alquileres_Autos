package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import entidades.TipoAuto;


public class DatosTiposAuto {
	
	public TipoAuto getOne(int id) throws SQLException{
		TipoAuto tipo = new TipoAuto();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("select * from tiposAuto where idTipo=?");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if(rs != null && rs.next()) {
				tipo.setId_Tipo(rs.getInt("idTipo"));
				/*creo que el problema es que le mando un id que np existe*/
				tipo.setNombreTipo(rs.getString("nombreTipo"));
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
		
		
		return tipo;
	}
	public LinkedList<TipoAuto> getAll() throws SQLException{
		LinkedList<TipoAuto> autos = new LinkedList<>();
		TipoAuto tipo;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM tiposAuto");
			rs = stmt.executeQuery();
			if(rs != null) {
				while(rs.next()) {
					tipo = new TipoAuto();
					tipo.setId_Tipo(rs.getInt("idTipo"));
					tipo.setNombreTipo(rs.getString("nombreTipo"));
					//falta la foto
					autos.add(tipo);
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
	public void addTipoAuto(TipoAuto tipo) throws SQLException{
			
			PreparedStatement stmt=null;
			ResultSet keyResultSet=null;
			try {
				stmt=DbConnector.getInstancia().getConn().prepareStatement(
						"insert into tiposAuto (nombreTipo, fotoTipo) VALUES (?,?)", PreparedStatement.RETURN_GENERATED_KEYS
						);
			
				stmt.setString(1, tipo.getNombreTipo());
				stmt.setString(2, null);
				stmt.executeUpdate();
				keyResultSet = stmt.getGeneratedKeys();
				if(keyResultSet!=null && keyResultSet.next()) {
					tipo.setId_Tipo(keyResultSet.getInt(1));
				}
				
				
			} catch (SQLException e) {
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
	public void updateTipoAuto(TipoAuto tipo)throws SQLException {
		
		PreparedStatement stmt=null;
		ResultSet keyResultSet=null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("UPDATE tiposAuto SET nombreTipo=?, fotoTipo=? WHERE idTipo=?");
		
			stmt.setString(1, tipo.getNombreTipo());
			stmt.setString(2, null);
			stmt.setInt(3, tipo.getId_Tipo());
			stmt.executeUpdate();
						
			
		} catch (SQLException e) {
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
	public void deleteTipoAuto(int id)throws SQLException{
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("DELETE from tiposAuto where idTipo=?");
			stmt.setInt(1,id);
			
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
