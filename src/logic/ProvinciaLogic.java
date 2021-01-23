package logic;
import java.sql.SQLException;
import java.util.LinkedList;


import entidades.*;
import datos.*;

public class ProvinciaLogic {
	
	DatosProvincia dp = new DatosProvincia();
	
	public LinkedList<Provincia> getAll(){
		return dp.getAll();
	}
	public Provincia getOne(int id) {
		return dp.getOne(id);
	}
	public void addProvincia(Provincia prov) throws SQLException {
		dp.addProvincia(prov);
	}
	public void updateProvincia(Provincia prov) throws SQLException {
		dp.updateProvincia(prov);
	}	
	public void deleteProvincia(int idProvincia) throws SQLException {
		dp.deleteProvincia(idProvincia);
	}
	
}
