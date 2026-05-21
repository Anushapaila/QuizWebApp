<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Online Quiz Application</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:Arial;
        }

        body{
            background:#f4f7fc;
        }

        .header{
            background:linear-gradient(135deg,#007bff,#00c6ff);
            color:white;
            padding:25px;
            text-align:center;
            font-size:35px;
            font-weight:bold;
            box-shadow:0 4px 10px rgba(0,0,0,0.2);
        }

        .container{
            width:80%;
            margin:auto;
            margin-top:30px;
            margin-bottom:50px;
        }

        .question-box{
            background:white;
            padding:25px;
            margin-bottom:25px;
            border-radius:15px;
            box-shadow:0 5px 15px rgba(0,0,0,0.1);
            transition:0.3s;
        }

        .question-box:hover{
            transform:scale(1.01);
        }

        h3{
            color:#333;
            margin-bottom:20px;
        }

        label{
            display:block;
            padding:12px;
            margin:10px 0;
            background:#f8f9fa;
            border-radius:10px;
            cursor:pointer;
            transition:0.3s;
            font-size:17px;
        }

        label:hover{
            background:#dbeafe;
        }

        input[type="radio"]{
            margin-right:10px;
        }

        .submit-btn{
            display:block;
            width:250px;
            margin:40px auto;
            padding:15px;
            background:#28a745;
            color:white;
            border:none;
            border-radius:12px;
            font-size:20px;
            cursor:pointer;
            transition:0.3s;
        }

        .submit-btn:hover{
            background:#218838;
            transform:scale(1.03);
        }

    </style>

</head>

<body>

<div class="header">
    Online Quiz Application
</div>

<form action="ResultServlet" method="post">

    <div class="container">

        <%

            try {

                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/quizdb",
                        "root",
                        "Anusha@2006"
                );

                Statement st = con.createStatement();

                ResultSet rs = st.executeQuery("SELECT * FROM questions");

                while(rs.next()) {

        %>

        <div class="question-box">

            <h3>
                Q<%= rs.getInt("id") %>.
                <%= rs.getString("question") %>
            </h3>

            <label>
                <input type="radio"
                       name="q<%= rs.getInt("id") %>"
                       value="<%= rs.getString("option1") %>">

                <%= rs.getString("option1") %>
            </label>

            <label>
                <input type="radio"
                       name="q<%= rs.getInt("id") %>"
                       value="<%= rs.getString("option2") %>">

                <%= rs.getString("option2") %>
            </label>

            <label>
                <input type="radio"
                       name="q<%= rs.getInt("id") %>"
                       value="<%= rs.getString("option3") %>">

                <%= rs.getString("option3") %>
            </label>

            <label>
                <input type="radio"
                       name="q<%= rs.getInt("id") %>"
                       value="<%= rs.getString("option4") %>">

                <%= rs.getString("option4") %>
            </label>

        </div>

        <%

                }

                con.close();

            } catch(Exception e) {

                out.println("<h2>Error:</h2>");
                out.println(e);

            }

        %>

        <button class="submit-btn" type="submit">
            Submit Quiz
        </button>

    </div>

</form>

</body>
</html>