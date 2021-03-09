package logic;

import java.sql.SQLException;
import java.util.LinkedList;

import datos.DatosPlanesDePago;
import entidades.PlanDePago;

public class PlanDePagoLogic {
	DatosPlanesDePago dpp = null;
	
	public PlanDePagoLogic() {
		dpp = new DatosPlanesDePago();
	}
	public LinkedList<PlanDePago> getAll()throws SQLException{
		return dpp.getAll();
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
		dpp.updateExtra(plan);
	}	
	public void deletePlanDePago(int id) throws SQLException {
		dpp.deleteExtra(id);
	}
	public LinkedList<PlanDePago> getBancos() throws SQLException {
		return dpp.getBancos();
	}
	public LinkedList<PlanDePago> getTarjetas() throws SQLException {
		return dpp.getTarjetas();
	}
}
