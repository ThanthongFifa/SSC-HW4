/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package io.muzoo.ssc.webapp.service;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import io.muzoo.ssc.webapp.model.User;
import org.apache.commons.lang.StringUtils;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author gigadot
 */
public class SecurityService {

    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    
//    private Map<String, String> userCredentials = new HashMap<String, String>() {{
//        put("admin", "123456");
//        put("fifa", "1111");
//    }};
    
    public boolean isAuthorized(HttpServletRequest request) {
        String username = (String) request.getSession().getAttribute("username");
        // do checking
        return (username != null && userService.findByUsername(username) != null);
    }
    
    public boolean authenticate(String username, String password, HttpServletRequest request) {
        User user = userService.findByUsername(username);
        if (user != null && BCrypt.checkpw(password, user.getPassword())){
            request.getSession().setAttribute("username", username);
            return true;
        } else {
            return false;
        }
    }

    public String getCurrentUsername(HttpServletRequest req) {
        HttpSession session = req.getSession();
        Object usernameObject = session.getAttribute("username");
        return (String) usernameObject;
    }

    public boolean login(HttpServletRequest req){
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = userService.findByUsername(username);
        if (user != null && BCrypt.checkpw(password, user.getPassword())) {
            HttpSession session = req.getSession();
            session.setAttribute("username", username);
            return true;
        }
        else {
            return false;
        }
    }
    
    public void logout(HttpServletRequest request) {
        request.getSession().invalidate();
    }
    
}
