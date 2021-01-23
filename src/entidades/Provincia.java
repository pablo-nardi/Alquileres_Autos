package entidades;

import java.util.LinkedList;

public class Provincia {
	int idProvincia;
	String denominacion;
	LinkedList<Localidad> localidades = new LinkedList<>();
	/*
	HashMap<String, Localidad> localidades = new HashMap<String, Localidad>();
	HashMap<String, String> capitalCities = new HashMap<String, String>(); solo de prueba
		capitalCities.put("England", "London");
		capitalCities.get("England");
		capitalCities.remove("England");
		capitalCities.clear(); Limpia TODO
		capitalCities.size();
		// Print keys and values
			for (String i : capitalCities.keySet()) {
  				System.out.println("key: " + i + " value: " + capitalCities.get(i));
			}
	*/
	
	
	
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
