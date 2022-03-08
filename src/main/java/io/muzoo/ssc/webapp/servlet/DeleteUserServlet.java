/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package io.muzoo.ssc.webapp.servlet;

import io.muzoo.ssc.webapp.Routable;
import io.muzoo.ssc.webapp.model.User;
import io.muzoo.ssc.webapp.service.SecurityService;
import io.muzoo.ssc.webapp.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author gigadot
 */
public class DeleteUserServlet extends HttpServlet implements Routable {

    private SecurityService securityService;

    @Override
    public String getMapping() {
        return "/user/delete";
    }

    @Override
    public void setSecurityService(SecurityService securityService) {
        this.securityService = securityService;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (securityService.isAuthorized(request)) {
            String username = securityService.getCurrentUsername(request);
            UserService userService = UserService.getInstance();

            try{
                User currentUser = userService.findByUsername(username);
                User deletingUser = userService.findByUsername(request.getParameter("username"));

                if(userService.deleteUserByUsername(deletingUser.getUsername())){
                    request.getSession().setAttribute("hasError", false);
                    request.getSession().setAttribute("message", String.format("User %s is successfully deleted.", deletingUser.getUsername()));
                } else {
                    request.getSession().setAttribute("hasError", true);
                    request.getSession().setAttribute("message", String.format("Unable to delete user %s", deletingUser.getUsername()));
                }

            } catch (Exception e){
                request.getSession().setAttribute("hasError", true);
                request.getSession().setAttribute("message", String.format("Unable to delete user %s", request.getParameter("username")));
            }

            response.sendRedirect("/");
        } else {
            response.sendRedirect("/login");
        }
    }
}
