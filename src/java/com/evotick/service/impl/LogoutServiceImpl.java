/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.service.impl;

import com.evotick.service.LogoutService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Pandu
 */
public class LogoutServiceImpl implements LogoutService {

  @Override
  public void handleLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.getServletContext().setAttribute("user", null);

    response.sendRedirect(request.getContextPath());
  }
}
