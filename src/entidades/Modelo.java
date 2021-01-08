package entidades;



public class Modelo {
	int identificacion,
	cantEquipajeGrande,
	cantEquipajeChico,
	cantPasajeros;
	
	float precioPorDia;
	
	String denominacion,
			transmision,
	  aireAcondicionado;
	
	// Blob fotoModelo;
	
	TipoAuto tipoAuto;
	
	public Modelo() {
		tipoAuto = new TipoAuto();
		this.setTipoAuto(tipoAuto);
	}
	
	public TipoAuto getTipoAuto() {
			return tipoAuto;
		}
		public void setTipoAuto(TipoAuto tipoAuto) {
			this.tipoAuto = tipoAuto;
		}
		///// Getters ///////
		public int getIdentificacion() {
			return identificacion;
		}
		public int getCantEquipajeGrande() {
			return cantEquipajeGrande;
		}
		public int getCantEquipajeChico() {
			return cantEquipajeChico;
		}
		public int getCantPasajeros() {
			return cantPasajeros;
		}
		public float getPrecioPorDia() {
			return precioPorDia;
		}
		public String getDenominacion() {
			return denominacion;
		}
		public String getTransmision() {
			return transmision;
		}
		public String getAireAcondicionado() {
			return aireAcondicionado;
		}
		
	////////Setters //////////
		
		public void setIdentificacion(int identificacion) {
			this.identificacion = identificacion;
		}
		public void setCantEquipajeGrande(int cantEquipajeGrande) {
			this.cantEquipajeGrande = cantEquipajeGrande;
		}
		public void setCantEquipajeChico(int cantEquipajeChico) {
			this.cantEquipajeChico = cantEquipajeChico;
		}
		public void setCantPasajeros(int cantPasajeros) {
			this.cantPasajeros = cantPasajeros;
		}
		public void setPrecioPorDia(float precioPorDia) {
			this.precioPorDia = precioPorDia;
		}
		public void setDenominacion(String denominacion) {
			this.denominacion = denominacion;
		}
		public void setTransmision(String transmision) {
			this.transmision = transmision;
		}
		public void setAireAcondicionado(String aireAcondicionado) {
			this.aireAcondicionado = aireAcondicionado;
		}
}
