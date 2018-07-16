package controller.roles;

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
import model.entity.Role;

@SuppressWarnings("serial")
public class RolesControllerDelete extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccessControllerPermit.pruebita(req, resp);
		try{
		resp.setContentType("text/plain");		
		final PersistenceManager pm = PMF.get().getPersistenceManager();
		
		Key k = KeyFactory.createKey(Role.class.getSimpleName(), new Long(req.getParameter("roleId")).longValue());
		   Role a = pm.getObjectById(Role.class, k);
		
		   if(a.getName().equalsIgnoreCase("Administrador"))
			   resp.sendRedirect("/roles");
		   else
			   pm.deletePersistent(a);
		   resp.sendRedirect("/roles");
			
		}catch(Exception e){}
		}
	
	
}
