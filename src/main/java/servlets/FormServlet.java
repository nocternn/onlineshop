package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
// Updated web.xml
/**
 * Servlet implementation class FormServlet
 */
@WebServlet("/form")
public class FormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormServlet() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/form.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = (String) request.getSession().getAttribute("UserAccount");
		
		if (email != null)
		{
			try {
				java.sql.PreparedStatement s = SQLite.get("onlineshop.db")
													.prepareStatement("Insert into Customer (Email, Cus_name, Address, PhoneNumber) values (?, ?, ?, ?);"); 
				
				s.setString(1, email);
				s.setString(2,request.getParameter("name").toString());
				s.setString(3,request.getParameter("address").toString());
				s.setString(4,request.getParameter("phone").toString());
				int result = s.executeUpdate();
				System.out.println(result);
			} 
			// NOTE: Will throw when an old customer buys for the second time
			// But it's not important. It failed, just as we want.
			// So, no need to write more code to check constraints.
			catch(SQLException e) {
				e.printStackTrace();
			}
		}
			
		request.getRequestDispatcher("/").forward(request, response);
	}
}

