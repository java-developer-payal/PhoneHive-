<%@ page import="com.entity.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  <title>Navbar</title>
  <style>
    body {
      font-family: 'Roboto', sans-serif;
      background: url('https://source.unsplash.com/random/1920x1080') no-repeat center center fixed;
      background-size: cover;
      color: #fff;
    }
    .navbar {
      background-color: #000; /* Change navbar background color to black */
      padding: 1rem 1.5rem; /* Adjust the padding as needed */
      height: 90px; /* Set the height of the navbar */
    }
    .navbar-brand {
      font-size: 1.5rem;
      font-weight: bold;
      color: #fff;
      font-family: 'Playfair Display', serif; /* Change 'Playfair Display' to your desired font */
    }
    .nav-link {
      font-size: 1.2rem;
    }
    .nav-link:hover {
      color: yellow; /* Hover effect */
    }
    .btn {
      border-radius: 50px;
      transition: all 0.3s ease;
    }
    .btn-success {
      background: linear-gradient(45deg, #1de099, #1dc8cd);
      border: none;
    }
    .btn-success:hover {
      background: linear-gradient(45deg, #1dc8cd, #1de099);
    }
    .btn-danger {
      background: linear-gradient(45deg, #ff0844, #ffb199);
      border: none;
    }
    .btn-danger:hover {
      background: linear-gradient(45deg, #ffb199, #ff0844);
    }
    .navbar-brand:hover,
    .navbar-nav .nav-link:hover,
    .btn:hover {
      font-family: 'Roboto', sans-serif; /* Change 'Roboto' to your desired font */
      color: blue !important; /* Change color of all navbar content on hover */
    }    
  </style>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="index.jsp"><i class="fas fa-phone"></i>  PhoneHive</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="index.jsp"><i class="fas fa-home"></i> Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="addContact.jsp"><i class="fas fa-plus"></i> Add Phone No.</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="viewContact.jsp"><i class="fas fa-eye"></i> View Contact</a>
        </li>
      </ul>
      
      	<% User user = (User) session.getAttribute("user");
      	if(user  == null)
      	{
      	%>
      	  <form class="form-inline my-4 my-lg-0">
       		<a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
        	<a href="register.jsp" class="btn btn-danger ml-4"><i class="fas fa-edit"></i> Register</a>
      	  </form>	
      	<%
      	}else{
      	%>
      	  <form class="form-inline my-4 my-lg-0">
          	<button class="btn btn-success"><%=user.getName()%></button>  
			<a  data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-danger ml-2 text-white">Logout</a>          
          </form>
        <% 
      	}
      	%>
    </div>
    <!-- Logout Popup --> 
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body text-center">
	        <h5 style="color: #ff0844;">Do you want to logout.....</h5>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <a href="logout" class="btn btn-primary">Logout</a>
	      </div>
	      <div class="modal-footer">
	      </div>
	    </div>
	  </div>
	</div>
    <!-- Logout Popup -->
  </nav>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
