package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BuscarLocalidad")
public class BuscarLocalidad extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BuscarLocalidad() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("FormularioFacturacion.jsp").forward(request, response);
	}

}
