package datos;

import entidades.Usuario;
import java.sql.*;




public class DatosUsuario {
	
		public Usuario validarUsuario(Usuario usuario) {
			ResultSet rs=null;
			PreparedStatement stmt=null;
			Usuario user = null;
			
			try {
				stmt = DbConnector.getInstancia().getConn().prepareStatement("select cuil, nombre, apellido, telefono, mail, calle, piso, dpto, codigoPostal, numUltTarjeta, nombreUtlTarjeta, vencUltTarjeta, rol, password from usuarios where mail=? and password=?");
				
				stmt.setString(1, usuario.getMail());
				stmt.setString(2, usuario.getPassword());
				rs = stmt.executeQuery();
				
				if(rs != null && rs.next()) {
					user = new Usuario();
					user.setApellido(rs.getString("apellido"));
					user.setCalle(rs.getString("calle"));
					user.setCodigoPostal(rs.getInt("codigoPostal"));
					user.setCuil(rs.getString("cuil"));
					user.setMail(rs.getString("mail"));
					user.setNombre(rs.getString("nombre"));
					user.setNombreUltTarjeta(rs.getString("nombreUtlTarjeta"));
					user.setNumUltTarjeta(rs.getString("numUltTarjeta"));
					user.setVencUltTarjeta(rs.getDate("vencUltTarjeta"));
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
		/*public LinkedList<Usuario> getAll(){
			Usuario user = new Usuario();
			LinkedList<Usuario> usuarios = new LinkedList<Usuario>();
			
			
			ResultSet rs = null;
			PreparedStatement stmt = null;
			
			try {
				stmt = DbConnector.getInstancia().getConn().prepareStatement("select * from usuarios");
				
				rs = stmt.executeQuery();
			}catch(Exception e) {
				
			}
			
			
			
			return usuarios;
		}*/
}
