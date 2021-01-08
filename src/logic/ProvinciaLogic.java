package logic;
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
}
