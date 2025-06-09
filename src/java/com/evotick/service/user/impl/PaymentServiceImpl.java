/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.service.user.impl;

import com.evotick.service.user.PaymentService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Pandu
 */
public class PaymentServiceImpl implements PaymentService {

  @Override
  public void showForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    RequestDispatcher rds = request.getRequestDispatcher("/WEB-INF/page/userPayment.jsp");
    rds.forward(request, response);
  }

  @Override
  public void handlePayment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
  }
  
}
