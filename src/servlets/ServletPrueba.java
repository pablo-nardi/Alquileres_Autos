package servlets;


import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;



@WebServlet("/ServletPrueba")
@MultipartConfig(fileSizeThreshold = 6291456, // 6 MB
maxFileSize = 10485760L, // 10 MB
maxRequestSize = 20971520L // 20 MB
)
public class ServletPrueba extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ServletPrueba() {
        super();
        
    }
    /* location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "IMAGENES/Modelos"; //upload
 
    // upload settings
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
 
    /**
     * Upon receiving file upload submission, parses the request to read
     * upload data and saves the file on disk.
     */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		//String uploadPath = getServletContext().getRealPath("")  + UPLOAD_DIRECTORY;//+ File.separator
		//String uploadPath = "/home/pablo/git/Alquileres_Autos/WebContent/IMAGENES/Modelos";
		
	//	String uploadPath = getServletContext().getRealPath("")  + UPLOAD_DIRECTORY;//+ File.separator
		String UPLOAD_DIRECTORY = "/IMAGENES/Modelos";
		Path path = Paths.get(getServletContext().getRealPath("")  + UPLOAD_DIRECTORY);
		String absolute = path.toString();
		request.setAttribute("absolute", absolute);
		//String p1 = path.getName(0).toString();
		//String p2 = path.subpath(0, 2).toString();
		/*File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) uploadDir.mkdir();
		
		for (Part part : request.getParts()) {
			String fileName = part.getSubmittedFileName();
		    part.write(uploadPath + File.separator + fileName);
		}*/
		
		request.getRequestDispatcher("prueba.jsp").forward(request, response);
		
		}catch (Exception e) {response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
	}

}
