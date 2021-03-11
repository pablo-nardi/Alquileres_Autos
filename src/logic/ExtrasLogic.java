package logic;

import java.sql.SQLException;
import java.util.LinkedList;

import datos.DatosExtras;
import entidades.Extras;

public class ExtrasLogic {
	DatosExtras de = null;
	
	public ExtrasLogic() {
		de = new DatosExtras();
	}
	
	public LinkedList<Extras> getAll()throws SQLException{
		return de.getAll();
	}
	public Extras getOne(int id) throws SQLException{
		return de.getOne(id);
	}
	public void addExtra(Extras extra) throws SQLException {
		de.addExtra(extra);
	}
	public void updateExtra(Extras prov) throws SQLException {
		de.updateExtra(prov);
	}	
	public void deleteExtra(int id) throws SQLException {
		de.deleteExtra(id);
	}
	public void addCantidad(int cant, int idAlq, int extra)throws SQLException{
		de.addCantidad(cant, idAlq, extra);
	}
}
