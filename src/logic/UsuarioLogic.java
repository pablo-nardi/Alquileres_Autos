package logic;

import entidades.Usuario;

import java.sql.SQLException;
import java.util.LinkedList;

import datos.DatosUsuario;


public class UsuarioLogic {
	private DatosUsuario du;
	public UsuarioLogic() {
		du = new DatosUsuario();
	}
	
	public Usuario validarUsuario(Usuario usuario)throws SQLException  {
		return du.validarUsuario(usuario);
	}
	public LinkedList<Usuario> getAll()throws SQLException {
		return du.getAll();
	}
	public Usuario getOne(String cuil) throws SQLException {
		return du.getOne(cuil);
	}
	public void addUser(Usuario user) throws SQLException {
		du.addUser(user);
	}
	public void updateUser(Usuario user) throws SQLException {
		du.updateUser(user);
	}
	public void deleteUser(String cuil) throws SQLException{
		du.deleteUser(cuil);
	}
	public void setNewPassword(Usuario usuario) throws SQLException{
		du.setNewPassword(usuario);
	}
	public boolean validarSesion(Usuario user, String letra) {
		boolean estado = false;
		
		if(user == null) {
			estado = false;
		}else if(letra.toUpperCase().equals("A") && user.getRol().equals("administrador")) {
			estado = true;
		}else if(letra.toUpperCase().equals("U") && user.getRol().equals("usuario")) {
			estado = true;
		}else if(letra.toUpperCase().equals("G") && (user.getRol().equals("usuario") || user.getRol().equals("administrador"))) {
			estado = true;
		}
		
		return estado;
	}
}
