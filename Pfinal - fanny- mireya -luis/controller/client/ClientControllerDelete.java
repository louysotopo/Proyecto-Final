package controller.client;


import java.io.IOException;

import javax.servlet.http.*;


import javax.servlet.*;
import javax.jdo.PersistenceManager;
import model.entity.*;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

import controller.*;
import controller.access.AccessControllerPermit;

@SuppressWarnings("serial")
public class ClientControllerDelete extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		
		
			final  PersistenceManager pm = PMF.get().getPersistenceManager();
			
						// aqui termina conprobacion
		try{
			if(AccessControllerPermit.pruebita(request, response)){
		Key k = KeyFactory.createKey(Client.class.getSimpleName(), new Long(request.getParameter("Id")).longValue()); //aqui
		Client  a = pm.getObjectById(Client.class, k);
		pm.deletePersistent (a);
			}
		
	   response.sendRedirect("/client");
		}catch(Exception e){}
					
	}
}