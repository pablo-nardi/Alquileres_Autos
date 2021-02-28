package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.*;
import logic.*;

@WebServlet("/CrearAlquiler")
public class CrearAlquiler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AlquilerLogic al;
	UsuarioLogic ul;
	PlanDePagoLogic ppl;
	Alquiler alq;
	
	
    public CrearAlquiler() {
        super();
        al = new AlquilerLogic();
        ul = new UsuarioLogic();
        ppl = new PlanDePagoLogic();
        alq = new Alquiler();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session = request.getSession();
			
			ul.addUser((Usuario) session.getAttribute("usuario")); 
			alq = (Alquiler) session.getAttribute("alquiler");
			alq.getPlan().setIdPlan(ppl.getId(	alq.getPlan().getEntidadCrediticia(),
												alq.getPlan().getNombreTarjeta(),
												alq.getPlan().getCantCuotas()
											 )
									);
			
			
		}catch (SQLException e) {
			response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
		

		
		
		
		
	}

}