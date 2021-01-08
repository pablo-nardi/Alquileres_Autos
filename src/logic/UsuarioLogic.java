package logic;

import entidades.Usuario;
import datos.DatosUsuario;


public class UsuarioLogic {
	private DatosUsuario du;
	public UsuarioLogic() {
		du = new DatosUsuario();
	}
	
	public Usuario validarUsuario(Usuario usuario) {
		return du.validarUsuario(usuario);
	}
	
}
