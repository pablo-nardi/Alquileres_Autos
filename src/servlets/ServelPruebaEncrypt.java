package servlets;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.sql.SQLException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.*;
import logic.*;

@WebServlet("/ServelPruebaEncrypt")
public class ServelPruebaEncrypt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServelPruebaEncrypt() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		KeyPairGenerator keyPairGen;
		try {
			
			/*
			keyPairGen = KeyPairGenerator.getInstance("RSA");
			
			keyPairGen.initialize(2048);
			
			//what it is?
			KeyPair pair = keyPairGen.generateKeyPair() ;
			
			PublicKey publicKey = pair.getPublic();

			Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding") ;
			
			cipher.init(Cipher.ENCRYPT_MODE, publicKey);
			
			
			byte[] input = request.getParameter("txtCodif").toString().getBytes();
			
			//Adding data to cipher
			cipher.update(input);
			
			byte[] cipherText = cipher.doFinal();
			
			Usuario user = new Usuario();
			
			user.setCuil("555555");
			user.setNombre("encriptado");
			user.setCalle("encrip");
			user.setCiudad("una ciudad");
			user.setRol("Administrador");
			user.setCodigoPostal("2000");
			user.setPassword(cipherText.toString());
			
			UsuarioLogic lo = new UsuarioLogic();
			
			lo.addUser(user);
			*/
			
			//////////////////
			Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding") ;
			keyPairGen = KeyPairGenerator.getInstance("RSA");
			
			keyPairGen.initialize(2048);
			
			//what it is?
			KeyPair pair = keyPairGen.generateKeyPair() ;
			UsuarioLogic lo = new UsuarioLogic();
			
			PrivateKey privateKey = pair.getPrivate();
			
			cipher.init(Cipher.DECRYPT_MODE, privateKey);
			
			byte[] decipheredText = cipher.doFinal(lo.getOne("555555").getPassword().getBytes());
			
			request.setAttribute("deciphered", decipheredText.toString());
			
			getServletContext().getRequestDispatcher("/prueba.jsp").forward(request, response);
			
		} catch (NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeyException | IllegalBlockSizeException | BadPaddingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
