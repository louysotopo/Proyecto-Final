package controller.access;

import java.io.IOException;


import javax.jdo.PersistenceManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

import controller.PMF;
import model.entity.Access;

@SuppressWarnings("serial")
public class AccessControllerDelete extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		AccessControllerPermit.pruebita(req, resp);
		try{
		resp.setContentType("text/plain");		
		final PersistenceManager pm = PMF.get().getPersistenceManager();
		
		Key k = KeyFactory.createKey(Access.class.getSimpleName(), new Long(req.getParameter("accessId")).longValue());
		Access a = pm.getObjectById(Access.class, k);
		
		   pm.deletePersistent(a);
		   resp.sendRedirect("/access");
		}catch(Exception e){}	
		}
}
