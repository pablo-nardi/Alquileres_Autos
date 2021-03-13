package logic;
import entidades.*;

import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.LinkedList;

import datos.*;


public class AlquilerLogic {
	
	DatosAlquiler da;
	DatosConductor dc;
	DatosExtras de;
	
	public AlquilerLogic() {
		da = new DatosAlquiler();
		dc= new DatosConductor ();
		de= new DatosExtras();
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
	public void updateAlquiler(Alquiler alq, Conductor con, AlquilerConductor ac, LinkedList<Cantidad> cantidades) throws Exception {
		//updatealquiler
		alq.setEstado(Alquiler.Estado.abierto);
		/*
		java.util.Date date = Calendar.getInstance().getTime();
		
		String fecha = date.toString();
		
		alq.setFecRetiroReal(Date.valueOf(fecha));
		*/
		
		
		da.updateAlquiler(alq);
		
		//CONDUCTOR, PRIMERO GETONE, DESPUES INSERT O UPDATE
		
		if(dc.buscar(con.getDni())) {
			dc.updateConductor(con);
		}else {
			dc.addConductor(con);		
		}
	
		
		//INESRTAR ALQCON
		
		dc.addAlqCon(ac);
		
		//INSERTAR CANTIDADES
		if(!cantidades.isEmpty()) {
			de.addCantidades(cantidades);
		}
			
		
		
		
	}
}
