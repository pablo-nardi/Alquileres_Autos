package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Extras;
import logic.ExtrasLogic;

@WebServlet("/ServletABMExtras/*")
public class ServletABMExtras extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Extras extra = null;
    ExtrasLogic el = null;
       
    public ServletABMExtras() {
        super();
        extra = new Extras();
        el = new ExtrasLogic();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			switch(request.getPathInfo()) {
			case "/nuevo":
				mapearADatos(request);
				el.addExtra(extra);
				response.sendRedirect("/Alquileres_Autos/ABMExtras.jsp");
				break;
			case "/editar":
				mapearADatos(request);
				el.updateExtra(extra);
				response.sendRedirect("/Alquileres_Autos/ABMExtras.jsp");
				break;
			case "/eliminar":
				el.deleteExtra(Integer.parseInt(request.getParameter("txtIdExtra")));
				response.sendRedirect("/Alquileres_Autos/ABMExtras.jsp");
				break;
			case "/cancelar":
				response.sendRedirect("/Alquileres_Autos/ABMExtras.jsp");
				break;
			}
		}catch (SQLException e) {
			response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
	}
	private void mapearADatos(HttpServletRequest req) throws NumberFormatException, SQLException {
		
			if(req.getPathInfo().equals("/editar")) {
				extra.setCodigo(Integer.parseInt(req.getParameter("txtIdExtra")));
			}
				
				extra.setDescripcion(req.getParameter("txtDescripcion"));
				extra.setPrecio(Float.parseFloat(req.getParameter("txtPrecio")));
	}

}
