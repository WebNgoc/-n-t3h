package com.example.baitap.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class AuthInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String capath = request.getContextPath();
        String actionUrl= request.getRequestURI().replace(capath,"");
        HttpSession session = request.getSession();
        if(session.getAttribute("customer")==null){
            session.setAttribute("raquel",actionUrl);
            response.sendRedirect(capath+"/account/login");
            return false;
        }
        return true;
    }
}
