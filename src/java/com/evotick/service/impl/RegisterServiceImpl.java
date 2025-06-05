/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.service.impl;

import com.evotick.model.User;
import com.evotick.repository.UserRepository;
import com.evotick.service.RegisterService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Pandu
 */
public class RegisterServiceImpl implements RegisterService {

  @Override
  public void showForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    RequestDispatcher rds = request.getRequestDispatcher("WEB-INF/page/register.jsp");
    rds.forward(request, response);
  }

  @Override
  public void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String full_name = request.getParameter("full_name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    Map<String, String> errors = new HashMap<>();

    if (full_name.isEmpty() || email.isEmpty() || password.isEmpty()) {
      if (full_name.isEmpty() || full_name.length() >= 50) {
        errors.put("full_name", "Full name is required and must less than 50 character");
      }
      if (email.isEmpty() || email.length() >= 50) {
        errors.put("email", "Email is required and must less than 50 character");
      }
      if (password.isEmpty() || password.length() >= 150) {
        errors.put("password", "Password is required and must less than 150 character");
      }

      request.setAttribute("errors", errors);
      RequestDispatcher rds = request.getRequestDispatcher("WEB-INF/page/register.jsp");
      rds.forward(request, response);
      return;
    }

    Connection db = (Connection) request.getServletContext().getAttribute("db");

    User user = new UserRepository().find(db, "email", email);

    if (user == null) {
      errors.put("email", "Email is not found in our database");
      request.setAttribute("errors", errors);
      RequestDispatcher rds = request.getRequestDispatcher("WEB-INF/page/register.jsp");
      rds.forward(request, response);
      return;
    }

    response.sendRedirect(request.getContextPath() + "/dashboard");
  }
}
