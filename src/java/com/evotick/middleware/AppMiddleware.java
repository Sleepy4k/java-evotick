/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/ServletListener.java to edit this template
 */
package com.evotick.middleware;

import com.evotick.config.AppConfig;
import com.evotick.helper.NonceGenerator;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 *
 * @author Pandu
 */
public class AppMiddleware implements ServletContextListener {

  @Override
  public void contextInitialized(ServletContextEvent sce) {
    ServletContext sc = sce.getServletContext();
    sc.setAttribute("appName", AppConfig.APP_NAME);
    sc.setAttribute("baseUrl", sc.getContextPath());
    sc.setAttribute("cspNonce", NonceGenerator.generateNonce(16));
  }

  @Override
  public void contextDestroyed(ServletContextEvent sce) {
  }
}
