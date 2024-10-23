package com.servlet;

import java.io.IOException;
import com.entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            System.out.println("LoginServlet accessed.");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            User user = new User();
            HttpSession session = req.getSession();

            if ("admin@admin.com".equals(email) && "123456".equals(password)) {
                user.setRole("admin");
                session.setAttribute("userobj", user);
                resp.sendRedirect("admin.jsp");
            } else {
                resp.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
