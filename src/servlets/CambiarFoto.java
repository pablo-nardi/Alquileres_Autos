package servlets;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet({"/CambiarFoto/*"})
public class CambiarFoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CambiarFoto() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			switch(request.getPathInfo()) {
			case "/upload":
				/*String uploadPath = getServletContext().getRealPath("")  + UPLOAD_DIRECTORY;//+ File.separator
				String uploadPath = "/home/pablo/git/Alquileres_Autos/WebContent/IMAGENES/Modelos";
				File uploadDir = new File(uploadPath);
				if (!uploadDir.exists()) uploadDir.mkdir();
				
				for (Part part : request.getParts()) {
					String fileName = part.getSubmittedFileName();
				    part.write(uploadPath + File.separator + fileName);
				}
				
				response.sendRedirect("/Alquileres_Autos/prueba.jsp");*/
				
				response.sendRedirect("/Alquileres_Autos/prueba.jsp");
				
				break;
			case "/select":
				
				response.sendRedirect("/Alquileres_Autos/NewFile.jsp");
				break;
			}
			
			
			}catch (Exception e) {response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
	}

}
