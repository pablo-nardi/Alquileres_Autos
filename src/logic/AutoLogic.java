package logic;

import entidades.Auto;

import java.sql.SQLException;
import java.util.LinkedList;

import datos.DatosAutos;

public class AutoLogic {
	DatosAutos da = null;
	
	public AutoLogic() {
		da = new DatosAutos();
	}
	public LinkedList<Auto> getAll() throws SQLException{
		return da.getAll();
	}
}
