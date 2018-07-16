package controller.users;

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
import model.entity.User;

@SuppressWarnings("serial")
public class UsersControllerDelete extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccessControllerPermit.pruebita(req, resp);
		try{
		resp.setContentType("text/plain");		
		final PersistenceManager pm = PMF.get().getPersistenceManager();
		
		Key k = KeyFactory.createKey(User.class.getSimpleName(), new Long(req.getParameter("userId")).longValue());
		   User a = pm.getObjectById(User.class, k);
		
		   pm.deletePersistent(a);
		   resp.sendRedirect("/users");
			
		}catch(Exception e){}
		}
	
	
}

