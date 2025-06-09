/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.service.impl;

import com.evotick.model.User;
import com.evotick.repository.AdminRepository;
import com.evotick.repository.UserRepository;
import com.evotick.service.LoginService;
import com.evotick.helper.Hash;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Pandu
 */
public class LoginServiceImpl implements LoginService {

  @Override
  public void showForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    RequestDispatcher rds = request.getRequestDispatcher("WEB-INF/page/login.jsp");
    rds.forward(request, response);
  }

  @Override
  public void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    Map<String, String> errors = new HashMap<>();

    if (email.isEmpty() || password.isEmpty()) {
      if (email.isEmpty() || email.length() >= 50) {
        errors.put("email", "Email is required and must less than 50 character");
      }
      if (password.isEmpty() || password.length() >= 150) {
        errors.put("password", "Password is required and must less than 150 character");
      }

      request.setAttribute("errors", errors);
      RequestDispatcher rds = request.getRequestDispatcher("WEB-INF/page/login.jsp");
      rds.forward(request, response);
      return;
    }

    Connection db = (Connection) request.getServletContext().getAttribute("db");

    User user = new UserRepository().find(db, "email", email);
    if (user == null) {
      user = new AdminRepository().find(db, "email", email);
    }

    if (user == null) {
      errors.put("email", "Email is not found in our database");
      request.setAttribute("errors", errors);
      RequestDispatcher rds = request.getRequestDispatcher("WEB-INF/page/login.jsp");
      rds.forward(request, response);
      return;
    }

    if (Hash.verify(password, user.getPassword())) {
      errors.put("password", "Password is not valid, please try again");
      request.setAttribute("errors", errors);
      RequestDispatcher rds = request.getRequestDispatcher("WEB-INF/page/login.jsp");
      rds.forward(request, response);
      return;
    }

    request.getServletContext().setAttribute("user", user);

    String path = user.getIs_admin() ? "/dashboard" : "";
    
    response.sendRedirect(request.getContextPath() + path);
  }
}
