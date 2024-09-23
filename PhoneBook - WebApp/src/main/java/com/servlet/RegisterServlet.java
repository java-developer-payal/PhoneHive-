package com.servlet;

import java.io.IOException;

import com.conn.DbConnection;
import com.dao.UserDAO;
import com.entity.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		
		User u = new User(name, email, password,confirmPassword);
		
		UserDAO dao = new UserDAO(DbConnection.getConn());
		boolean f = dao.userRegister(u);
		
		HttpSession session = request.getSession();
		if(f) {
			session.setAttribute("sucssMsg", "User Register Sucessfully.....");
			response.sendRedirect("register.jsp");
//			System.out.print("User Registred Sucessfully.....");
 
		}
		else {
			session.setAttribute("errorMsg", "Registration failed. Please try again.");
			response.sendRedirect("register.jsp");
//			System.out.print("User Not Registred Server problem");
		}
	}
}
