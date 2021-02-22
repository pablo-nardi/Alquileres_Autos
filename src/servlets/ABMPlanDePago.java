package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.PlanDePago;
import logic.PlanDePagoLogic;

@WebServlet("/ABMPlanDePago/*")
public class ABMPlanDePago extends HttpServlet {
	private static final long serialVersionUID = 1L;
    PlanDePago plan = null;
    PlanDePagoLogic ppl = null;
	
    public ABMPlanDePago() {
        super();
        plan = new PlanDePago();
        ppl = new PlanDePagoLogic();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			switch(request.getPathInfo()) {
			case "/nuevo":
				mapearADatos(request);
				ppl.addPlanDePago(plan);
				response.sendRedirect("/Alquileres_Autos/ABMPlanDePago.jsp");
				break;
			case "/editar":
				mapearADatos(request);
				ppl.updatePlanDePago(plan);
				response.sendRedirect("/Alquileres_Autos/ABMPlanDePago.jsp");
				break;
			case "/eliminar":
				ppl.deletePlanDePago(Integer.parseInt(request.getParameter("txtIdPlan")));
				response.sendRedirect("/Alquileres_Autos/ABMPlanDePago.jsp");
				break;
			case "/cancelar":
				response.sendRedirect("/Alquileres_Autos/ABMPlanDePago.jsp");
				break;
			}
		}catch (SQLException e) {
			response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
	}
	private void mapearADatos(HttpServletRequest req) throws NumberFormatException, SQLException {
		
		if(req.getPathInfo().equals("/editar")) {
			plan.setIdPlan(Integer.parseInt(req.getParameter("txtIdPlan")));
		}
		plan.setNombrePlan(req.getParameter("txtNombrePlan"));
		plan.setEntidadCrediticia(req.getParameter("txtEntidad"));
		plan.setNombreTarjeta(req.getParameter("txtTarjeta"));
		plan.setCantCuotas(Integer.parseInt(req.getParameter("txtCuotas")));
	}
}
