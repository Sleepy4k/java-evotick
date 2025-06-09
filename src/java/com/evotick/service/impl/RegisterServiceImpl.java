/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.service.impl;

import com.evotick.model.User;
import com.evotick.repository.UserRepository;
import com.evotick.service.RegisterService;
import com.evotick.helper.Hash;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

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
  public void handleRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String username = request.getParameter("username");
    String full_name = request.getParameter("full_name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String password = request.getParameter("password");
    String password_confirmation = request.getParameter("password_confirmation");
    Map<String, String> errors = new HashMap<>();

    if (username.isEmpty() || full_name.isEmpty() || email.isEmpty() || phone.isEmpty() || address.isEmpty() || password.isEmpty() || password_confirmation.isEmpty()) {
      if (username.isEmpty() || username.length() >= 50) {
        errors.put("username", "Username is required and must less than 50 character");
      }
      if (full_name.isEmpty() || full_name.length() >= 50) {
        errors.put("full_name", "Full name is required and must less than 50 character");
      }
      if (email.isEmpty() || email.length() >= 50) {
        errors.put("email", "Email is required and must less than 50 character");
      }
      if (phone.isEmpty() || phone.length() >= 50) {
        errors.put("phone", "Phone is required and must less than 50 character");
      }
      if (address.isEmpty() || address.length() >= 255) {
        errors.put("addresss", "Address is required and must less than 50 character");
      }
      if (password.isEmpty() || password.length() >= 150) {
        errors.put("password", "Password is required and must less than 150 character");
      }
      if (password_confirmation.isEmpty() || password_confirmation.length() >= 150 || !password.equals(password_confirmation)) {
        errors.put("password", "Password COnfirmation is required and must less than 150 character");
      }

      request.setAttribute("errors", errors);
      RequestDispatcher rds = request.getRequestDispatcher("WEB-INF/page/register.jsp");
      rds.forward(request, response);
      return;
    }

    Connection db = (Connection) request.getServletContext().getAttribute("db");

    User user = new UserRepository().find(db, "email", email);

    if (user != null) {
      errors.put("email", "Email is already registered");
      request.setAttribute("errors", errors);
      RequestDispatcher rds = request.getRequestDispatcher("WEB-INF/page/register.jsp");
      rds.forward(request, response);
      return;
    }

    user = new User();
    user.setId(UUID.randomUUID());
    user.setUsername(username);
    user.setFull_name(full_name);
    user.setEmail(email);
    user.setPassword(Hash.hashPassword(password));
    user.setPhone(phone);
    user.setAddress(address);
    new UserRepository().insert(db, user);

    response.sendRedirect(request.getContextPath() + "/login");
  }
}
