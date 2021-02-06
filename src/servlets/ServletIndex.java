package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ServletIndex/*")
public class ServletIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletIndex() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		switch(request.getPathInfo()) {
		case "/buscarLocalidad":
			response.sendRedirect("/Alquileres_Autos/index.jsp?id="+request.getParameter("selectProvincia"));
			break;
			
		case "/buscarModelos":
			getServletContext().getRequestDispatcher("/MostrarModelos.jsp").forward(request, response);
			break;
			
		}
		
		
	}

}