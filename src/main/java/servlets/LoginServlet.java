package servlets;

import java.io.IOException;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
        
        System.out.println(param);

        StringBuilder url = new StringBuilder();
        if (param.equals("login")) {
        	// Debug
        	System.out.println("Log In");
        	
			// Redirect to Google OAuth
			url.append("https://accounts.google.com/o/oauth2/auth")
			   .append("?client_id=").append(Constants.GOOGLE_CLIENT_ID) // the client id from the api console registration
			   .append("&response_type=code")
			   .append("&scope=profile%20email") // scope is the api permissions we are requesting
			   .append("&redirect_uri=http://localhost:8080/onlineshop/login") // the servlet that google redirects to after authorization
			   .append("&access_type=offline") // here we are asking to access to user's data while they are not signed in
			   .append("&approval_prompt=force"); // this requires them to verify which account to use, if they are already signed in

        	request.setAttribute("code", "loggedin");
			response.sendRedirect(url.toString());
			
        } 
        else {
        	
        	System.out.println("Logged In authCode = " + param);
        	
        	String accessToken = getToken(param);
        	
        	GoogleInfo userInfo = new Gson().fromJson(Request.Get(Constants.GOOGLE_LINK_GET_USER_INFO + accessToken)
        			.execute().returnContent().asString()
        			, GoogleInfo.class);

        	HttpSession session = request.getSession();
        	session.setAttribute("UserAccount", userInfo.getEmail());
        	session.setAttribute("code", "loggedin");
        	
        	request.getRequestDispatcher("/").forward(request, response);        	
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost (HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		doGet(req,resp);
		
	}
	
    private static String getToken(final String code) throws IOException, ClientProtocolException, IOException {
    	String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
    	        .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
    	            .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
    	            .add("redirect_uri",Constants.GOOGLE_REDIRECT_URI).add("code", code)
    	            .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
    	        .execute().returnContent().asString();
	    JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
	    String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
	    return accessToken;
    }
}
