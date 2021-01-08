package servlets;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import entidades.Modelo;
import entidades.TipoAuto;
import logic.ModeloLogic;
import entidades.Usuario;


@WebServlet({"/ServletABMModelos/*", "/ServletabmModelos/*", "/Servletambmodelos/*", "/servletabmModelos/*"})
public class ServletABMModelos extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Modelo mod;
    TipoAuto tipo;
    ModeloLogic ml;
  
    public ServletABMModelos() {
        super();
        mod = new Modelo();
        ml = new ModeloLogic();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
		
		if(usuario.getRol().toLowerCase().equals("administrador")) {
			
			switch(request.getPathInfo()) {
			case "/nuevo":
				MapearADatos(request);
				ml.addModelo(mod);
				response.sendRedirect("/EjemploWebIntro_2/ABMModelos.jsp");
				//getServletContext().getRequestDispatcher("/ABMModelos.jsp").forward(request, response);
				break;
			case "/editar":
				
				//request.getRequestDispatcher("./Alquileres_Autos/ABMModelos.jsp").forward(request, response); NO
				//Modelo mod = ml.getOne(Integer.parseInt(request.getParameter("id"))); NO
				//request.setAttribute("modEdit", mod); NO
				//response.sendRedirect("/Alquileres_Autos/ABMModelos.jsp?mode=editar&id="+request.getParameter("id")); SI
				MapearADatos(request);
				mod.setIdentificacion(Integer.parseInt(request.getParameter("txtId")));
				ml.update(mod);
				response.sendRedirect("/EjemploWebIntro_2/ABMModelos.jsp");
				
				break;
			case "/eliminar":
				
				
				try {
					ml.delete(Integer.parseInt(request.getParameter("id")));
					response.sendRedirect("/EjemploWebIntro_2/ABMModelos.jsp");
					//getServletContext().getRequestDispatcher("/ABMModelos.jsp").forward(request, response);
					break;
				} catch (NumberFormatException e) {
					e.printStackTrace();
				} catch (SQLException e) {
					//e.printStackTrace();
					response.sendRedirect("/EjemploWebIntro_2/prueba.jsp");
				}
				
			}
			
			
		}else {
			getServletContext().getRequestDispatcher("/index.html");
		}
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	protected void MapearADatos(HttpServletRequest request) {
		mod.setCantEquipajeGrande(Integer.parseInt(request.getParameter("selectEquiGran")));
		mod.setCantEquipajeChico(Integer.parseInt(request.getParameter("selectEquiChico")));
		mod.setCantPasajeros(Integer.parseInt(request.getParameter("txtCantPasajeros")));
		mod.setPrecioPorDia(Float.parseFloat(request.getParameter("txtPrecioPorDia")));
		mod.setDenominacion(request.getParameter("txtDenominacion"));
		mod.setTransmision(request.getParameter("selectTransmision"));
		mod.setAireAcondicionado(request.getParameter("selectAA"));
		mod.getTipoAuto().setId_Tipo(Integer.parseInt(request.getParameter("selectTipo")));
		//FALTA LA FOTO
	}
}