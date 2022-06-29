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
				+ AddProduct(Arrays.asList("bird.jpg", "invisible brain.jpg")) 
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
	protected String AddProduct(List<String> productName)
	{
		String cartItems = "";

		SQLite s = SQLite.singleton();
		ResultSet r = s.Query("Select image, product_name from product limit 1;");
		String imgLink = "";
		String imgName = "";
		try
		{
			imgLink = r.getString("Image");
			imgName = r.getString("Product_Name");
		}
		catch (Exception e)
		{
			System.out.println("Weird");
		}
		
		for (int iii=0; iii<productName.size(); ++iii)
			cartItems += "<tr>"
							+ "<td>"
							+ "	<img src=\"" + imgLink + "\" alt=" + productName.get(iii) + " width=\"100\" height=\"100\">"
							+ "</td>"
							
							+ "<td>"
							+ "<input id=\'" + productName.get(iii) + "\' type=number placeholder=1 min=1>"
							+ "</td>"

							+ "<td>"
							+ "<button onclick=\"increment('" + productName.get(iii) + "')\">+</button>"
							+ "</td>"

							+ "<td>"
							+ "<button onclick=\"decrement('" + productName.get(iii) + "')\">-</button>"
							+ "</td>"
							+ "</tr>"
							
							+ "<tr>"
								+ "<td>"
								+ imgName
								+ "</td>"
							+ "</tr>";
		
		String productsTable = "<table> "
							+ cartItems
							+ "</table>";
		
		return productsTable ;
	}
	
}
