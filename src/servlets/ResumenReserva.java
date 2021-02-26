package servlets;

import java.io.IOException;
import java.sql.Date;

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
    public ResumenReserva() {
        super();
        user = new Usuario();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		HttpSession session = request.getSession();
		user = (Usuario) session.getAttribute("usuario");
		
		user.setNumUltTarjeta(request.getParameter("txtNumTarjeta"));
		user.setNombreUltTarjeta(request.getParameter("txtTitular"));
		//user.setVencUltTarjeta(Date.valueOf(request.getParameter("selectMes" + "selectYear")));
		
		request.getRequestDispatcher("ResumenReserva.jsp").forward(request, response);
		
	}

}
