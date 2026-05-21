
<!DOCTYPE html>
<html>
<head>
    <title>Online Quiz App</title>

    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:Arial;
        }
        body{
            height:100vh;
            background:linear-gradient(135deg,#4facfe,#00f2fe);
            display:flex;
            justify-content:center;
            align-items:center;
        }

        .container{
            background:white;
            width:500px;
            padding:50px;
            border-radius:20px;
            text-align:center;
            box-shadow:0 10px 25px rgba(0,0,0,0.2);
        }
        h1{
            color:#333;
            margin-bottom:20px;
            font-size:40px;
        }

        p{
            color:#555;
            margin-bottom:30px;
            font-size:18px;
        }

        a{
            text-decoration:none;
        }
        .btn{
            display:inline-block;
            padding:14px 30px;
            margin:10px;
            border-radius:10px;
            font-size:18px;
            color:white;
            transition:0.3s;
        }

        .login{
            background:#007bff;
        }

        .register{
            background:#28a745;
        }

        .btn:hover{
            transform:scale(1.05);
        }
    </style>
</head>
<body>
  <img src = "https://media.istockphoto.com/id/1502704339/photo/adult-man-using-a-laptop-tick-correct-sign-mark-for-document-approval-and-checklist-planning.jpg?s=612x612&w=0&k=20&c=TZCg7P83Q4iTyHADZxr7pRC4NNmLwOFhEcWGHX003Rk=" alt="image"
    <div class="container">

        <h1>Online Quiz App</h1>

        <p>Test your knowledge with exciting quiz questions.</p>

        <a href="login.jsp">
            <div class="btn login">Login</div>
        </a>

        <a href="register.jsp">
            <div class="btn register">Register</div>
        </a>

    </div>
  >
</body>
</html>