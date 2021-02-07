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
	
	public Usuario validarUsuario(Usuario usuario) {
		return du.validarUsuario(usuario);
	}
	public LinkedList<Usuario> getAll(){
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
	public boolean validarUsuario(Usuario user, String letra) {
		boolean estado = false;
		
		if(user == null) {
			estado = false;
		}else if(letra.toUpperCase().equals("A") && user.getRol().equals("administrador")) {
			estado = true;
		}else if(letra.toUpperCase().equals("U") && user.getRol().equals("usuario")) {
			estado = true;
		}
		
		return estado;
	}
}
