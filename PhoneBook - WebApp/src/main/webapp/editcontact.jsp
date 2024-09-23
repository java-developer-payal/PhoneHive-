<%@page import="com.conn.DbConnection"%>
<%@page import="com.dao.ContactDAO"%>
<%@page import="com.entity.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Contact Page</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Roboto', sans-serif;
      background: linear-gradient(135deg, #e0f7fa, #80deea);
      color: #333;
      transition: background 0.5s;
    }

    .container {
      margin-left: auto;
      margin-right: auto;
      margin-top: 20px;
      /* width: 3%;  */
      background: linear-gradient(135deg, #e0f7fa, #80deea); 
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
      animation: fadeIn 1s forwards;
      max-width: 20px;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(-20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .form-control {
      border-radius: 10px;
      background-color: #f8f9fa;
      color: #333;
      border: 2px solid #ccc;
      transition: border-color 0.3s, box-shadow 0.3s;
    }

    .form-control:focus {
      border-color: #00796b; /* New focus color */
      box-shadow: 0 0 5px rgba(0, 121, 107, 0.5);
    }

    .btn-custom {
      background: linear-gradient(45deg, #00796b, #004d40); /* New button gradient */
      border: none;
      border-radius: 30px;
      color: #fff;
      padding: 12px 20px;
      transition: background 0.3s, transform 0.2s, box-shadow 0.2s;
      width: 100%; 
      max-width: 240px; 
      margin: 20px auto; 
      display: block;
    }

    .btn-custom:hover {
      background: linear-gradient(45deg, #004d40, #00796b);
      transform: translateY(-2px);
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
    }

    .form-group label {
      font-weight: bold;
      color: #00796b;
      transition: color 0.3s;
    }

    .form-group:hover label {
      color: #004d40;
    }

    h2 {
      text-align: center; /* Center the heading */
      color: #00796b;
    }

    .footer {
      margin-top: 20px;
      text-align: center;
      font-size: 14px;
      color: #666;
    }
  </style>

<%@ include file="components/allCss.jsp" %>
</head>
<body>
 <%@ include file="components/navebar.jsp" %>
	<%
	  	if(user == null){
	  		session.setAttribute("inavlidMsg", "!!!  Login is required  !!!");
	  		response.sendRedirect("login.jsp");
	  	}
	  %>
<div class="container">
    <h2 class="text-center">Add New Contact</h2>    
      
       <% 
		String errorMsg = (String) session.getAttribute("failedMsg");
		if(errorMsg != null){
		%>
		<p class="text-danger text-center"><%= errorMsg %></p>
		<%
    		session.removeAttribute("failedMsg"); // Clear the error after displaying
		}
		%>
      
      <form action="update" method="POST">
        <%
        	int cid = Integer.parseInt(request.getParameter("cid"));
        	ContactDAO dao = new ContactDAO(DbConnection.getConn());
        	Contact c = dao.getContactByID(cid);
        %>
        <input type="hidden" value="<%=cid%>" name="cid">
        
        <div class="form-group">
          <label for="name">Full Name</label>
          <input value = "<%=c.getName()%>" type="text" class="form-control" id="name" name="name" required>
        </div>
        
        <div class="form-group">
          <label for="email">Email Address</label>
          <input value = "<%=c.getEmail()%>" type="email" class="form-control" id="email" name="email" required>
        </div>
        
        <div class="form-group">
          <label for="phno">Phone Number</label>
          <input value = "<%=c.getPhno()%>" type="text" class="form-control" id="phno" name="phno" required>
        </div>
        
        <div class="form-group">
          <label for="about">About</label>
          <textarea class="form-control" id="about" name="about" required><%=c.getAbout()%></textarea>
        </div>
        <button type="submit" class="btn btn-custom" style=" width: 30%; display: block; margin-top:60px ;">Update Contact</button>
      </form>
  </div>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>