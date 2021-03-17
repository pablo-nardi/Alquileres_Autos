package logic;

import java.sql.SQLException;
import java.util.LinkedList;

import datos.DatosPlanesDePago;
import entidades.Alquiler;
import entidades.PlanDePago;

public class PlanDePagoLogic {
	DatosPlanesDePago dpp = null;
	
	public PlanDePagoLogic() {
		dpp = new DatosPlanesDePago();
	}
	public LinkedList<PlanDePago> getAll()throws SQLException{
		return dpp.getAll();
	}
	/* ESTE METODO SE USA PARA TRAER ALGUNOS DATOS DE PLANES PARA BuscarCliEnPlanes.jsp*/
	public LinkedList<PlanDePago> getPlanes() throws SQLException{
		return dpp.getPlanes();
	}
	public PlanDePago getOne(int id) throws SQLException{
		return dpp.getOne(id);
	}
	public int getId (String entidad, String tarjeta, int cuotas) throws SQLException{
		return dpp.getId(entidad, tarjeta, cuotas);
	}
	public void addPlanDePago(PlanDePago plan) throws SQLException {
		dpp.addPlan(plan);
	}
	public void updatePlanDePago(PlanDePago plan) throws SQLException {
		dpp.updatePlan(plan);
	}	
	public void deletePlanDePago(int id) throws SQLException {
		dpp.deletePlan(id);
	}
	public LinkedList<PlanDePago> getBancos() throws SQLException {
		return dpp.getBancos();
	}
	public LinkedList<PlanDePago> getTarjetas() throws SQLException {
		return dpp.getTarjetas();
	}
	public LinkedList<Alquiler> getAlqFromPlanes(String nomPlan, String entCred, String nomTar) throws SQLException{
		return dpp.getAlqFromPlanes(nomPlan, entCred, nomTar);
	}
}
