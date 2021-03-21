package servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.*;
import logic.*;

@WebServlet("/CargarConductor")
public class CargarConductor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Alquiler alq = null;
	ConductorLogic cl = null;
	Conductor con = null;
	AlquilerConductor alqCon = null;   
	
    public CargarConductor() {
        super();
        alq = new Alquiler();
        cl = new ConductorLogic();
        con = new Conductor();
        alqCon = new AlquilerConductor();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			alq = (Alquiler) session.getAttribute("alquiler");
			LinkedList<Cantidad> cantidades = new LinkedList<>();  //ESTO SE HACE PARA PORDER CARGAR TODOS LOS EXTRAS QUE QUIERA
			
			if(validar(request)) {
				mapearADatos(request);
				
				
				alqCon.setDni(con.getDni());
				alqCon.setIdAlquiler(alq.getIdAlquiler());
				
				
				session.setAttribute("alquiler", alq);
				session.setAttribute("conductor", con);
				session.setAttribute("alqcon",alqCon );
				session.setAttribute("cantidades", cantidades);
				session.setAttribute("preOriginal", alq.getPrecioDiario());  //VAR DOUBLE QUE TIENE EL PRECIO ORIGINAL DEL ALQUILER ANTES DE LOS EXTRAS
				
				request.getRequestDispatcher("CargarExtras.jsp").forward(request, response);
			}else {
				throw new Exception("Algo salio mal en la validacion");
			}
			
		}catch (Exception e) {response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
		
		
		
	}
	private void mapearADatos(HttpServletRequest req) {
		con.setDni(req.getParameter("txtDni"));
		con.setNombreApellido(req.getParameter("txtNomApe"));
		con.setCelular(req.getParameter("txtCel"));
		con.setFecLic(Date.valueOf(req.getParameter("txtFechaLic")));
		con.setFecNac(Date.valueOf(req.getParameter("txtFechaNac")));
		con.setMail(req.getParameter("txtMail"));
		con.setNumLicencia(req.getParameter("txtLicencia"));
		
		
		
	}
	public boolean validar(HttpServletRequest req) throws Exception{
		
		boolean estado = false;
		int a1,m1,d1;
		a1 = Integer.parseInt(req.getParameter("txtFechaNac").subSequence(0, 4).toString()) ;
		m1 = Integer.parseInt(req.getParameter("txtFechaNac").subSequence(5, 7).toString()) ;
		d1 = Integer.parseInt(req.getParameter("txtFechaNac").subSequence(8,req.getParameter("txtFechaNac").length() ).toString()) ;
		Calendar 	hoy = Calendar.getInstance();

		if(hoy.get(Calendar.YEAR) - a1 < 18) {
			throw new Exception("El conductor debe ser mayor a 18");
		}else if(hoy.get(Calendar.YEAR) - a1 > 18) {
			estado = true;
		}else{
			if(m1 > (hoy.get(Calendar.MONTH) + 1)) {
				throw new Exception("El conductor debe ser mayor a 18");
			}else if(m1 < hoy.get(Calendar.MONTH)){
				estado = true;
			}else {
				if(d1 > (hoy.get(Calendar.DAY_OF_MONTH) + 1)) {
					throw new Exception("El conductor debe ser mayor a 18");
				}else {
					estado = true;
				}
			}
		}
		
		
		return estado;
	}

}
