package logic;
import entidades.*;

import java.util.LinkedList;

import datos.*;

public class LocalidadLogic {
	DatosLocalidad dl = new DatosLocalidad();
	
	public LinkedList<Localidad> getLocalidades(int idProv){
		return dl.getLocalidades(idProv);
	}
}
