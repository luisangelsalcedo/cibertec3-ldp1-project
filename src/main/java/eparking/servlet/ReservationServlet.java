package eparking.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import eparking.dao.ParkingDAO;
import eparking.model.Parking;
import eparking.service.AuthService;

/**
 * Servlet implementation class ReservationServlet
 */
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ParkingDAO parkingDao;
       
    
    public ReservationServlet() {
        super();
        parkingDao = new ParkingDAO();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("get");
		
		HttpSession session = request.getSession(false);
		
		if (session == null || session.getAttribute("userlogged") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return; 
        }		
		
		try {
			List<Parking> parkingList = parkingDao.getAllParkings();
			
			System.out.println(parkingList.size());
			request.setAttribute("parkingList", parkingList);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		request.getRequestDispatcher("createreservation.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
