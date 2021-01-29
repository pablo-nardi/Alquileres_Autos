package entidades;

import java.sql.Time;
import java.time.LocalTime;


public class Sucursal {
	int idSucursal; 
	String denominacion, direccion, telefono;
	Localidad localidad;
	LocalTime horaApertura, horaCierre;
	

	///// Getters ///////
	public String getTelefono() {
		return telefono;
	}
	public LocalTime getHoraApertura() {
		return horaApertura;
	}
	public LocalTime getHoraCierre() {
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
	}public void setHoraCierre(LocalTime horaCierre) {
		this.horaCierre = horaCierre;
	}
	public void setHoraApertura(LocalTime horaApertura) {
		this.horaApertura = horaApertura;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
}
