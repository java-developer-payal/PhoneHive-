<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<%@ include file="components/allCss.jsp" %>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Roboto', sans-serif;
        background: url('https://source.unsplash.com/random/1920x1080') no-repeat center center fixed;
        background-size: cover;
        color: #fff;
        animation: backgroundAnimation 10s infinite alternate;
    }

    @keyframes backgroundAnimation {
        0% { background-color: #2c3e50; }
        14% { background-color: #34495e; }
        28% { background-color: #8e44ad; }
        42% { background-color: #2980b9; }
        57% { background-color: #16a085; }
        71% { background-color: #27ae60; }
        85% { background-color: #c0392b; }
        100% { background-color: #2c3e50; }
    }

    .container {
        margin-top: 70px;
        width: 50% !important;
        background: rgba(0, 0, 0, 0.7);
        padding: 20px;
        border-radius: 5px;
    }
    .form-control {
        border-radius: 10px;
    }
    .btn-custom {
        background: linear-gradient(45deg, #34495e, #2c3e50);
        border: none;
        border-radius: 30px;
        color: #fff;
        padding: 10px 20px;
        transition: all 0.3s ease;
    }
    .btn-custom:hover {
        background: linear-gradient(45deg, #2c3e50, #34495e);
        color: #fff;
    }
    .form-group label {
        color: #fff;
        font-weight: bold;
    }
</style>
</head>
<body>
<%@ include file="components/navebar.jsp" %>

<div class="container">
    <h2 class="text-center">REGISTER</h2>
    
     <% 
		String sucssMsg = (String) session.getAttribute("sucssMsg");
		String errorMsg = (String) session.getAttribute("errorMsg");

		if(sucssMsg != null){
		%>
		<p class="text-success text-center"><%= sucssMsg %></p>
		<%
    		session.removeAttribute("sucssMsg"); // Clear the message after displaying
		}

		if(errorMsg != null){
		%>
		<p class="text-danger text-center"><%= errorMsg %></p>
		<%
    		session.removeAttribute("errorMsg"); // Clear the error after displaying
		}
		%>
   
    <form action="register" method="post">
    
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" class="form-control" id="username" name="name" required>
        </div>
        
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        
        <div class="form-group">
            <label for="confirmPassword">Confirm Password</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
        </div>
        <button type="submit" class="btn btn-custom btn-block" style="width: 30%; display: block; margin: 0 auto;">Register</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

