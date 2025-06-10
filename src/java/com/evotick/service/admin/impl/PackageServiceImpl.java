/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.evotick.service.admin.impl;

import com.evotick.model.EventPackage;
import com.evotick.repository.EventPackageRepository;
import com.evotick.service.admin.PackageService;
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
public class PackageServiceImpl implements PackageService {

  @Override
  public void showPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Connection db = (Connection) request.getServletContext().getAttribute("db");

    List<EventPackage> packages = new EventPackageRepository().select(db, 0, 100);

    request.setAttribute("packages", packages);

    RequestDispatcher rds = request.getRequestDispatcher("WEB-INF/page/adminPackage.jsp");
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
