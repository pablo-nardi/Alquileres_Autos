package logic;

import java.sql.SQLException;
import java.util.LinkedList;

import datos.DatosModelos;
import entidades.Modelo;

public class ModeloLogic {
		DatosModelos dm;
		
		public ModeloLogic() {
			dm = new DatosModelos();
		}
		public void addModelo(Modelo mod) throws SQLException{
			dm.addModelos(mod);
		}
		public LinkedList<Modelo> getAll()throws SQLException {
			return dm.getAll();
		}
		public void update(Modelo mod) throws SQLException{
			dm.update(mod);
		}
		public void delete(int idModelo) throws SQLException {
			dm.delete(idModelo);
		}
		public Modelo getOne(int idModelo)throws SQLException {
			return dm.getOne(idModelo);
		}
}
