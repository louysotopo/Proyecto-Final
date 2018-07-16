package controller.products;

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
import model.entity.Mercaderia;

@SuppressWarnings("serial")
public class ProductControllerDelete extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try{
			if(AccessControllerPermit.pruebita(request, response)){
			PersistenceManager pm = PMF.get().getPersistenceManager();

			Key k = KeyFactory.createKey(Mercaderia.class.getSimpleName(), new Long(request.getParameter("mercaderiaId")).longValue());
			Mercaderia a = pm.getObjectById(Mercaderia.class, k);
			
			if(a.getCantidad()==0 && a.getCostoU()==0.0)
			pm.deletePersistent(a);
			}
			response.sendRedirect("/products");	
		}catch(Exception e){}
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doGet(request, response);
	}

}

