/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.service.admin.impl;

import com.evotick.model.Event;
import com.evotick.repository.EventRepository;
import com.evotick.repository.TicketRepository;
import com.evotick.service.admin.EventService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public class EventServiceImpl implements EventService {

    @Override
    public void showPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection db = (Connection) request.getServletContext().getAttribute("db");

        List<Event> events = new EventRepository().select(db, 0, 100);

        int totalEvent = events.size();
        long totalTicket = new TicketRepository().count(db);
        long totalEventOnGoing = events.stream()
                .filter(event -> event.getEnd_date().before(new java.util.Date()))
                .count();
        long totalEventFinished = events.stream()
                .filter(event -> event.getEnd_date().after(new java.util.Date()))
                .count();

        request.setAttribute("events", events);
        request.setAttribute("totalEvent", totalEvent);
        request.setAttribute("totalTicket", totalTicket);
        request.setAttribute("totalEventOnGoing", totalEventOnGoing);
        request.setAttribute("totalEventFinished", totalEventFinished);

        RequestDispatcher rds = request.getRequestDispatcher("WEB-INF/page/adminEvent.jsp");
        rds.forward(request, response);
    }

    @Override
    public void handleCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void handleEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void handleDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
