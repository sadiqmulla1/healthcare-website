package com.healthcare.controllers.admin.security;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/logout")
public class AdminLogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession(false); // Get existing session, don't create new one
        if (session != null) {
            session.invalidate(); // This "expires" the login immediately
        }
        // Redirect to login page with a logout message
        resp.sendRedirect(req.getContextPath() + "/admin/login?message=logged_out");
    }
}