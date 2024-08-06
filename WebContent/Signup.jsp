<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Library Management System - Sign Up</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/lib2.jpg');
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .signup-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 400px;
            text-align: center;
        }

        .signup-container h3 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        .signup-container table {
            width: 100%;
            margin: 0 auto;
        }

        .signup-container th, .signup-container td {
            text-align: left;
            padding: 10px 0;
        }

        .signup-container input[type="text"],
        .signup-container input[type="email"],
        .signup-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .signup-container input[type="submit"] {
            background-color: #5cb85c;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            margin-top: 20px;
        }

        .signup-container input[type="submit"]:hover {
            background-color: #4cae4c;
        }

        .signup-container a {
            display: inline-block;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
        }

        .signup-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <h3>Sign Up Here</h3>
        <form action="signup" method="post">
            <table>
                <tr>
                    <th>User Name</th>
                    <td><input type="text" name="uname" required></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><input type="email" name="email" required></td>
                </tr>
                <tr>
                    <th>Password</th>
                    <td><input type="password" name="pass" required></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" name="btn" value="Sign Up"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <a href="login.jsp">Already have an account? Login</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
