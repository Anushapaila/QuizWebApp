package com.example.quizwebapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ResultServlet")
public class ResultServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Prevent Browser Back Cache
        response.setHeader("Cache-Control",
                "no-cache, no-store, must-revalidate");

        response.setHeader("Pragma", "no-cache");

        response.setDateHeader("Expires", 0);

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        int score = 0;
        int total = 0;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/quizdb",
                    "root",
                    "Anusha@2006"
            );

            Statement st = con.createStatement();

            ResultSet rs =
                    st.executeQuery("SELECT * FROM questions");

            while(rs.next()) {

                total++;

                int id = rs.getInt("id");

                String correctAnswer =
                        rs.getString("answer");

                String userAnswer =
                        request.getParameter("q" + id);

                if(userAnswer != null &&
                        userAnswer.equals(correctAnswer)) {

                    score++;
                }
            }

            out.println("<html>");
            out.println("<head>");

            // Disable Back Button
            out.println("<script>");
            out.println("history.pushState(null, null, location.href);");
            out.println("window.onpopstate = function () {");
            out.println("history.go(1);");
            out.println("};");
            out.println("</script>");

            out.println("<title>Quiz Result</title>");
            out.println("</head>");

            out.println("<body style='font-family:Arial;"
                    + "background:#f0f8ff;"
                    + "text-align:center;'>");

            out.println("<div style='background:white;"
                    + "width:450px;"
                    + "margin:auto;"
                    + "margin-top:100px;"
                    + "padding:30px;"
                    + "border-radius:15px;"
                    + "box-shadow:0 0 10px gray;'>");

            out.println("<h1>Quiz Submitted Successfully</h1>");

            out.println("<h2>Your Score: "
                    + score +
                    " / " +
                    total +
                    "</h2>");

            double percentage =
                    ((double) score / total) * 100;

            out.println("<h3>Percentage: "
                    + String.format("%.2f", percentage)
                    + "%</h3>");

            if(score == total) {

                out.println("<h2 style='color:green;'>Excellent!</h2>");

            } else if(score >= total / 2) {

                out.println("<h2 style='color:orange;'>Good Job!</h2>");

            } else {

                out.println("<h2 style='color:red;'>Try Again!</h2>");
            }

            out.println("<br><br>");

            out.println("<a href='login.jsp' "
                    + "style='text-decoration:none;"
                    + "padding:12px 25px;"
                    + "background:#007bff;"
                    + "color:white;"
                    + "border-radius:8px;'>");

            out.println("Logout");

            out.println("</a>");

            out.println("</div>");
            out.println("</body>");
            out.println("</html>");

            con.close();

        } catch(Exception e) {

            out.println(e);

        }
    }
}