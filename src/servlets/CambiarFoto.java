package servlets;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
			HttpSession session = request.getSession();
			
			switch(request.getPathInfo()) {
			case "/upload":
				String uploadPath = "/home/pablo/git/Alquileres_Autos/WebContent/IMAGENES/Modelos";
				//String uploadPath = (String) session.getAttribute("dirAbsolute");
				//String UPLOAD_DIRECTORY = "/IMAGENES/Modelos";
				//String uploadPath = getServletContext().getRealPath("")  + UPLOAD_DIRECTORY;//+ File.separator
				/*Path path = Paths.get(getServletContext().getRealPath("")  + UPLOAD_DIRECTORY);
				String p1 = path.getName(0).toString();
				String p2 = path.subpath(0, 3).toString();
				String p3 = path.getRoot().toString();
				String p4 = "Alquileres_Autos/WebContent/IMAGENES/Modelos";
				String p5 = p3+p2+p4;*/
				
				File uploadDir = new File(uploadPath);
				if (!uploadDir.exists()) {
					uploadDir.mkdir();
				}
				
				for (Part part : request.getParts()) {
					String fileName = part.getSubmittedFileName();
				    part.write(uploadPath + File.separator + fileName);
				    mod.setFotoModelo("IMAGENES/Modelos/" + fileName);
				    ml.update(mod);
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
