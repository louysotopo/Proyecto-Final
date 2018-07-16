package controller.ventas;

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
import model.entity.Ventas;
import model.entity.Mercaderia;

@SuppressWarnings("serial")
public class VentasControllerDelete extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccessControllerPermit.pruebita(request, response);
			PersistenceManager pm = PMF.get().getPersistenceManager();
			try{
				response.setContentType("text/plain");
			if( request.getParameter("ventaId") != null ){
				Key k = KeyFactory.createKey(Ventas.class.getSimpleName(), new Long(request.getParameter("ventaId")).longValue());
				Ventas a = pm.getObjectById(Ventas.class, k);
				if(a!=null){
					a.setStatus(false);
					
					Mercaderia afectada = a.getProductIdObject(a.getProductId());
					afectada.aumentarStock(a.getCostoUV(), a.getCantidad());
					
					a.setCantidad(0);
					a.setCostoUV(0);
					a.setPrecioU(0);
				}
					
			}
			response.sendRedirect("/ventas");
			}catch(Exception e){
					System.out.println(e);
				}
			
				 finally{
					pm.close();
				}
		
	}
}
