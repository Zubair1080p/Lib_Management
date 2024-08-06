<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"  href="welcome.css" type="text/css">
<style>
.vbook {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            height: 100vh; /* Full viewport height */
        }

        .vbook h1 {
            margin-bottom: 20px;
            color:white;
        }

        .vbook input[type="submit"] {
            padding: 10px 20px;
            font-size: 16px;
        }
</style>
</head>
<body>
	
	
	<%

response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); //Http - 1.1
response.setHeader("pragma","no-cache");//Http - 1.0
response.setHeader("expires","0"); //for proxy

if(session.getAttribute("username") == null)
{
	response.sendRedirect("login.jsp");
}

%>

<header>
<nav class="navbar">
        <div class="logo">LBManage <small class="user">welcome ${username}</small></div>
        <ul class="nav-links">
            <li><a href="login.jsp">Login</a></li>
            <li><a href="Signup.jsp">Signup</a></li>
            <li><a href="AddBook.jsp">Add Books</a></li>
            <li><a href="view_Books.jsp">View Books</a></li>
            <li><a href="Update_Books.jsp">Update Books</a></li>
            <li><a href="Delete_Books.jsp">Delete Books</a></li>
            <li><a href="#"><form action="logout" method="post">
			<input type="submit" value="logout" name="logout">
			</form></a></li>
        </ul>
    </nav>
</header>

<form action="view" method="get" class="vbook">
	<h1>Please click here to view all books details present in this virtual Library</h1>
	<input type="submit" value="view_books">
	</form>
	

<footer class="footer">
        <p>Thank you for visiting this virtual library.</p>
        <div class="social-media">
            <a href="https://facebook.com" target="_blank" class="social-icon"><i class="fab fa-facebook-f"><img alt="fb-image" src="images/facebook.png"></i></a>
            <a href="https://twitter.com" target="_blank" class="social-icon"><i class="fab fa-twitter"><img src="images/twitter2.png" alt="twitter-image"></i></a>
            <a href="images/instagram" target="_blank" class="social-icon"><i class="fab fa-instagram"><img alt="instagram-image" src="images/instagram.png"></i></a>
            <a href="images/linkedin.png" target="_blank" class="social-icon"><i class="fab fa-linkedin"><img alt="linkedin-image" src="images/linkedin.png"></i></a>
        </div>
</footer>
	
</body>
</html>