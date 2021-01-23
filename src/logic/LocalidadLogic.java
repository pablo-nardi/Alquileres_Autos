package logic;
import entidades.*;

import java.sql.SQLException;
import java.util.LinkedList;

import datos.*;

public class LocalidadLogic {
	DatosLocalidad dl = new DatosLocalidad();
	
	public LinkedList<Localidad> getLocalidades(int idProv){
		return dl.getLocalidades(idProv);
	}
	public Localidad getOne(int id) throws SQLException {
		return dl.getOne(id);
	}
	public void addLocalidad(Localidad loc) throws SQLException {
		dl.addLocalidad(loc);
	}
	public void updateLocalidad(Localidad loc) throws SQLException {
		dl.updateLocalidad(loc);
	}	
	public void deleteLocalidad(int idLoc) throws SQLException {
		dl.deleteLocalidad(idLoc);
	}
}
