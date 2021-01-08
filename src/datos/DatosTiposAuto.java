package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import entidades.TipoAuto;


public class DatosTiposAuto {
	
	public void addTipoAuto(TipoAuto tipo) {
		
		PreparedStatement stmt=null;
		ResultSet keyResultSet=null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"insert into tiposAuto (nombreTipo, fotoTipo) VALUES (?,NULL)", PreparedStatement.RETURN_GENERATED_KEYS
					);
		
			stmt.setString(1, tipo.getNombreTipo());
			stmt.executeUpdate();
			keyResultSet = stmt.getGeneratedKeys();
			if(keyResultSet!=null && keyResultSet.next()) {
				tipo.setId_Tipo(keyResultSet.getInt(1));
			}
			
			
		} catch (SQLException e) {
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
	public TipoAuto getOne(int id) {
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
		
		
		return tipo;
	}
	public LinkedList<TipoAuto> getAll(){
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
		
		
		return autos;
	}

}
