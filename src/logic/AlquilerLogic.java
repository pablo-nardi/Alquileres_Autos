package logic;
import entidades.Alquiler;

import java.sql.SQLException;



import datos.DatosAlquiler;


public class AlquilerLogic {
	
	Alquiler alq;
	DatosAlquiler da;
	
	public AlquilerLogic() {
		alq = new Alquiler();
		da = new DatosAlquiler();
	}
	
	public void addAlquiler(Alquiler alq) throws SQLException {
		da.addAlquiler(alq);
	}
	
}
