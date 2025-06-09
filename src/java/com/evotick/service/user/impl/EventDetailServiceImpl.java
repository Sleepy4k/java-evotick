/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.service.user.impl;

import com.evotick.model.Event;
import com.evotick.model.EventPackage;
import com.evotick.repository.EventPackageRepository;
import com.evotick.repository.EventRepository;
import com.evotick.service.user.EventDetailService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.UUID;

/**
 *
 * @author Pandu
 */
public class EventDetailServiceImpl implements EventDetailService {

  @Override
  public void showPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String id = request.getParameter("id");

    Connection db = (Connection) request.getServletContext().getAttribute("db");

    Event event = new EventRepository().find(db, UUID.fromString(id));
    List<EventPackage> packages = new EventPackageRepository().findCustom(db, "event_package.event_id", id);
    
    request.setAttribute("event", event);
    request.setAttribute("packages", packages);
    System.out.println(event);

    RequestDispatcher rds = request.getRequestDispatcher("/WEB-INF/page/userDetailEvent.jsp");
    rds.forward(request, response);
  }
  
}
