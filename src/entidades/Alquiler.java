package entidades;
import java.sql.Date;

public class Alquiler {

//DECLARACION DE VARIABLES
	
	
	int		idAlquiler;
	
	double costoDesperfecto,
	costoDevolucionTardia;
	
	float	precioDiario;
	
	Date	fecRetiroPrevisto,
			fecDevPrevista,
			fecRetiroReal,
			fecDevReal;
			
	Auto auto; //SE SETEA EN EL SEGUNDO C.U
	Modelo modelo;
	Sucursal sucursal;
	PlanDePago plan;
	Usuario usuario;

	Estado estado;
	
	public enum Estado{
		reservado,
		cancelado,
		anulado,
		abierto,
		inspeccion,
		cerrado
	}
	
	//GETTER Y SETTER
	
	public int getIdAlquiler() {
		return idAlquiler;
	}
	public double getCostoDesperfecto() {
		return costoDesperfecto;
	}
	public double getCostoDevolucionTardia() {
		return costoDevolucionTardia;
	}
	public float getPrecioDiario() {
		return precioDiario;
	}
	public Date getFecRetiroPrevisto() {
		return fecRetiroPrevisto;
	}
	public Date getFecDevPrevista() {
		return fecDevPrevista;
	}
	public Date getFecRetiroReal() {
		return fecRetiroReal;
	}
	public Date getFecDevReal() {
		return fecDevReal;
	}
	public Auto getAuto() {
		return auto;
	}
	public Modelo getModelo() {
		return modelo;
	}
	public Sucursal getSucursal() {
		return sucursal;
	}
	public PlanDePago getPlan() {
		return plan;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public Estado getEstado() {
		return estado;
	}
	
	//////////////////////////////////////////
	
	public void setEstado(Estado estado) {
		this.estado = estado;
	}
	public void setIdAlquiler(int idAlquiler) {
		this.idAlquiler = idAlquiler;
	}
	public void setCostoDesperfecto(double costoPorDaños) {
		this.costoDesperfecto = costoPorDaños;
	}
	public void setCostoDevolucionTardia(double costoDevolucionTardia) {
		this.costoDevolucionTardia = costoDevolucionTardia;
	}
	public void setPrecioDiario(float precioDiario) {
		this.precioDiario = precioDiario;
	}
	public void setFecRetiroPrevisto(Date fecRetiroPrevisto) {
		this.fecRetiroPrevisto = fecRetiroPrevisto;
	}
	public void setFecDevPrevista(Date fecDevPrevista) {
		this.fecDevPrevista = fecDevPrevista;
	}
	public void setFecRetiroReal(Date fecRetiroReal) {
		this.fecRetiroReal = fecRetiroReal;
	}
	public void setFecDevReal(Date fecDevReal) {
		this.fecDevReal = fecDevReal;
	}
	public void setAuto(Auto auto) {
		this.auto = auto;
	}
	public void setModelo(Modelo modelo) {
		this.modelo = modelo;
	}
	public void setSucursal(Sucursal sucursal) {
		this.sucursal = sucursal;
	}
	public void setPlan(PlanDePago plan) {
		this.plan = plan;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	
}
