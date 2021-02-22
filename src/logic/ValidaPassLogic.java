package logic;

import entidades.Usuario;

import java.sql.SQLException;

import datos.DatosUsuario;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidaPassLogic {
	DatosUsuario du;
	
	public ValidaPassLogic() {
		du=new DatosUsuario();
	}
	
	public String validaPass(String newpass, String repitedpass) throws SQLException{
		String estado = "";
		/*Pattern patron = Pattern.compile("[a-zA-Z0-9]{6,}");
		Matcher matcher = patron.matcher(newpass);
		
		if(matcher.matches())*/
		if(newpass.length() < 6){
			estado = "la nueva clave debe tener mas de 6 caracteres de longitud";
		}else if(!newpass.equals(repitedpass)) {
			estado = "La clave nueva y su reingreso deben ser identicos";
		}else {
			estado = "valido";
		}
		
		return estado;
	}	
	
	public String validaPass(Usuario user,String oldpass,String newpass, String repitedpass) throws SQLException{
		
		String estado = "";
		
		if(!oldpass.equals(du.validarPassword(user))) {
			estado = "clave antigua incorrecta";
		}else if(oldpass.equals(newpass)) {
			estado ="La clave vieja y la nueva deben ser diferentes";
		}else if(newpass.length() < 6) {
			estado = "la nueva clave debe tener mas de 6 caracteres de longitud";
		}else if(!newpass.equals(repitedpass)) {
			estado = "La clave nueva y su reingreso deben ser identicos";
		}else {
			estado = "valido";
		}
		
		return estado;
	}
	
	
}
