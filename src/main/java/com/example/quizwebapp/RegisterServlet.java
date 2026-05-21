package com.example.quizwebapp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/quizdb",
                    "root",
                    "Anusha@2006"
            );

            String query =
                    "INSERT INTO users(username,password) VALUES(?,?)";

            PreparedStatement pst = con.prepareStatement(query);

            pst.setString(1, username);
            pst.setString(2, password);

            int i = pst.executeUpdate();

            if(i > 0) {

                response.sendRedirect("login.jsp");

            } else {

                response.getWriter().println("Registration Failed");

            }

            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }
    }
}