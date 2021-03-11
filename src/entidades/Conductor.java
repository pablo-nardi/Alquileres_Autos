package entidades;

import java.sql.Date;

public class Conductor {
	
	String 	dni,
			nombreApellido,
			numLicencia,
			celular,
			mail;
	


	Date 	fecNac,
			fecLic;

	
	public String getNombreApellido() {
		return nombreApellido;
	}

	public void setNombreApellido(String nombreApellido) {
		this.nombreApellido = nombreApellido;
	}
	public String getDni() {
		return dni;
	}

	public String getNumLicencia() {
		return numLicencia;
	}

	public String getCelular() {
		return celular;
	}

	public String getMail() {
		return mail;
	}

	public Date getFecNac() {
		return fecNac;
	}

	public Date getFecLic() {
		return fecLic;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public void setNumLicencia(String numLicencia) {
		this.numLicencia = numLicencia;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public void setFecNac(Date fecNac) {
		this.fecNac = fecNac;
	}

	public void setFecLic(Date fecLic) {
		this.fecLic = fecLic;
	}
	
}
