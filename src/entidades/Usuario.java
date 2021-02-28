package entidades;



public class Usuario {
	String 	cuil,
			nombre,
			apellido,
			telefono,
			mail,
			ciudad,
			codigoPostal,
			calle,
			departamento,
			numUltTarjeta,
			nombreUltTarjeta,
			rol,
			password,
			vencUltTarjeta;
	
	int 	piso;
	
	 	


	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String localidad) {
		this.ciudad = localidad;
	}

	public String getCodigoPostal() {
		return codigoPostal;
	}

	public void setCodigoPostal(String codigoPostal) {
		this.codigoPostal = codigoPostal;
	}

	
	


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

	public String getVencUltTarjeta() {
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

	public void setVencUltTarjeta(String vencUltTarjeta) {
		this.vencUltTarjeta = vencUltTarjeta;
	}
		
	
}
