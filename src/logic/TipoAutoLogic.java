package logic;


import java.util.LinkedList;

import datos.DatosTiposAuto;
import entidades.TipoAuto;

public class TipoAutoLogic {
	DatosTiposAuto datosTipoAuto;
	
	public TipoAutoLogic(){
		datosTipoAuto = new DatosTiposAuto();
	}
	public void addTipoAuto(TipoAuto tipo) {
		datosTipoAuto.addTipoAuto(tipo);
	}
	public LinkedList<TipoAuto> getAll(){
		return datosTipoAuto.getAll();
	}
}
