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
		public void addModelo(Modelo mod) {
			dm.addModelos(mod);
		}
		public LinkedList<Modelo> getAll() {
			return dm.getAll();
		}
		public void update(Modelo mod) {
			dm.update(mod);
		}
		public void delete(int idModelo) throws SQLException {
			dm.delete(idModelo);
		}
		public Modelo getOne(int idModelo) {
			return dm.getOne(idModelo);
		}
}
