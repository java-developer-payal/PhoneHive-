package com.servlet;

import java.io.IOException;
import com.conn.DbConnection;
import com.dao.UserDAO;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String pass = req.getParameter("password");
		
		UserDAO dao = new UserDAO(DbConnection.getConn());
		User u = dao.loginUser(email, pass);
		HttpSession session = req.getSession();
		if(u != null) {	
			session.setAttribute("user", u);	
			resp.sendRedirect("index.jsp");
//			System.out.println("User is available = " +u);
		}
		else {
			session.setAttribute("inavlidMsg","Invalide Email & Password");	
			resp.sendRedirect("login.jsp"); 
//			System.out.println("User is not available = " +u);
		}
	}

}
