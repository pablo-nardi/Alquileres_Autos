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
	public Auto getOne(String patente) throws SQLException{
		return da.getOne(patente);
	}
	public void addAuto(Auto auto) throws SQLException{
		da.addAuto(auto);
	}
	public void updateAuto(Auto auto)throws SQLException {
		da.update(auto);
	}
	public void deleteAuto(String patente)throws SQLException {
		da.delete(patente);
	}
	public  LinkedList<Auto> getAutos(String estado)throws SQLException{
		return da.getAutos(estado);
	}
}
