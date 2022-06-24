package servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

/**
 * Servlet implementation class WelcomeServlet
 */
@WebServlet("/welcome")
public class ProductInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ProductInfoServlet() {
        // TODO Auto-generated constructor stub
    	super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// since we need  dynamic product information so i just pretend that we have a model and data for product and put it here
		
		//ProductModel productModel = new ProductModel();
		//request.setAttribute("products", productModel.findAll()); //get attribute from the object product we created in model
		//request.getRequestDispatcher("ProductInfo.jsp").forward(request, response); // ProductInfo.jsp is the page for product info
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}