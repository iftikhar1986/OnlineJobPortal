package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve the current session, if it exists
        HttpSession session = req.getSession(false); 

        if (session != null) {
            // Invalidate the session to clear all attributes and log out the user
            session.invalidate();
        }

        // Redirect the user to the login page after logging out
        resp.sendRedirect("login.jsp");
    }
}
 