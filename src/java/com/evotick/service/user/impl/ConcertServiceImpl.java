/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.service.user.impl;

import com.evotick.model.Event;
import com.evotick.repository.EventRepository;
import com.evotick.service.user.ConcertService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

/**
 *
 * @author Pandu
 */
public class ConcertServiceImpl implements ConcertService {

  @Override
  public void showPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Connection db = (Connection) request.getServletContext().getAttribute("db");

    List<Event> concerts = new EventRepository().findCustom(db, "event_type.title", "concert");

    request.setAttribute("concerts", concerts);

    RequestDispatcher rds = request.getRequestDispatcher("WEB-INF/page/kategoriConcert.jsp");
    rds.forward(request, response);
  }

}
