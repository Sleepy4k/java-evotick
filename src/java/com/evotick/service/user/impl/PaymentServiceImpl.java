/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.service.user.impl;

import com.evotick.model.Event;
import com.evotick.model.EventPackage;
import com.evotick.model.User;
import com.evotick.repository.EventPackageRepository;
import com.evotick.repository.EventRepository;
import com.evotick.repository.UserRepository;
import com.evotick.service.user.PaymentService;
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
public class PaymentServiceImpl implements PaymentService {

  @Override
  public void showForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String id = request.getParameter("id");
    String packageId = request.getParameter("package");

    Connection db = (Connection) request.getServletContext().getAttribute("db");

    Event event = new EventRepository().find(db, UUID.fromString(id));
    EventPackage data = new EventPackageRepository().find(db, UUID.fromString(packageId));
    
    request.setAttribute("event", event);
    request.setAttribute("data", data);
    
    System.out.println(data);

    RequestDispatcher rds = request.getRequestDispatcher("/WEB-INF/page/userPayment.jsp");
    rds.forward(request, response);
  }

  @Override
  public void handlePayment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String eventId = request.getParameter("eventId");
    String packageId = request.getParameter("packageId");
    String ticketCount = request.getParameter("ticketCount");
    String purchaseDate = request.getParameter("purchaseDate");
    String rekening = request.getParameter("rekening");
    String cvv = request.getParameter("cvv");
    Map<String, String> errors = new HashMap<>();
    
    if (eventId.isEmpty() || packageId.isEmpty() || ticketCount.isEmpty() || purchaseDate.isEmpty() || rekening.isEmpty() || cvv.isEmpty()) {
      if (eventId.isEmpty() || eventId.length() >= 50) {
        errors.put("eventId", "eventId is required and must less than 50 character");
      }
      if (packageId.isEmpty() || packageId.length() >= 50) {
        errors.put("packageId", "packageId is required and must less than 50 character");
      }
      if (ticketCount.isEmpty() || ticketCount.length() >= 50) {
        errors.put("ticketCount", "ticketCount is required and must less than 50 character");
      }
      if (purchaseDate.isEmpty() || purchaseDate.length() >= 50) {
        errors.put("purchaseDate", "purchaseDate is required and must less than 50 character");
      }
      if (rekening.isEmpty() || rekening.length() >= 255) {
        errors.put("rekening", "rekening is required and must less than 50 character");
      }
      if (cvv.isEmpty() || cvv.length() >= 150) {
        errors.put("cvv", "cvv is required and must less than 150 character");
      }

      request.setAttribute("errors", errors);
      RequestDispatcher rds = request.getRequestDispatcher("WEB-INF/page/register.jsp");
      rds.forward(request, response);
      return;
    }

    Connection db = (Connection) request.getServletContext().getAttribute("db");

    User user = new UserRepository().find(db, "email", email);

  }
  
}
