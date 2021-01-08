package entidades;



public class Sucursal {
	int idSucursal,
	telefono,
	horaApertura,
	horaCierre; //si no hay que validar con el tiempo, lo dejo como entero
	String denominacion, direccion;
	float constoEntregaFueraHora;
	
///// Getters ///////
	public int getIdSucursal() {
		return idSucursal;
	}
	public int getTelefono() {
		return telefono;
	}
	public String getDenominacion() {
		return denominacion;
	}
	public String getDireccion() {
		return direccion;
	}
	public float getConstoPorEntregaFueraHorario() {
		return constoEntregaFueraHora;
	}
	public int getHoraApertura() {
		return horaApertura;
	}
	public int getHoraCierre() {
		return horaCierre;
	}
	public float getConstoEntregaFueraHora() {
		return constoEntregaFueraHora;
	}
	
///// Setters ///////
	
	public void setIdSucursal(int idSucursal) {
		this.idSucursal = idSucursal;
	}
	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}
	public void setDenominacion(String denominacion) {
		this.denominacion = denominacion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public void setConstoPorEntregaFueraHorario(float constoPorEntregaFueraHorario) {
		this.constoEntregaFueraHora = constoPorEntregaFueraHorario;
	}
	public void setHoraApertura(int horaApertura) {
		this.horaApertura = horaApertura;
	}
	public void setHoraCierre(int horaCierre) {
		this.horaCierre = horaCierre;
	}
	public void setConstoEntregaFueraHora(float constoEntregaFueraHora) {
		this.constoEntregaFueraHora = constoEntregaFueraHora;
	}
}
