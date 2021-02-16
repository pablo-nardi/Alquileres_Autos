package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logic.AlquilerLogic;

@WebServlet("/CrearAlquiler")
public class CrearAlquiler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AlquilerLogic al;
	
	
    public CrearAlquiler() {
        super();
        al = new AlquilerLogic();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		al.crearAlquiler(request);
	}

}
