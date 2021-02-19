package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.TipoAuto;
import logic.TipoAutoLogic;

@WebServlet("/ABMTipoDeAuto")
public class ABMTipoDeAuto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TipoAuto tipo;
	TipoAutoLogic tpl;
       
    public ABMTipoDeAuto() {
        super();
        tipo = new TipoAuto();
        tpl = new TipoAutoLogic();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			switch(request.getPathInfo()) {
			case "/nuevo":
				mapearADatos(request);
				tpl.addTipoAuto(tipo);
				response.sendRedirect("/Alquileres_Autos/ABMTipoDeAuto.jsp");
				break;
			case "/editar":
				mapearADatos(request);
				tpl.updateTipoAuto(tipo);
				response.sendRedirect("/Alquileres_Autos/ABMTipoDeAuto.jsp");
				break;
			case "/eliminar":
				tpl.deleteTipoAuto(Integer.parseInt(request.getParameter("txtIdTipo")));
				response.sendRedirect("/Alquileres_Autos/ABMTipoDeAuto.jsp");
				break;
			case "/cancelar":
				response.sendRedirect("/Alquileres_Autos/ABMTipoDeAuto.jsp");
				break;
			}
		}catch (SQLException e) {
			response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
	}
	private void mapearADatos(HttpServletRequest req) throws NumberFormatException, SQLException {
		
		if(req.getPathInfo().equals("/editar")) {
			tipo.setId_Tipo(Integer.parseInt(req.getParameter("txtIdTipo")));
		}
			
			tipo.setNombreTipo(req.getParameter("txtDescripcion"));
		
	}
}
