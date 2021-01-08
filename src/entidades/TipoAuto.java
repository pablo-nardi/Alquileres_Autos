package entidades;

public class TipoAuto {
	int id_Tipo;
	String nombreTipo;
	// Blob foto;
	
	public int getId_Tipo() {
		return id_Tipo;
	}
	public String getNombreTipo() {
		return nombreTipo;
	}
	public void setId_Tipo(int id_Tipo) {
		this.id_Tipo = id_Tipo;
	}
	public void setNombreTipo(String nombreTipo) {
		this.nombreTipo = nombreTipo;
	}
	@Override
	public String toString() {
		return "Nombre: "+ nombreTipo;
	}
		
}
