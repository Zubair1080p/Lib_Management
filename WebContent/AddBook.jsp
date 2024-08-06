<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"  href="add.css" type="text/css">
<script type="text/javascript">

function resetForm() {
    document.getElementById("yourFormID").reset();
}
</script>
</head>
<body>

		
		<%
    session = request.getSession(false);
    if (session != null) {
        String flashMessage = (String) session.getAttribute("flashMessage");
        if (flashMessage != null) {
            out.println("<p>" + flashMessage + "</p>");
            session.removeAttribute("flashMessage"); // Clear flash message after displaying
        }
    }
    %>
		
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
        <form id="yourFormID" class="add" action="add" method="post" enctype="multipart/form-data" ">
            <h2>PLEASE ADD BOOKS WHICH YOU THINK WORTHY TO READ</h2>
            <div class="form-group">
                <label for="bname">Book Name :</label>
                <input type="text" id="bname" name="bname">
            </div>
            <div class="form-group">
                <label for="author">Author :</label>
                <input type="text" id="author" name="author">
            </div>
            <div class="form-group">
                <label for="category">Category :</label>
                <input type="text" id="category" name="category">
            </div>
            <div class="form-group">
                <label for="file">Book (pdf only) :</label>
                <input type="file" id="file" name="file">
            </div>
            <div class="form-group">
                <label for="url">Book URL (online resource) :</label>
                <input type="text" id="url" name="url">
            </div>
            <div class="form-group">
                <input type="submit" value="Add Book">
            </div>
        </form>
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