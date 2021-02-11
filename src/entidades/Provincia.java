package entidades;

import java.util.LinkedList;

public class Provincia {
	int idProvincia;
	String denominacion;
	LinkedList<Localidad> localidades = new LinkedList<>();

	
	
	
	/// Getters ///
	public int getIdProvincia() {
		return idProvincia;
	}
	public String getDenominacion() {
		return denominacion;
	}
	public LinkedList<Localidad> getLocalidades(){
		return localidades;
	}
		
	// Setters //
	public void setIdProvincia(int idProvincia) {
		this.idProvincia = idProvincia;
	}
	public void setDenominacion(String denominacion) {
		this.denominacion = denominacion;
	}
	public void setLocalidades(LinkedList<Localidad> localidades) {
		this.localidades = localidades;
	}
}
