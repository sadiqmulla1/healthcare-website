package com.healthcare.config;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/admin/*") // Apply to all admin routes
public class AdminSecurityFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String loginURI = req.getContextPath() + "/admin/login";
        boolean loggedIn = (session != null && session.getAttribute("ADMIN_LOGGED_IN") != null);
        boolean loginRequest = req.getRequestURI().equals(loginURI);

        // Allow the request if they are logged in OR if they are trying to access the login page
        if (loggedIn || loginRequest) {
            chain.doFilter(request, response);
        } else {
            // Otherwise, kick them back to the login page
            res.sendRedirect(loginURI);
        }
    }
}