package com.servlet;

import java.io.IOException;
import com.dao.UserDao;
import com.db.DBConnect;
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

            HttpSession session = req.getSession();
            User user = null;

            // Check for admin credentials
            if ("admin@admin.com".equals(email) && "123456".equals(password)) {
                user = new User();
                user.setRole("admin");
                user.setName("Admin"); // Optional: set name for admin if needed
                session.setAttribute("userobj", user);
                resp.sendRedirect("admin.jsp");
            } else {
                // Regular user login
                UserDao userDao = new UserDao(DBConnect.getConnection());
                user = userDao.login(email, password);

                if (user != null) {
                    session.setAttribute("userobj", user); // Set the correct user object with details
                    resp.sendRedirect("home.jsp");
                } else {
                    // Login failed
                    req.setAttribute("errorMessage", "Invalid email or password.");
                    req.getRequestDispatcher("login.jsp").forward(req, resp);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
