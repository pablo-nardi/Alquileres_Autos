package logic;

import entidades.Auto;
import entidades.Sucursal;

import java.sql.Date;
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
	public  LinkedList<Auto> getAutos(Date fecRet, Date fecDev, Sucursal suc)throws SQLException{
		return da.getAutos(fecRet, fecDev, suc );
	}
	public LinkedList<Auto> getAutosAlt(Date fecRet, Date fecDev)throws SQLException{
		return da.getAutosAlt(fecRet, fecDev);
	}
}
