/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.service.admin.impl;

import com.evotick.model.Ticket;
import com.evotick.model.User;
import com.evotick.repository.TicketRepository;
import com.evotick.service.admin.TicketService;
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
public class TicketServiceImpl implements TicketService {

  @Override
  public void showPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Connection db = (Connection) request.getServletContext().getAttribute("db");

    List<Ticket> tickets = new TicketRepository().select(db, 0, 100);

    request.setAttribute("tickets", tickets);

    RequestDispatcher rds = request.getRequestDispatcher("WEB-INF/page/adminTicket.jsp");
    rds.forward(request, response);
  }
  
}
