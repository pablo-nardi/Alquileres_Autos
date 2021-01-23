package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ServletABMProvincia/*")
public class ServletABMProvincia extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletABMProvincia() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		//try {
			switch(request.getPathInfo()) {
			case "/nuevo":
				//mapearADatos(request);
				//ul.addUser(user);
				response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje=hola");
				break;
			case "/editar":
				//mapearADatos(request);
				//ul.updateUser(user);
				response.sendRedirect("/Alquileres_Autos/ABMUsuario.jsp");
				break;
			case "/eliminar":
					//ul.deleteUser(request.getParameter("id"));
					response.sendRedirect("/Alquileres_Autos/ABMUsuario.jsp");
			}
		//}catch (SQLException e) {
			//response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
	}

}
