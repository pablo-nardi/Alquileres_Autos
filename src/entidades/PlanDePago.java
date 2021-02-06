package entidades;

public class PlanDePago {

	int idPlan,
	cantCuotas;

	String 	nombrePlan,
		entidadCrediticia,
		nombreTarjeta;
	
	public int getIdPlan() {
		return idPlan;
	}

	public int getCantCuotas() {
		return cantCuotas;
	}

	public String getNombrePlan() {
		return nombrePlan;
	}

	public String getEntidadCrediticia() {
		return entidadCrediticia;
	}

	public String getNombreTarjeta() {
		return nombreTarjeta;
	}

	public void setIdPlan(int idPlan) {
		this.idPlan = idPlan;
	}

	public void setCantCuotas(int cantCuotas) {
		this.cantCuotas = cantCuotas;
	}

	public void setNombrePlan(String nombrePlan) {
		this.nombrePlan = nombrePlan;
	}

	public void setEntidadCrediticia(String entidadCrediticia) {
		this.entidadCrediticia = entidadCrediticia;
	}

	public void setNombreTarjeta(String nombreTarjeta) {
		this.nombreTarjeta = nombreTarjeta;
	}


}
