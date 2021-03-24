package servlets;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import entidades.Modelo;
import logic.ModeloLogic;

@WebServlet({"/CambiarFoto/*"})
@MultipartConfig(fileSizeThreshold = 6291456, // 6 MB
maxFileSize = 10485760L, // 10 MB
maxRequestSize = 20971520L // 20 MB
)
public class CambiarFoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ModeloLogic ml;
	Modelo mod;
       
    public CambiarFoto() {
        super();
        ml = new ModeloLogic();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			mod = ml.getOne(Integer.parseInt(request.getParameter("id")));
			switch(request.getPathInfo()) {
			case "/upload":
				//String uploadPath = getServletContext().getRealPath("")  + UPLOAD_DIRECTORY;//+ File.separator
				String uploadPath = "/home/pablo/git/Alquileres_Autos/WebContent/IMAGENES/Modelos";
				File uploadDir = new File(uploadPath);
				if (!uploadDir.exists()) uploadDir.mkdir();
				
				for (Part part : request.getParts()) {
					String fileName = part.getSubmittedFileName();
				    part.write(uploadPath + File.separator + fileName);
				}
				
				response.sendRedirect("/Alquileres_Autos/CambiarFoto.jsp");
				
				//response.sendRedirect("/Alquileres_Autos/prueba.jsp");
				
				break;
			case "/seleccion":
				mod.setFotoModelo("IMAGENES/Modelos/" + request.getParameter("foto"));
				ml.update(mod);
				response.sendRedirect("/Alquileres_Autos/ABMModelos.jsp");
				break;
			}
			
			
			}catch (Exception e) {response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
	}

}
