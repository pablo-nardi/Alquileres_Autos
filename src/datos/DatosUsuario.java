package datos;

import entidades.Usuario;
import java.sql.*;
import java.util.LinkedList;




public class DatosUsuario {
	
		public Usuario validarUsuario(Usuario usuario) {
			ResultSet rs=null;
			PreparedStatement stmt=null;
			Usuario user = null;
			DatosLocalidad dl = new DatosLocalidad();
			
			try {
				stmt = DbConnector.getInstancia().getConn().prepareStatement("select cuil, nombre, apellido, telefono, mail, calle, piso, dpto, codigoPostal, rol, password from usuarios where mail=? and password=?");
				
				stmt.setString(1, usuario.getMail());
				stmt.setString(2, usuario.getPassword());
				rs = stmt.executeQuery();
				
				if(rs != null && rs.next()) {
					user = new Usuario();
					user.setApellido(rs.getString("apellido"));
					user.setCalle(rs.getString("calle"));
					user.setLocalidad(dl.getOne(rs.getInt("codigoPostal")));
					user.setCuil(rs.getString("cuil"));
					user.setMail(rs.getString("mail"));
					user.setNombre(rs.getString("nombre"));
					user.setPassword(rs.getString("password"));
					user.setPiso(rs.getInt("piso"));
					user.setDepartamento(rs.getString("dpto"));
					user.setTelefono(rs.getString("telefono"));
					user.setRol(rs.getString("rol"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs!=null) {rs.close();}
					if(stmt!=null) {stmt.close();}
					DbConnector.getInstancia().releaseConn();
				}catch(SQLException ex) {
					ex.printStackTrace();
				}
			}
			return user;
		}
		public LinkedList<Usuario> getAll(){
			LinkedList<Usuario> usuarios = new LinkedList<Usuario>();
			ResultSet rs = null;
			PreparedStatement stmt = null;
			DatosLocalidad dl = new DatosLocalidad();
			
			try {
				stmt = DbConnector.getInstancia().getConn().prepareStatement("select * from usuarios");
				rs = stmt.executeQuery();
				
				if(rs!=null) {
					while(rs.next()) {
						Usuario user = new Usuario();
						
						user.setApellido(rs.getString("apellido"));
						user.setCalle(rs.getString("calle"));
						user.setLocalidad(dl.getOne(rs.getInt("codigoPostal")));
						user.setCuil(rs.getString("cuil"));
						user.setDepartamento(rs.getString("dpto"));
						user.setMail(rs.getString("mail"));
						user.setNombre(rs.getString("nombre"));
						user.setPassword(rs.getString("password"));
						user.setPiso(rs.getInt("piso"));
						user.setRol(rs.getString("rol"));
						user.setTelefono(rs.getString("telefono"));
						
						usuarios.add(user);
					}
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs!=null) {rs.close();}
					if(stmt!=null) {stmt.close();}
					DbConnector.getInstancia().releaseConn();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			return usuarios;
		}
		public Usuario getOne(String cuil) throws SQLException{
			Usuario user = null;
			DatosLocalidad dl = new DatosLocalidad();
			PreparedStatement stmt=null;
			ResultSet rs = null;
			
			try {
				stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM usuarios WHERE cuil=?");
				stmt.setString(1, cuil);
				rs = stmt.executeQuery();
				
				if(rs != null && rs.next()) {
					user = new Usuario();
					user.setApellido(rs.getString("apellido"));
					user.setCalle(rs.getString("calle"));
					user.setLocalidad(dl.getOne(rs.getInt("codigoPostal")));
					user.setCuil(rs.getString("cuil"));
					user.setDepartamento(rs.getString("dpto"));
					user.setMail(rs.getString("mail"));
					user.setNombre(rs.getString("nombre"));
					user.setPassword(rs.getString("password"));
					user.setPiso(rs.getInt("piso"));
					user.setRol(rs.getString("rol"));
					user.setTelefono(rs.getString("telefono"));
				}
			}catch(Exception ex) {
				throw ex ; 
			}finally {
				try {
					if(rs!=null) {rs.close();}
					if(stmt!=null) {stmt.close();}
					DbConnector.getInstancia().releaseConn();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			return user;
		}

		public void addUser(Usuario user) throws SQLException {
			PreparedStatement stmt = null;
			
			try {
				stmt = DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO usuarios (cuil, nombre, apellido, telefono, mail, calle, piso, dpto, codigoPostal, rol, password) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
				stmt.setString(1, user.getCuil());
				stmt.setString(2, user.getNombre());
				stmt.setString(3, user.getApellido());
				stmt.setString(4, user.getTelefono());
				stmt.setString(5, user.getMail());
				stmt.setString(6, user.getCalle());
				stmt.setInt(7, user.getPiso());
				stmt.setString(8, user.getDepartamento());
				stmt.setInt(9, user.getLocalidad().getCodigoPostal());
				stmt.setString(10, user.getRol());
				stmt.setString(11, user.getPassword());
				stmt.executeUpdate();
			}catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					if(stmt!=null) {stmt.close();}
					DbConnector.getInstancia().releaseConn();
				} catch (SQLException e) {
					throw e;
				}
			}
		}
		public void updateUser(Usuario user) throws SQLException {
			PreparedStatement stmt = null;
			
			try {
				stmt = DbConnector.getInstancia().getConn().prepareStatement("UPDATE usuarios SET nombre=?, apellido=?, telefono=?, mail=?, calle=?, piso=?, dpto=?, codigoPostal=?, rol=?, password=? where cuil=?");
				stmt.setString(1, user.getNombre());
				stmt.setString(2, user.getApellido());
				stmt.setString(3, user.getTelefono());
				stmt.setString(4, user.getMail());
				stmt.setString(5, user.getCalle());
				stmt.setInt(6, user.getPiso());
				stmt.setString(7, user.getDepartamento());
				stmt.setInt(8, user.getLocalidad().getCodigoPostal());
				stmt.setString(9, user.getRol());
				stmt.setString(10, user.getPassword());				
				stmt.setString(11, user.getCuil());
				
				stmt.executeUpdate();
				
			}catch (SQLException e) {
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
		public void deleteUser(String cuil) throws SQLException{
			PreparedStatement stmt = null;
			try {
				stmt = DbConnector.getInstancia().getConn().prepareStatement("DELETE from usuarios where cuil=?");
				stmt.setString(1, cuil);
				
				stmt.executeUpdate();
			}catch (SQLException e) {
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
