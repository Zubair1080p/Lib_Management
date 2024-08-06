<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="add.css" type="text/css">
<script type="text/javascript">

function resetForm() {
    document.getElementById("yourFormID").reset();
}

function validateForm() {
    var id = document.getElementById("id").value;
    if (id == null || id.trim() == "") {
        alert("Book ID must be filled out");
        return false;
    }
    return true;
}
</script>
</head>
<body>


<c:if test="${not empty flashMessage}">
    <div class="flash ${flashType}">
        ${flashMessage}
    </div>
	</c:if>


<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); //Http - 1.1
response.setHeader("pragma","no-cache");//Http - 1.0
response.setHeader("expires","0"); //for proxy

if(session.getAttribute("username") == null) {
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
    <form id="yourFormID" class="update" action="update" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
        <h2>YOU CAN UPDATE THE BOOKS WHICH NEEDED ANY CHANGES!!!</h2>
        <div class="form-group">
            <label for="id">Enter Book ID :</label>
            <input type="text" id="id" name="id">
        </div>
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
            <input type="submit" value="Update Book">
        </div>
    </form>
</div>

<footer class="footer">
    <p>Thank you for visiting this virtual library.</p>
    <div class="social-media">
        <a href="https://facebook.com" target="_blank" class="social-icon"><img alt="fb-image" src="images/facebook.png"></a>
        <a href="https://twitter.com" target="_blank" class="social-icon"><img src="images/twitter2.png" alt="twitter-image"></a>
        <a href="images/instagram" target="_blank" class="social-icon"><img alt="instagram-image" src="images/instagram.png"></a>
        <a href="images/linkedin.png" target="_blank" class="social-icon"><img alt="linkedin-image" src="images/linkedin.png"></a>
    </div>
</footer>
</body>
</html>
