package servlets;


import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import datos.*;
import entidades.*;

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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
        String applicationPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
        String uploadFilePath = "/home/pablo/prueba";
        request.setAttribute("applicationPath", applicationPath);
        request.setAttribute("uploadFilePath", uploadFilePath);
        // creates upload folder if it does not exists
        File uploadFolder = new File(uploadFilePath);
        if (!uploadFolder.exists()) {
            uploadFolder.mkdirs();
        }
        getServletContext().getRequestDispatcher("/NewFile.jsp").forward(request, response);*/
		
		try {
			LinkedList<Cantidad> cantidades = new LinkedList<>();
			Cantidad c1 = new Cantidad(5, 2,2);
			Cantidad c2 = new Cantidad(5, 2,2);
			
			cantidades.add(c1);
			cantidades.add(c2);
			
			DatosExtras de = new DatosExtras();
			
			de.addCantidades(cantidades);
			
			
		}catch (SQLException e) {
			response.sendRedirect("/Alquileres_Autos/paginaError.jsp?mensaje="+e.toString());}
		
		
		request.getRequestDispatcher("/prueba.jsp").forward(request, response);
	}

}
