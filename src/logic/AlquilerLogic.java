package logic;
import entidades.Alquiler;

import java.sql.SQLException;
import java.util.LinkedList;

import datos.DatosAlquiler;


public class AlquilerLogic {
	
	DatosAlquiler da;
	
	public AlquilerLogic() {
		da = new DatosAlquiler();
	}
	
	public void addAlquiler(Alquiler alq) throws SQLException {
		da.addAlquiler(alq);
	}
	public LinkedList<Alquiler> buscarAlquiler(String cuil) throws SQLException {
		return da.buscarAlquiler(cuil);
	}
	public Alquiler getAlquiler(int id) throws SQLException{
		return da.getAlquiler(id); 
	}
	
}
