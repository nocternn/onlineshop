package servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String clientID = "514770052287-j3u5heaf45imceft1cnnfag7vu8d557i.apps.googleusercontent.com";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String param = request.getParameter("code");

        StringBuilder url = new StringBuilder();
        if (param.equals("login")) {
			// Redirect to Google OAuth
			url.append("https://accounts.google.com/o/oauth2/auth")
			   .append("?client_id=").append(clientID) // the client id from the api console registration
			   .append("&response_type=code")
			   .append("&scope=profile%20email") // scope is the api permissions we are requesting
			   .append("&redirect_uri=http://localhost:8080/onlineshop/login") // the servlet that google redirects to after authorization
			   .append("&access_type=offline") // here we are asking to access to user's data while they are not signed in
			   .append("&approval_prompt=force"); // this requires them to verify which account to use, if they are already signed in
        } else {
        	url.append("http://localhost:8080/onlineshop/welcome");
        	request.getSession().setAttribute("code", "loggedin");
        }
		response.sendRedirect(url.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost (HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {

	}
}
