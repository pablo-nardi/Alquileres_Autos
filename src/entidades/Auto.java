package entidades;

import java.util.Date;

public class Auto {
	String patente; //disponible, en alquiler, en inspeccion, dado de baja
	float capacidadDelTanque, kilometraje;
	Date fecha_de_compra, fechaUtltimoServicio;
	Estado estado;
	Modelo modelo;
	
	public enum Estado{
		disponible,
		alquilado,
		inspeccion,
		inhabilitado
	}
	
	
	///// Getters ///////
	
	public String getPatente() {
		return patente;
	}
	public Estado getEstado() {
		return estado;
	}
	public float getCapacidadDelTanque() {
		return capacidadDelTanque;
	}
	public float getKilometraje() {
		return kilometraje;
	}
	public Date getFecha_de_compra() {
		return fecha_de_compra;
	}
	public Date getFechaUtltimoServicio() {
		return fechaUtltimoServicio;
	}
	public Modelo getModelo() {
		return modelo;
	}
	
	//////// Setters //////////
	
	public void setPatente(String patente) {
		this.patente = patente;
	}
	public void setEstado(Estado estado) {
		this.estado = estado;
	}
	public void setCapacidadDelTanque(float capacidadDelTanque) {
		this.capacidadDelTanque = capacidadDelTanque;
	}
	public void setKilometraje(float kilometraje) {
		this.kilometraje = kilometraje;
	}
	public void setFecha_de_compra(Date fecha_de_compra) {
		this.fecha_de_compra = fecha_de_compra;
	}
	public void setFechaUtltimoServicio(Date fechaUtltimoServicio) {
		this.fechaUtltimoServicio = fechaUtltimoServicio;
	}
	public void setModelo(Modelo modelo) {
		this.modelo = modelo;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((patente == null) ? 0 : patente.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Auto other = (Auto) obj;
		if (patente == null) {
			if (other.patente != null)
				return false;
		} else if (!patente.equalsIgnoreCase(other.patente))
			return false;
		return true;
	}
	
	
	
}
