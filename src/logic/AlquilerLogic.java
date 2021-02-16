package logic;
import entidades.Alquiler;

import javax.servlet.http.HttpServletRequest;

import datos.DatosAlquiler;


public class AlquilerLogic {
	
	Alquiler alq;
	DatosAlquiler da;
	
	public AlquilerLogic() {
		alq = new Alquiler();
		da = new DatosAlquiler();
	}
	
	public void addAlquiler(Alquiler alq) {
		da.addAlquiler(alq);
	}
	public void crearAlquiler(HttpServletRequest req) {
		
		
		//codigo
		
		
		
		addAlquiler(alq);
	}
}
