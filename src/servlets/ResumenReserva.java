package servlets;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.*;
import logic.*;

@WebServlet({ "/ResumenReserva", "/resumenreserva" })
public class ResumenReserva extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Usuario user = null;
	PlanDePago plan = null;
	Alquiler alq = null;
    public ResumenReserva() {
        super();
        plan = new PlanDePago();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		HttpSession session = request.getSession();
		
		//OBTENGO USUARIO DE LA SESION
		
		user = (Usuario) session.getAttribute("usuario");
		
		user.setNumUltTarjeta(request.getParameter("txtNumTarjeta"));
		user.setNombreUltTarjeta(request.getParameter("txtTitular"));
		String fecha = request.getParameter("selectYear") +"-"+ request.getParameter("selectMes");
		user.setVencUltTarjeta(fecha);
		user.setRol("cliente");
		
		session.setAttribute("usuario", user);
		
		//CREO PLAN DE PAGO Y LO AGREGO A ALQUILER
		 
		plan.setCantCuotas(Integer.parseInt(request.getParameter("selectCuotas")));
		plan.setEntidadCrediticia(request.getParameter("selectBanco"));
		plan.setNombreTarjeta(request.getParameter("selectTarjeta"));
		
		alq = (Alquiler) session.getAttribute("alquiler");
		
		alq.setPlan(plan);
		alq.setUsuario(user);
		session.setAttribute("alquiler", alq);
		
		///////////////////////
		
		request.getRequestDispatcher("ResumenReserva.jsp").forward(request, response);
		
	}

}
