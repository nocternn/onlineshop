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
        // TODO Auto-generated constructor stub
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
		String updateUserInfo =  "Insert into Customer (Cus_name, Address, PhoneNumber) values" +  "(?, ?, ?);";
		
		try {
			java.sql.PreparedStatement s = SQLite.get("onlineshop.db").prepareStatement(updateUserInfo); 
			s.setString(1,request.getParameter("name").toString());
			s.setString(2,request.getParameter("address").toString());
			s.setString(3,request.getParameter("phone").toString());
			int result = s.executeUpdate();
			System.out.println(result);
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
}

