package logic;


import java.sql.SQLException;
import java.util.LinkedList;

import datos.DatosTiposAuto;
import entidades.TipoAuto;

public class TipoAutoLogic {
	DatosTiposAuto dta;
	
	public TipoAutoLogic(){
		dta = new DatosTiposAuto();
	}
	public void addTipoAuto(TipoAuto tipo)throws SQLException {
		dta.addTipoAuto(tipo);
	}
	public LinkedList<TipoAuto> getAll()throws SQLException{
		return dta.getAll();
	}
	public TipoAuto getOne(int id)throws SQLException{
		return dta.getOne(id);
	}
	public void updateTipoAuto(TipoAuto tipo)throws SQLException{
		dta.updateTipoAuto(tipo);
	}
	public void deleteTipoAuto(int id)throws SQLException{
		dta.deleteTipoAuto(id);
	}
}
