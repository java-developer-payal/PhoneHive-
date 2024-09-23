package com.servlet;

import java.io.IOException;

import com.conn.DbConnection;
import com.dao.ContactDAO;
import com.entity.Contact;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/update")
public class EditContact extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cid = Integer.parseInt(req.getParameter("cid"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phno = req.getParameter("phno");
		String about = req.getParameter("about");
		
		Contact c = new Contact();
		c.setId(cid);
		c.setName(name);
		c.setEmail(email);
		c.setPhno(phno);
		c.setAbout(about);
		
		ContactDAO dao = new ContactDAO(DbConnection.getConn());
		HttpSession session = req.getSession();
		boolean f = dao.updateContact(c);
		if(f) {
			session.setAttribute("succMsg", "Contact Updated Sucessfully.....");
			resp.sendRedirect("viewContact.jsp");
		}
		else {
			session.setAttribute("failedMsg", "!!! Something went worng on server !!!");
			resp.sendRedirect("editcontact.jsp?cid="+cid);
		}
		
		
		
	}

}
