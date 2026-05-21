<!DOCTYPE html>
<html>
<head>
    <title>Register</title>

    <style>

        body{
            margin:0;
            font-family:Arial;
            background:linear-gradient(135deg,#667eea,#764ba2);
            height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
        }
        .box{
            background:white;
            width:400px;
            padding:40px;
            border-radius:20px;
            box-shadow:0 10px 25px rgba(0,0,0,0.3);
            text-align:center;
        }

        h2{
            margin-bottom:30px;
            color:#333;
        }

        input{
            width:100%;
            padding:14px;
            margin:10px 0;
            border-radius:10px;
            border:1px solid #ccc;
            font-size:16px;
        }
        button{
            width:100%;
            padding:14px;
            background:#28a745;
            color:white;
            border:none;
            border-radius:10px;
            font-size:18px;
            cursor:pointer;
            transition:0.3s;
        }

        button:hover{
            background:#218838;
        }
        a{
            text-decoration:none;
            color:#007bff;
        }

    </style>
</head>
<body>

<div class="box">

    <h2>Create Account</h2>

    <form action="RegisterServlet" method="post">

        <input type="text"
               name="username"
               placeholder="Enter Username"
               required>

        <input type="password"
               name="password"
               placeholder="Enter Password"
               required>

        <button type="submit">Register</button>

    </form>
    <br>

    Already have account?
    <a href="login.jsp">Login</a>

</div>

</body>
</html>
