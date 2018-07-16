package controller.providers;

import java.io.IOException;


import javax.jdo.PersistenceManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

import controller.PMF;
import controller.access.AccessControllerPermit;
import model.entity.Provider;

@SuppressWarnings("serial")
public class ProveedorControllerDelete extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		
			
		final PersistenceManager pm = PMF.get().getPersistenceManager();
		try{
			if(AccessControllerPermit.pruebita(req, resp)){
			resp.setContentType("text/plain");	
		Key k = KeyFactory.createKey(Provider.class.getSimpleName(), new Long(req.getParameter("providerId")).longValue());
		   Provider a = pm.getObjectById(Provider.class, k);
		
		   pm.deletePersistent(a);
			}
		   resp.sendRedirect("/providers");
			
		}catch(Exception e){}
		}
		
	
	
}

