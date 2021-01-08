package entidades;

import java.util.Date;

public class Usuario {
	String 	cuil,
			nombre,
			apellido,
			telefono,
			mail,
			calle,
			departamento,
			numUltTarjeta,
			nombreUltTarjeta,
			rol,
			password;
	
	int 	piso,
			codigoPostal;
	
	Date 	vencUltTarjeta;

	public String getCuil() {
		return cuil;
	}

	public String getNombre() {
		return nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public String getTelefono() {
		return telefono;
	}

	public String getMail() {
		return mail;
	}

	public String getCalle() {
		return calle;
	}

	public String getDepartamento() {
		return departamento;
	}

	public String getNumUltTarjeta() {
		return numUltTarjeta;
	}

	public String getNombreUltTarjeta() {
		return nombreUltTarjeta;
	}

	public String getRol() {
		return rol;
	}

	public String getPassword() {
		return password;
	}

	public int getPiso() {
		return piso;
	}

	public int getCodigoPostal() {
		return codigoPostal;
	}

	public Date getVencUltTarjeta() {
		return vencUltTarjeta;
	}

	public void setCuil(String cuil) {
		this.cuil = cuil;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public void setCalle(String calle) {
		this.calle = calle;
	}

	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}

	public void setNumUltTarjeta(String numUltTarjeta) {
		this.numUltTarjeta = numUltTarjeta;
	}

	public void setNombreUltTarjeta(String nombreUltTarjeta) {
		this.nombreUltTarjeta = nombreUltTarjeta;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setPiso(int piso) {
		this.piso = piso;
	}

	public void setCodigoPostal(int codigoPostal) {
		this.codigoPostal = codigoPostal;
	}

	public void setVencUltTarjeta(Date vencUltTarjeta) {
		this.vencUltTarjeta = vencUltTarjeta;
	}
		
	
}
