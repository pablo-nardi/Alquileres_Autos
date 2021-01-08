package entidades;
import java.util.Date;

public class Alquiler {
	int		idAlquiler,
			idModelo,
			idSucursal,
			idPlan;
	
	float	costoPorDaños,
			costoDevolucionTardia,
			codtoTanqueSinLlenar,
			importeAcordado,
			precioDiario;
	
	Date	fechaHoraRetiroPrevisto,
			fechaHoraDevolucionPrevista,
			fechaHoraRetiroReal,
			fechaHoraDevolucionReal;
	
	String 	estadoAlquiler, //Reservado, Cancelado, Anulado, Abierto, Inspeccion, Cerrado.
			cuil;

	public int getIdAlquiler() {
		return idAlquiler;
	}

	public int getIdModelo() {
		return idModelo;
	}

	public int getIdSucursal() {
		return idSucursal;
	}

	public int getIdPlan() {
		return idPlan;
	}

	public float getCostoPorDaños() {
		return costoPorDaños;
	}

	public float getCostoDevolucionTardia() {
		return costoDevolucionTardia;
	}

	public float getCodtoTanqueSinLlenar() {
		return codtoTanqueSinLlenar;
	}

	public float getImporteAcordado() {
		return importeAcordado;
	}

	public float getPrecioDiario() {
		return precioDiario;
	}

	public Date getFechaHoraRetiroPrevisto() {
		return fechaHoraRetiroPrevisto;
	}

	public Date getFechaHoraDevolucionPrevista() {
		return fechaHoraDevolucionPrevista;
	}

	public Date getFechaHoraRetiroReal() {
		return fechaHoraRetiroReal;
	}

	public Date getFechaHoraDevolucionReal() {
		return fechaHoraDevolucionReal;
	}

	public String getEstadoAlquiler() {
		return estadoAlquiler;
	}

	public String getCuil() {
		return cuil;
	}

	public void setIdAlquiler(int idAlquiler) {
		this.idAlquiler = idAlquiler;
	}

	public void setIdModelo(int idModelo) {
		this.idModelo = idModelo;
	}

	public void setIdSucursal(int idSucursal) {
		this.idSucursal = idSucursal;
	}

	public void setIdPlan(int idPlan) {
		this.idPlan = idPlan;
	}

	public void setCostoPorDaños(float costoPorDaños) {
		this.costoPorDaños = costoPorDaños;
	}

	public void setCostoDevolucionTardia(float costoDevolucionTardia) {
		this.costoDevolucionTardia = costoDevolucionTardia;
	}

	public void setCodtoTanqueSinLlenar(float codtoTanqueSinLlenar) {
		this.codtoTanqueSinLlenar = codtoTanqueSinLlenar;
	}

	public void setImporteAcordado(float importeAcordado) {
		this.importeAcordado = importeAcordado;
	}

	public void setPrecioDiario(float precioDiario) {
		this.precioDiario = precioDiario;
	}

	public void setFechaHoraRetiroPrevisto(Date fechaHoraRetiroPrevisto) {
		this.fechaHoraRetiroPrevisto = fechaHoraRetiroPrevisto;
	}

	public void setFechaHoraDevolucionPrevista(Date fechaHoraDevolucionPrevista) {
		this.fechaHoraDevolucionPrevista = fechaHoraDevolucionPrevista;
	}

	public void setFechaHoraRetiroReal(Date fechaHoraRetiroReal) {
		this.fechaHoraRetiroReal = fechaHoraRetiroReal;
	}

	public void setFechaHoraDevolucionReal(Date fechaHoraDevolucionReal) {
		this.fechaHoraDevolucionReal = fechaHoraDevolucionReal;
	}

	public void setEstadoAlquiler(String estadoAlquiler) {
		this.estadoAlquiler = estadoAlquiler;
	}

	public void setCuil(String cuil) {
		this.cuil = cuil;
	}
}
