<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" import="com.conn.DbConnection, java.sql.Connection, com.entity.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <%@ include file="components/allCss.jsp"%>
    <style type="text/css">
        .back-img {
            background: url("image/phonebackground2.jpg");
            width: 100%;
            height: 120vh;
            background-repeat: no-repeat;
            background-size: cover;
            background-color: black;
            text-align: center;
            color: white; /* Default text color within .back-img */
        }

        .back-img h1 {
            color: black; /* Gold color */
            font-size: 4rem;
            font-family: 'Roboto', sans-serif;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            background: linear-gradient(45deg, #ff0844, #ffb199);
            -webkit-background-clip: text;
            padding: 10px;
            border-radius: 10px;
            animation: glow 1.5s infinite alternate;
        }

        .back-img h2 {
            color: blue;
            font-family: 'Lobster', cursive;
            animation: colorChange 3s infinite;
        }

        @keyframes colorChange {
            0% {
                color: purple;
            }
            50% {
                color: red;
            }
            100% {
                color: yellow;
            }
        }

        /* Glow animation */
        @keyframes glow {
            from {
                text-shadow: 0 0 10px #FFD700, 0 0 20px #FFD700, 0 0 30px #FF4500, 0 0 40px #FF4500, 0 0 50px #FF4500;
            }
            to {
                text-shadow: 0 0 20px #FFD700, 0 0 30px #FFD700, 0 0 40px #FF4500, 0 0 50px #FF4500, 0 0 60px #FF4500;
            }
        }
    </style>
</head>
<body>
    <%@ include file="components/navebar.jsp" %>
    
    <div class="container-fluid back-img">
        <h1>Welcome&#128515;To PhoneHive&#128222;</h1>
        <h2>&#128165;Your Personal Contact Management System&#128165;</h2>
    </div>

    <%@ include file="components/footer.jsp" %>
</body>
</html>
