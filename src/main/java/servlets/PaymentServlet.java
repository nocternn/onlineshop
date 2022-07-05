package servlets;

import jakarta.servlet.http.HttpServlet;
import java.util.Scanner;

import java.net.URL;
import java.nio.file.Path;
import java.sql.ResultSet;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append(createHTML());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected String createHTML()
	{
		return "<html>" 
				+__includeHTML("rss/PaymentServlet/style.html") 
				+__includeHTML("rss/PaymentServlet/functionalities.html") 
				+ AddProduct(Arrays.asList(1, 2)) 
				+ "</html>";
	}
	
	protected String __includeHTML(String HTMLPath)
	{
		StringBuilder output = new StringBuilder("");
		
		// From Class, the path is relative to the package of the class unless
		// you include a leading slash, so if you don't want to use the current
		// package, include a slash like this:
		InputStream header = getClass().getResourceAsStream(HTMLPath);
		try
		{
			Scanner myReader = new Scanner(header);
			while (myReader.hasNextLine()) {
				output.append(myReader.nextLine());
			}
			myReader.close();
		}
		catch (Exception e)
		{
			System.err.print("Error while reading " + HTMLPath + ": " + e.getMessage());
		}
		
		return output.toString();
	}
	
	// TODO: Query the database, not hardcoding.
	// It only run when you have bird.jpg at your $HOME directory
	protected String AddProduct(List<Integer> productID)
	{
		String cartItems = "";

		SQLite s = new SQLite("onlineshop.db");
		String imgLink = "", imgName = "", price = "";
		
		try
		{
			for (int iii=0; iii<productID.size(); ++iii)
			{
				ResultSet r = s.Query("Select image, product_name, price from product where product_id == " + productID.get(iii).toString() +" limit 1;");
				imgLink = r.getString("Image");
				imgName = r.getString("Product_Name");
				price = r.getString("price");
				
				cartItems += "<tr>"
								+ "<td>"
								+ "<img src=\"" + imgLink + "\" alt=" + imgName + " width=\"100\" height=\"100\">"
								+ "</td>"
																
								+ "<td>"
								+ price
								+ "</td>"

								+ "<td>"
								+ "<input id=\'input" + imgName + "\' type=number placeholder=1 min=1>"
								+ "</td>"
	
								+ "<td>"
								+ "<button onclick=\"increment('" + imgName + "')\">+</button>"
								+ "</td>"
	
								+ "<td>"
								+ "<button onclick=\"decrement('" + imgName + "')\">-</button>"
								+ "</td>"
								+ "</tr>"
								
								+ "<tr>"
									+ "<td>"
									+ imgName
									+ "</td>"
								+ "</tr>";
			}
		}
		catch (Exception e)
		{
			System.out.println("Weird");
		}
		
		
		String productsTable = "<table> "
							+ cartItems
							+ "</table>";
		
		return productsTable ;
	}
	
}
