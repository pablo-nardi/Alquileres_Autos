package entidades;




public class Sucursal {
	int idSucursal; 
	String horaApertura, horaCierre, denominacion, direccion, telefono;
	Localidad localidad;
	 
	

	///// Getters ///////
	public String getTelefono() {
		return telefono;
	}
	public String getHoraApertura() {
		return horaApertura;
	}
	public String getHoraCierre() {
		return horaCierre;
	}
	public Localidad getLocalidad() {
		return localidad;
	}
	public int getIdSucursal() {
		return idSucursal;
	}
	public String getDenominacion() {
		return denominacion;
	}
	public String getDireccion() {
		return direccion;
	}
	
///// Setters ///////
	
	public void setLocalidad(Localidad localidad) {
		this.localidad = localidad;
	}
	public void setIdSucursal(int idSucursal) {
		this.idSucursal = idSucursal;
	}
	public void setDenominacion(String denominacion) {
		this.denominacion = denominacion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}public void setHoraCierre(String horaCierre) {
		this.horaCierre = horaCierre;
	}
	public void setHoraApertura(String horaApertura) {
		this.horaApertura = horaApertura;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
}
