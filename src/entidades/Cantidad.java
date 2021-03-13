package entidades;

public class Cantidad {
	int idCant, cantidad, idAql, idExtra;
	
	public Cantidad() {
		
	}
	
	public Cantidad (int cant, int ida, int ide) {
		setCantidad(cant);
		setIdAql(ida);
		setIdExtra(ide);
	}
	
	
	public int getIdCant() {
		return idCant;
	}

	public void setIdCant(int idCant) {
		this.idCant = idCant;
	}

	

	public int getIdAql() {
		return idAql;
	}

	public int getIdExtra() {
		return idExtra;
	}

	public void setIdAql(int idAql) {
		this.idAql = idAql;
	}

	public void setIdExtra(int idExtra) {
		this.idExtra = idExtra;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	
}
