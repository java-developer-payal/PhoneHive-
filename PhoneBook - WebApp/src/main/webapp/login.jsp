<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
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
        width : 50% !important;
        background: rgba(0, 0, 0, 0.7);
        padding: 20px;
        border-radius: 5px;
    }
    .form-control {
        border-radius: 10px;
    }
    .btn-custom {
        background: linear-gradient(45deg, #ffb199, #ff0844); /* New hover color gradient */
        border: none;
        border-radius: 20px;
        color: #fff;
        padding: 8px 16px;
		font-size: 0.875rem; /* Smaller font size */
        transition: all 0.3s ease;
    }
    .btn-custom:hover {
           background: linear-gradient(45deg, #ffb199, #ff0844); /* New hover color gradient */
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
    <h2 class="text-center">LOGIN</h2>
    <%
    	String inavlidMsg = (String)session.getAttribute("inavlidMsg");
    	if(inavlidMsg != null){
    	%>
    		<p class="text-danger text-center"><%=inavlidMsg %></p>
    	<%
    		session.removeAttribute("inavlidMsg");
    	}
    %>
    
    <%
    	String logMsg = (String)session.getAttribute("logMsg");
    	if(logMsg != null){
    	%>
    		<p class="text-success text-center"><%=logMsg %></p>
    	<%
    		session.removeAttribute("logMsg");
    	}
    %>
    <form action="login" method="post">
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
   <button type="submit" class="btn btn-custom" style="width: 30%; display: block; margin: 0 auto;">Login</button>   
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

