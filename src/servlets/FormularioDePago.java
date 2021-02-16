package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FormularioDePago")
public class FormularioDePago extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FormularioDePago() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		request.getRequestDispatcher("WEB-INF/FormularioDePago.jsp").forward(request, response);
		
	}

}
