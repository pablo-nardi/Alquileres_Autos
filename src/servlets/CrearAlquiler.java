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
	AutoLogic aul;
	int num;
	
	
    public CrearAlquiler() {
        super();
        al = new AlquilerLogic();
        ul = new UsuarioLogic();
        ppl = new PlanDePagoLogic();
        alq = new Alquiler();
        aul = new AutoLogic();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session = request.getSession();
			String estado = (String) session.getAttribute("estado");
			
			alq = (Alquiler) session.getAttribute("alquiler");
			
			num = ppl.getId(	alq.getPlan().getEntidadCrediticia(),
												alq.getPlan().getNombreTarjeta(),
												alq.getPlan().getCantCuotas()
											 )
									;
			if(num != 0) {
		
				alq.setEstado(Alquiler.Estado.valueOf("reservado"));
				
				alq.getPlan().setIdPlan(num);
				
				alq.setAuto(aul.getOne("generico"));
				
				//VAlido si ya existe el usuario o hay que crearlo
				if(estado.toUpperCase().equals("A")) {
					ul.addUser((Usuario) session.getAttribute("usuario"));
				}else if(estado.toUpperCase().equals("M")) {
					ul.updateUser((Usuario) session.getAttribute("usuario"));
				}
				
				//guardo alquiler
				al.addAlquiler(alq);
			}else {
				throw new Exception("No se encontro el plan que selecciono");
			}
			
			
			
			
			
			
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
		}catch (Exception e) {
			response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
		
	}

}
