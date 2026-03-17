package com.healthcare.controllers.admin.security;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.healthcare.dao.AdminDAO;
import com.healthcare.models.Admin;

import java.io.IOException;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {
        req.getRequestDispatcher("/WEB-INF/views/admin/login.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        AdminDAO adminDAO = new AdminDAO();
        Admin admin = adminDAO.authenticate(username, password);

        if (admin != null) {
            HttpSession session = req.getSession();
            session.setAttribute("ADMIN_LOGGED_IN", true);
            session.setAttribute("currentAdmin", admin); // Store the admin object if needed

            resp.sendRedirect(req.getContextPath() + "/admin/home");
        } else {
            req.setAttribute("error", "Invalid credentials from Database");
            req.getRequestDispatcher("/WEB-INF/views/admin/login.jsp").forward(req, resp);
        }
    }
}

