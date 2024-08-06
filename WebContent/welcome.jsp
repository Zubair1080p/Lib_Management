<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"  href="welcome.css" type="text/css">
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

<div class="content">
<h1>Welcome to the Virtual Library</h1>
            <p>Explore a vast collection of books, articles, and more from the comfort of your home.</p>
            
            <section class="library-description">
            <h2>About Our Library</h2>
            <p>Our virtual library offers a diverse collection of resources including fiction, non-fiction, academic texts, and multimedia materials. Whether you're looking for the latest bestsellers or scholarly articles, our library provides access to an extensive range of content.</p>
        </section>
        
        <section class="featured-books">
            <h2>Featured Books</h2>
            <div class="book-list">
                <div class="book-item">
                    <h3>The Great Gatsby</h3>
                    <p>by F. Scott Fitzgerald</p>
                </div>
                <div class="book-item">
                    <h3>To Kill a Mockingbird</h3>
                    <p>by Harper Lee</p>
                </div>
                <div class="book-item">
                    <h3>1984</h3>
                    <p>by George Orwell</p>
                </div>
                
                <div class="book-item">
                    <h3>1984</h3>
                    <p>by George Orwell</p>
                </div>
                <!-- Add more books as needed -->
            </div>
        </section>
        
        </div>

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