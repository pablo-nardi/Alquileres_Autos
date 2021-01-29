package logic;

import entidades.Sucursal;

import java.sql.SQLException;
import java.util.LinkedList;

import datos.DatosSucursal;

public class SucursalLogic {
	DatosSucursal ds;
	public SucursalLogic() {
		ds = new DatosSucursal();
	}
	public LinkedList<Sucursal> getAll() throws SQLException{
		return ds.getAll();
	}/*
	public Sucursal getOne(int id) throws SQLException{
		return ds.getOne(id);
	}
	public void addSucursal(Sucursal suc) throws SQLException{
		ds.addSucursal(suc);
	}
	public void updateSucursal(Sucursal suc) throws SQLException{
		ds.updateSucursal(suc);
	}
	public void deleteSucursal(int id) throws SQLException{
		ds.deleteSucursal(id);
	}*/
}
