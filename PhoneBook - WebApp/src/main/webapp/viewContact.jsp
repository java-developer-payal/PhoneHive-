<%@page import="java.util.List"%>
<%@page import="com.conn.DbConnection"%>
<%@page import="com.dao.ContactDAO"%>
<%@page import="com.entity.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Contact Page</title>
<%@ include file="components/allCss.jsp" %>


<style type="text/css">
	.crd-ho:hover{
		background-color: brown;
	}
</style>

</head>
<body style="background-color: grey;">
  <%@ include file="components/navebar.jsp" %>
  	<%
	  	if(user == null){
	  		session.setAttribute("inavlidMsg", "!!!  Login is required  !!!");
	  		response.sendRedirect("login.jsp");
	  	}
	  %>
	  
	   <%
	   		String succMsg = (String)session.getAttribute("succMsg");
	   		String errorMsg = (String) session.getAttribute("failedMsg");

	   		if(succMsg!= null)
	   		{%>
	   			<div class= "alert alert-success" role="alert"><%=succMsg%> </div>
	  		 <%
	  		 session.removeAttribute("succMsg");
	   		}
	   		if(errorMsg != null){
	   			%>
	   			<p class="text-danger text-center"><%= errorMsg %></p>
	   			<%
	   	    		session.removeAttribute("failedMsg"); // Clear the error after displaying
	   			}
	   			%>
	  
	<div class="container">
		<div class="row p-4">
			
			<%
			if(user != null)
			{
				ContactDAO dao = new ContactDAO(DbConnection.getConn());
				List<Contact> contact = dao.getAllContacts(user.getId());
				
				for(Contact c : contact){
			%>	
			<div class="col-md-3">		
				<div class="card crd-ho">
					<div class="card-body">
						<h5 style="color: Blue;">
							Name:
							<%=c.getName()%></h5>
						<p style="color: black;">
							Ph no.:
							<%=c.getPhno()%></p>
						<p style="color: black;">
							Email: 
							<%=c.getEmail()%></p>
						<p style="color: black;">
							About: 
							<%=c.getAbout()%></p>
						<div class="text-center">
							<a href="editcontact.jsp?cid=<%=c.getId()%>" class="btn btn-success btn-sm text-white"> Edit </a>
							<a href="delete?cid=<%=c.getId()%>"class="btn btn-danger btn-sm text-white">Delete</a>
						</div>
					</div>
				</div>
			</div>	
				<%
				}
			}
				%>
		</div>
	</div>
</body>
</html>