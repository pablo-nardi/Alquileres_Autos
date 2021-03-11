package logic;

import entidades.*;

import java.sql.SQLException;

import datos.*;

public class ConductorLogic {
	
	DatosConductor dc = null;
	
	public ConductorLogic() {
		dc = new DatosConductor();
	}
	
	public void addConductor(Conductor con) throws SQLException{
		dc.addConductor(con);
	}
	
	
	/////////////////////////////
	
	// TABLA ALQUILER_CONDUCTOR
	
	public void addAlqCon(AlquilerConductor alqCon) throws SQLException{
		dc.addAlqCon(alqCon);
	}
	
}
