/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.service.user.impl;

import com.evotick.model.Ticket;
import com.evotick.model.User;
import com.evotick.repository.TicketRepository;
import com.evotick.service.user.TicketService;
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

    User user = (User) request.getServletContext().getAttribute("user");
    List<Ticket> tickets = new TicketRepository().getUserTicket(db, "users.user_id", user.getId().toString());
    
      System.out.println(tickets.size());
    request.setAttribute("tickets", tickets);

    RequestDispatcher rds = request.getRequestDispatcher("WEB-INF/page/userTiket.jsp");
    rds.forward(request, response);
  }

}
