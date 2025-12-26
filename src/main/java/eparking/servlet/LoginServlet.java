package eparking.servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import eparking.model.User;
import eparking.service.AuthService;



/**
 * Servlet implementation class LoginServlet
 */

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AuthService authService;

	
    public LoginServlet() {
        super();
        authService = new AuthService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("userlogged") != null) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }
		
    	request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
    	String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			User user = new User();
			user.setUserName(username);
			user.setPassword(password);
			
			User userlogged = authService.login(user);
			
			HttpSession session = request.getSession();
			session.setAttribute("userlogged", userlogged);
			response.sendRedirect(request.getContextPath() + "/home");
			
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
	}

}
