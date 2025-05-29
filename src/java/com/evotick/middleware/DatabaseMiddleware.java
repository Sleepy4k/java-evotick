/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/ServletListener.java to edit this template
 */
package com.evotick.middleware;

import java.sql.Connection;
import com.evotick.helper.DatabaseManager;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 *
 * @author Pandu
 */
public class DatabaseMiddleware implements ServletContextListener {

  @Override
  public void contextInitialized(ServletContextEvent sce) {
    ServletContext sc = sce.getServletContext();
    Connection connection = DatabaseManager.getConnection();
    sc.setAttribute("db", connection);
  }

  @Override
  public void contextDestroyed(ServletContextEvent sce) {
    DatabaseManager.closeConnection();
  }
}
