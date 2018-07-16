package controller.compras;

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
import model.entity.Compras;
import model.entity.Mercaderia;

@SuppressWarnings("serial")
public class ComprasControllerDelete extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccessControllerPermit.pruebita(request, response);
			PersistenceManager pm = PMF.get().getPersistenceManager();
			try{
				response.setContentType("text/plain");
			if( request.getParameter("compraId") != null ){
				Key k = KeyFactory.createKey(Compras.class.getSimpleName(), new Long(request.getParameter("compraId")).longValue());
				Compras a = pm.getObjectById(Compras.class, k);
				if(a!=null){
					a.setStatus(false);
					
					Mercaderia afectada = a.getProductIdObject(a.getProductId());
					afectada.disminuirStockCompra(a.getCostoU(), a.getCantidad());
					a.setCantidad(0);
					a.setCostoU(0);
				}
				
			}
			response.sendRedirect("/compras");
			}catch(Exception e){
					System.out.println(e);
				}
			
				 finally{
					pm.close();
				}
		
	}
}
