/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.service.user.impl;

import com.evotick.model.Transaction;
import com.evotick.model.User;
import com.evotick.repository.TransactionRepository;
import com.evotick.service.user.HistoryService;
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
public class HistoryServiceImpl implements HistoryService {

  @Override
  public void showPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Connection db = (Connection) request.getServletContext().getAttribute("db");

    User user = (User) request.getServletContext().getAttribute("user");
    List<Transaction> histories = new TransactionRepository().findCustom(db, "transactions.user_id", user.getId().toString());
    
    request.setAttribute("histories", histories);

    RequestDispatcher rds = request.getRequestDispatcher("/WEB-INF/page/userHistory.jsp");
    rds.forward(request, response);
  }
  
}
